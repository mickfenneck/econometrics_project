%% 2) Analisi preliminare grafici

load('FTSEMIB.mat');        % caricamento dei dati nel workspace
y = FTSEMIB;                % definizione della serie
T = length(y);              % definizione di T come data presente
t = (1:T);                  % definizione del vettore del tempo

figure;                     % apertura nuova figura vuota
plot(y);                    % plot grafico della serie
h1 = gca;                   % definizione assi cartesiani
h1.XLim = [0,T];            % definizione asse delle ascisse
h1.XTick = [1 263 521 773 1024];
% definizione etichette asse ascisse
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
% definizione titolo grafico
title('Prezzo di chiusura FTSE MIB, Giugno 2011-Maggio 2016, frequenza giornaliera.');

ly = log(y);                % definizione serie trasformata logaritmica
figure;
plot(ly);
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
title('Trasformazione logaritmica di FTSE MIB.');

ma = tsmovavg(ly,'s',30,1);     % calcolo media mobile a 30 giorni
figure;
plot(t,ly,t,ma);
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
title('Media mobile a 30 giorni del FSTE MIB');


%% 3) Test DF per la verifica di stazionarietà
[h,pValue,stat] = adftest(ly);      % calcolo della statistica DF
table(h,stat,pValue)                % output del test
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end                                 % esito del test


dy = diff(ly);                      % calcolo delle differenze prime
figure;
plot(dy);
h2 = gca;
h2.XLim = [0,T];
h2.XTick = [1 263 521 773 1024];
h2.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
title('Differenze prime FTSE MIB');

[h,pValue,stat] = adftest(dy);
table(h,stat,pValue)
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end


%% 4) Analisi della distribuzione dei rendimenti
Media = mean(dy);
Varianza = var(dy);
Curtosi = kurtosis(dy);
Asimmetria = skewness(dy);
table(Media, Varianza, Curtosi, Asimmetria)
figure
subplot(2,2,1)
histogram(dy,60)
title('Istogramma serie dei rendimenti')

[f,dyi] = ksdensity(dy);
subplot(2,2,2)
plot(dyi,f)
title('Stima distribuzione di probabilità dei rendimenti')

subplot(2,2,3)
hold on
plot(dyi,f)
x = (-1:.1:1);
norm = normpdf(x,0,1);
plot(x,norm)
hold off
title('Confronto con una normale standard')

subplot(2,2,4)
qqplot(dy)

%% 5) Analisi del correlogramma empirico

K = (0:20)';                    % definizione vettore ritardi
ACF = autocorr(dy);             % calcolo ACF
PACF = parcorr(dy);             % calcolo PACF
table(K,ACF,PACF)
figure
autocorr(dy)                    % plot correlogramma ACF
figure
parcorr(dy)                     % plot correlogramma PACF


%% 6) Stima del modello ARIMA

Mdl = arima(1,1,0);           % definizione del modello ARIMA(1,1,0)
EstMdl10 = estimate(Mdl,ly);  % stima del modello definito sui dati della serie storica

Mdl = arima(0,1,1);             % ripetizione del procedimento
EstMdl01 = estimate(Mdl,ly);
Mdl = arima(1,1,1);
EstMdl11 = estimate(Mdl,ly);
Mdl = arima(2,1,1);
EstMdl21 = estimate(Mdl,ly);
Mdl = arima(1,1,2);
EstMdl12 = estimate(Mdl,ly);
Mdl = arima(2,1,2);
EstMdl22 = estimate(Mdl,ly);

% Per brevità espongo solo i risultati delle prime "prove", ma il metodo prosegue aumentando progressiva- mente il numero dei possibili ritardi e/o eliminando i ritardi intermedi considerati non significativamente diversi da zero.

Mdl = arima('ArLags',[1 5],'D',1,'MaLags',[1 5 6]);
EstMdl = estimate(Mdl,ly);
res = infer(EstMdl,ly);

%% 7) Analisi dei residui
%Valutiamo la qualità del modello specificato analizzando la distribuzione dei residui della regressione.

sy = (dy-res(2:end));
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
hold on
plot(dy)
plot(sy,'r')
legend('Valori osservati','Valori stimati')
title('Differenza tra valori osservati e stimati')
hold off

figure
plot(res./sqrt(EstMdl.Variance))        % plot dei residui standardizzati
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
title('Residui standardizzati')




figure
subplot(2,2,1)
histogram(res,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res)                           % correlogramma
subplot(2,2,4)
parcorr(res)



