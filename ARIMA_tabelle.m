%% ARIMA NASDAQ  

%% 1) Stima modelli ARIMA
load('NDX.mat');
y = NDX;
T = length(y);
t = (1:T);
ly = log(y);
K = (0:20)'; 

%ARIMA(1,1,0)
Mdl = arima(1,1,0);           % definizione del modello ARIMA(1,1,0)
EstMdl10 = estimate(Mdl,ly);  % stima del modello definito sui dati della serie storica
res10 = infer(EstMdl10,ly);
% ARIMA(0,1,1)
Mdl = arima(0,1,1);             
EstMdl01 = estimate(Mdl,ly);
res01 = infer(EstMdl01,ly);
% ARIMA(1,1,1)
Mdl = arima(1,1,1);
EstMdl11 = estimate(Mdl,ly);
res11 = infer(EstMdl11,ly);
% ARIMA(2,1,1)
Mdl = arima(2,1,1);
EstMdl21 = estimate(Mdl,ly);
res21 = infer(EstMdl21,ly);
% ARIMA(1,1,2)
Mdl = arima(1,1,2);
EstMdl12 = estimate(Mdl,ly);
res12 = infer(EstMdl12,ly);
% ARIMA(2,1,2)
Mdl = arima(2,1,2);
EstMdl22 = estimate(Mdl,ly);
res22 = infer(EstMdl22,ly);
% ARIMA(3,1,1)
Mdl = arima(2,1,1);
EstMdl31 = estimate(Mdl,ly);
res31 = infer(EstMdl31,ly);
% ARIMA(3,1,2)
Mdl = arima(2,1,1);
EstMdl32 = estimate(Mdl,ly);
res32 = infer(EstMdl32,ly);
% ARIMA(1,1,3)
Mdl = arima(1,1,2);
EstMdl13 = estimate(Mdl,ly);
res13 = infer(EstMdl13,ly);
% ARIMA(2,1,3)
Mdl = arima(1,1,2);
EstMdl23 = estimate(Mdl,ly);
res23 = infer(EstMdl23,ly);
% ARIMA(3,1,3)
Mdl = arima(2,1,2);
EstMdl33 = estimate(Mdl,ly);
res33 = infer(EstMdl33,ly);

%% 2) GRAFICI
%
%Valutiamo la qualità del modello specificato analizzando la distribuzione dei residui della regressione.

%% ARIMA(1,1,0)
figure
subplot(2,2,1)
histogram(res10,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res10)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res10)                           % correlogramma
subplot(2,2,4)
parcorr(res10)

%% ARIMA(0,1,1)
figure
subplot(2,2,1)
histogram(res01,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res01)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res01)                           % correlogramma
subplot(2,2,4)
parcorr(res01)

%% ARIMA(0,1,1)
figure
subplot(2,2,1)
histogram(res11,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res11)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res11)                           % correlogramma
subplot(2,2,4)
parcorr(res11)

%% ARIMA(1,1,1)
figure
subplot(2,2,1)
histogram(res11,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res11)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res11)                           % correlogramma
subplot(2,2,4)
parcorr(res11)

%% ARIMA(2,1,1)
figure
subplot(2,2,1)
histogram(res21,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res21)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res21)                           % correlogramma
subplot(2,2,4)
parcorr(res21)

%% ARIMA(1,1,2)
figure
subplot(2,2,1)
histogram(res12,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res12)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res12)                           % correlogramma
subplot(2,2,4)
parcorr(res12)

%% ARIMA(2,1,2)
figure
subplot(2,2,1)
histogram(res22,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res22)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res22)                           % correlogramma
subplot(2,2,4)
parcorr(res22)

%% ARIMA(3,1,1)
figure
subplot(2,2,1)
histogram(res31,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res31)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res31)                           % correlogramma
subplot(2,2,4)
parcorr(res31)

%% ARIMA(3,1,2)
figure
subplot(2,2,1)
histogram(res32,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res32)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res32)                           % correlogramma
subplot(2,2,4)
parcorr(res32)

%% ARIMA(1,1,3)
figure
subplot(2,2,1)
histogram(res13,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res13)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res13)                           % correlogramma
subplot(2,2,4)
parcorr(res13)

%% ARIMA(2,1,3)
figure
subplot(2,2,1)
histogram(res23,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res23)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res23)                           % correlogramma
subplot(2,2,4)
parcorr(res23)

%% ARIMA(3,1,3)
figure
subplot(2,2,1)
histogram(res33,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res33)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res33)                           % correlogramma
subplot(2,2,4)
parcorr(res33)

%% 3) TABELLE
%Valutiamo la qualità del modello specificato analizzando la distribuzione dei residui della regressione.

%% ARIMA(1,1,0)
[h,p,Qstat,crit] = lbqtest(res10,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(0,1,1)
[h,p,Qstat,crit] = lbqtest(res01,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(0,1,1)
[h,p,Qstat,crit] = lbqtest(res11,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(1,1,1)
[h,p,Qstat,crit] = lbqtest(res11,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(2,1,1)
[h,p,Qstat,crit] = lbqtest(res21,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(1,1,2)
[h,p,Qstat,crit] = lbqtest(res12,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(2,1,2)
[h,p,Qstat,crit] = lbqtest(res22,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput


%% ARIMA(3,1,1)
[h,p,Qstat,crit] = lbqtest(res31,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(3,1,2)
[h,p,Qstat,crit] = lbqtest(res32,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(1,1,3)
[h,p,Qstat,crit] = lbqtest(res13,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(2,1,3)
[h,p,Qstat,crit] = lbqtest(res23,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(3,1,3)
[h,p,Qstat,crit] = lbqtest(res33,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput
