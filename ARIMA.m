%% ARIMA NASDAQ

load('NDX.mat');
y = NDX;
T = length(y);
t = (1:T);
ly = log(y);               
K = (0:20)';   
%% Stima modelli ARIMA
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
% ARIMA(2,1,0)
Mdl = arima(2,1,0);
EstMdl20 = estimate(Mdl,ly);
res20 = infer(EstMdl20,ly);
% ARIMA(0,1,2)
Mdl = arima(0,1,2);
EstMdl02 = estimate(Mdl,ly);
res02 = infer(EstMdl02,ly);
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
% ARIMA(2,1,0), 3-4
Mdl = arima('ArLags',[3 4],'D',1,'MaLags',[]);
EstMdl340 = estimate(Mdl,ly);
res340 = infer(EstMdl340,ly);
% ARIMA(0,1,2), 3-4
Mdl = arima('ArLags',[],'D',1,'MaLags',[3 4]);
EstMdl034 = estimate(Mdl,ly);
res034 = infer(EstMdl034,ly);
% ARIMA(2,1,2), 3-4
Mdl = arima('ArLags',[3 4],'D',1,'MaLags',[3 4]);
EstMdl3434 = estimate(Mdl,ly);
res3434 = infer(EstMdl3434,ly);


%% 3) Analisi dei residui
%Valutiamo la qualità del modello specificato analizzando la distribuzione dei residui della regressione.
%%
% _Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hendrerit tortor quis justo elementum, quis consequat felis facilisis. Curabitur volutpat est non felis feugiat, in iaculis elit tincidunt. Sed euismod est id semper hendrerit. Aenean non leo dapibus, posuere nulla rhoncus, posuere purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc convallis est in neque laoreet tristique. Sed tincidunt euismod egestas. Nam turpis nibh, gravida non faucibus ac, eleifend ac tortor.
% Morbi ultricies leo sed ante volutpat, sed vehicula enim malesuada. Nunc dui urna, iaculis vitae massa quis, facilisis rhoncus nibh. Nam feugiat efficitur velit sed laoreet. Curabitur id nunc ac neque sodales pulvinar ac vitae lectus. Aliquam eu iaculis nunc, at sagittis arcu. Phasellus tincidunt rutrum elit ac laoreet. Sed vestibulum ex id metus sodales, nec imperdiet tellus aliquet. Suspendisse facilisis augue sem, sed sodales nisl tincidunt sed._
% Praesent aliquam justo sit amet tellus accumsan, a imperdiet diam aliquet. Phasellus sagittis ex diam, molestie scelerisque augue cursus non. Quisque laoreet arcu et ex luctus convallis. Curabitur sit amet sapien mauris. Nam facilisis neque nec felis maximus, nec porttitor lorem congue. Aliquam erat volutpat. Donec sit amet turpis posuere, blandit lectus eget, ultrices nibh.
%
% Phasellus faucibus dolor mi, vel hendrerit erat lobortis sed. Praesent nec interdum elit. Vivamus consectetur nulla non elementum tempus. Phasellus id ipsum pulvinar, commodo sapien non, venenatis ante. In vitae lectus mattis, feugiat diam ac, cursus massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam ac egestas nisl. Sed ac hendrerit ex. Nulla neque est, malesuada et vehicula ultrices, ornare sit amet lacus. Quisque ut lacus tempor orci fermentum tincidunt facilisis ut quam. Sed eleifend sed enim vel auctor. Suspendisse potenti.
%
% Donec auctor sit amet eros eu lobortis. Suspendisse potenti. In sed diam vitae felis malesuada dictum. Fusce vehicula lacus mi, vitae ultrices tortor porta a. Donec neque ex, feugiat nec venenatis vitae, consectetur in lacus. Proin laoreet et dolor eu sagittis. Nam vitae placerat nulla. Cras laoreet turpis vel porttitor luctus. Nam et tincidunt est, vitae auctor purus. Nunc scelerisque cursus erat non condimentum. Integer sed faucibus libero. Integer at volutpat elit, ut rhoncus eros. Cras dolor erat, lobortis ac felis vitae, fermentum commodo massa. Duis velit nunc, suscipit a massa id, mollis efficitur dolor. Integer semper, leo sed aliquet vulputate, lorem nibh pellentesque elit, et tincidunt ligula lectus vel tellus.
% Donec auctor sit amet eros eu lobortis. Suspendisse potenti. In sed diam vitae felis malesuada dictum. Fusce vehicula lacus mi, vitae ultrices tortor porta a.
% Donec auctor sit amet eros eu lobortis. Suspendisse potenti. In sed diam vitae felis malesuada dictum. Fusce vehicula lacus mi, vitae ultrices tortor porta a. Donec neque ex, feugiat nec venenatis vitae, consectetur in lacus. Proin laoreet et dolor eu sagittis. Nam vitae placerat nulla. Cras laoreet turpis vel porttitor luctus. Nam et tincidunt est, vitae auctor purus. Nunc scelerisque cursus erat non condimentum. Integer sed faucibus libero. Integer at volutpat elit, ut rhoncus eros. Cras dolor erat, lobortis ac felis vitae, fermentum commodo massa. Duis velit nunc, suscipit a massa id, mollis efficitur dolor. Integer semper, leo sed aliquet vulputate, lorem nibh pellentesque elit, et tincidunt ligula lectus vel tellus.
% Donec auctor sit amet eros eu lobortis. Suspendisse potenti. In sed diam vitae felis malesuada dictum. Fusce vehicula lacus mi, vitae ultrices tortor porta a.

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

%% ARIMA(2,1,0)
figure
subplot(2,2,1)
histogram(res20,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res20)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res20)                           % correlogramma
subplot(2,2,4)
parcorr(res20)

%% ARIMA(0,1,2)
figure
subplot(2,2,1)
histogram(res02,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res02)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res02)                           % correlogramma
subplot(2,2,4)
parcorr(res02)

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

%% ARIMA(2,1,0) 3-4
figure
subplot(2,2,1)
histogram(res340,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res340)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res340)                           % correlogramma
subplot(2,2,4)
parcorr(res340)

%% ARIMA(0,1,2) 3-4
figure
subplot(2,2,1)
histogram(res034,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res034)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res034)                           % correlogramma
subplot(2,2,4)
parcorr(res034)

%% ARIMA(2,1,2)
figure
subplot(2,2,1)
histogram(res3434,60)                       % istogramma dei residui
title('Istogramma residui')
subplot(2,2,2)
qqplot(res3434)                             % qqplot dei residui
subplot(2,2,3)
autocorr(res3434)                           % correlogramma
subplot(2,2,4)
parcorr(res3434)


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

%% ARIMA(2,1,0)
[h,p,Qstat,crit] = lbqtest(res20,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(0,1,2)
[h,p,Qstat,crit] = lbqtest(res02,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
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

%% ARIMA(4,1,0)
[h,p,Qstat,crit] = lbqtest(res340,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(0,1,4)
[h,p,Qstat,crit] = lbqtest(res034,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

%% ARIMA(4,1,4)
[h,p,Qstat,crit] = lbqtest(res3434,'lags',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]);
names = {'K';'H';'pvalue';'Qstat';'Crit'};
table(K(2:end),h',p',Qstat',crit','VariableNames',names)        % creazione tabella ouput