[h,p,Qstat,crit] = lbqtest(res,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% 8) Test per la presenza di effetti ARCH

 figure;
plot((res-mean(res)).^2);
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
figure;
subplot(2,1,1)
autocorr((res).^2);
subplot(2,1,2)
parcorr((res).^2);
[h,p,Qstat,crit] = lbqtest(res.^2,'lags',1);
table(h,Qstat,crit,p,'rownames',{'lbqtest'})
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end
[h,p] = archtest(res,'lags',1);     %Test di Engle
table(h,p,'rownames',{'Archtest'})
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end

%% 9) Selezione e stima modello GARCH

Mdl = egarch(0,1);
VarMdl = estimate(Mdl,res);

cv = infer(VarMdl,res);     % generazione della varianza condizionata
stres = (res./sqrt(cv));    % standardizzazione dei residui
[h,p,Qstat,crit] = lbqtest(cv.^2,'lags',2);
table(h,Qstat,crit,p,'rownames',{'lbqtest'})
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end
[h,p] = archtest(cv,'lags',2);         %Test di Engle
table(h,p,'rownames',{'Archtest'})
if h == 1
    fprintf('Rifiuto l''ipotesi nulla');
else
    fprintf('Non rifiuto l''ipotesi nulla');
end


figure;
subplot(2,1,1)

title('ACF residui standardizzati al quadrato');
subplot(2,1,2)
parcorr((stres).^2);
title('PACF residui standardizzati al quadrato');
figure
subplot(2,2,1)
plot(stres)
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
title('Residui standardizzati');
subplot(2,2,2)
qqplot(stres)
subplot(2,2,3)
autocorr(stres)
subplot(2,2,4)
parcorr(stres)
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
hold on
plot(res./sqrt(EstMdl.Variance))
plot(stres,'r');
hold off
title('Residui standardizzati con varianza EGARCH su residui standardizzati con varianza costante');
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
scatter(stres,res);
ylabel('Residui originali');
xlabel('Residui standardizzati');
title('Scatter plot residui standardizzati e residui originali')
autocorr((stres).^2);


%% 10) Previsione

[yf, vf] = forecast(EstMdl,30,'Y0',ly(1:1247));         % valore atteso condizionato
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
hold on
h2 = plot(ly,'Color',[.7,.7,.7]);
h3 = plot(1248:1277,yf,'b','LineWidth',2);
h4 = plot(1248:1277,yf + 1.96*sqrt(vf),'r:','LineWidth',2);
plot(1248:1277,yf - 1.96*sqrt(vf),'r:','LineWidth',2);
legend([h2 h3 h4],'Valori osservati','Previsione','Intervallo di confidenza al 95%','Location','NorthWest');
title('Simulazione previsione per 30 periodi e intervalli di confidenza al 95%')
hold off


cvf = forecast(VarMdl,30,'Y0',res(1:1247));         % varianza condizionata
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
hold on
plot(1:1247,cv(1:1247),'b','Color',[.7,.7,.7]);
plot(1248:1277,cvf,'r');
legend('Varianza condizionata','Previsione','Location','NorthEast');
title('Simulazione previsione varianza condizionata EGARCH(0,1) per 30 periodi');

Mdl = arima('ArLags',[1 5],'MaLags',[1 5 6]);  % simulazione rendimenti con varianza EGARCH
EstMdl2 = estimate(Mdl,dy);
yf2 = forecast(EstMdl2,100,'Y0',dy(1:1177));
cvf2 = forecast(VarMdl,100,'Y0',res(1:1177));
figure
h1 = gca;
h1.XLim = [0,T];
h1.XTick = [1 263 521 773 1024];
h1.XTickLabel = {'Giu 2011','Giu 2012','Giu 2013','Giu 2014','Giu 2015'};
hold on
h2 = plot(dy,'Color',[.7,.7,.7]);
h3 = plot(1178:1277,yf2,'b','LineWidth',2);
h4 = plot(1178:1277,yf2 + 1.96*sqrt(cvf2),'r:','LineWidth',2);
plot(1178:1277,yf2 - 1.96*sqrt(cvf2),'r:','LineWidth',2);
legend([h2 h3 h4],'Valori osservati','Previsione','Intervalli di confidenza al 95%','Location','NorthWest');
title('Simulazione previsione RENDIMENTI per 100 periodi e intervalli di confidenza al 95%')
hold off

%% 11) Previsioni

close all
