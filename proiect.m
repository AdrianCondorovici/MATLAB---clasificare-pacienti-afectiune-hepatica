%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dataset1 fara afectiune hepatica/2-afectiune hepatica %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nume_baza_de_date: liver1.xl
%% Apelarea bazei de date si identificarea proprietatilor si a atributiilor inainte de prelucrarea datelor
clear all
close all
clc
cale='C:\Lab_Matlab\AIAIM\proiect\';
nume_fis='liver1.xlsx';
T = readtable([cale nume_fis]);
proprietati=T.Properties
proprietati.VariableNames
summary(T)

T1=T;
T2=T;

deSters = T1.Dataset == 1;
T1(deSters,:) = [];
deSters = T2.Dataset == 0;
T2(deSters,:) = [];
% determinarea numarului de valori lipsa

%% Corectarea inconsecventelor in sistemele de notare, sortarea datelor si eliminarea celor considerate introduse gresit


% sortarea datelor dupa sex si varsta pentru a facilita citirea acestora
A=sortrows(T,{'Gender','Age'})

% remedierea inconsecventelor determinate de introducerea datelor
[r,c]=find(A.Gender=="male")
A.Gender(r)={'Male'};
[r,c]=find(A.Gender=="female")
A.Gender(r)={'Female'}


% redenumirea unor variablie si inlocuirea acestora cu unele conventionale
A.Properties.VariableNames{'Dataset'} = 'Afectiune_hepatica';
A.Afectiune_hepatica(A.Afectiune_hepatica == 1)= 0 ;
A.Afectiune_hepatica(A.Afectiune_hepatica == 2)= 1 ;
%%


%{
[r,c]=find(A.Afectiune_hepatica==0)
A1=A(r,:);
writetable(A1);

[r,c]=find(A.Afectiune_hepatica==1)
A2=A(r,:);
writetable(A2);


% inlocuirea valorilor extreme cu valorile anterioare
A1.Age = filloutliers(A1.Age, 'previous' );
A1.Total_Bilirubin = filloutliers(A1.Total_Bilirubin, 'previous' );
A1.Direct_Bilirubin = filloutliers(A1.Direct_Bilirubin, 'previous' );
A1.Alkaline_Phosphotase = filloutliers(A1.Alkaline_Phosphotase, 'previous' );
A1.Alamine_Aminotransferase = filloutliers(A1.Alamine_Aminotransferase, 'previous' );
A1.Aspartate_Aminotransferase = filloutliers(A1.Aspartate_Aminotransferase, 'previous' );
A1.Total_Protiens = filloutliers(A1.Total_Protiens, 'previous' );
A1.Albumin = filloutliers(A1.Albumin, 'previous' );
A1.Albumin_and_Globulin_Ratio = filloutliers(A1.Albumin_and_Globulin_Ratio, 'previous' );

% inlocuire valori lipsa cu valoarea mediana
A1.Age= fillmissing(A1.Age,'movmedian',10); 
A1.Total_Bilirubin= fillmissing(A1.Total_Bilirubin,'movmedian',10); 
A1.Direct_Bilirubin= fillmissing(A1.Direct_Bilirubin,'movmedian',10); 
A1.Alkaline_Phosphotase= fillmissing(A1.Alkaline_Phosphotase,'movmedian',10); 
A1.Alamine_Aminotransferase= fillmissing(A1.Alamine_Aminotransferase,'movmedian',10); 
A1.Aspartate_Aminotransferase= fillmissing(A1.Aspartate_Aminotransferase,'movmedian',10); 
A1.Total_Protiens= fillmissing(A1.Total_Protiens,'movmedian',10); 
A1.Albumin= fillmissing(A1.Albumin,'movmedian',10); 
A1.Albumin_and_Globulin_Ratio= fillmissing(A1.Albumin_and_Globulin_Ratio,'movmedian',10); 

% inlocuirea valorilor extreme cu valorile anterioare
A2.Age = filloutliers(A2.Age, 'previous' );
A2.Total_Bilirubin = filloutliers(A2.Total_Bilirubin, 'previous' );
A2.Direct_Bilirubin = filloutliers(A2.Direct_Bilirubin, 'previous' );
A2.Alkaline_Phosphotase = filloutliers(A2.Alkaline_Phosphotase, 'previous' );
A2.Alamine_Aminotransferase = filloutliers(A2.Alamine_Aminotransferase, 'previous' );
A2.Aspartate_Aminotransferase = filloutliers(A2.Aspartate_Aminotransferase, 'previous' );
A2.Total_Protiens = filloutliers(A2.Total_Protiens, 'previous' );
A2.Albumin = filloutliers(A2.Albumin, 'previous' );
A2.Albumin_and_Globulin_Ratio = filloutliers(A2.Albumin_and_Globulin_Ratio, 'previous' );

% inlocuire valori lipsa cu valoarea mediana
A2.Age= fillmissing(A2.Age,'movmedian',10); 
A2.Total_Bilirubin= fillmissing(A2.Total_Bilirubin,'movmedian',10); 
A2.Direct_Bilirubin= fillmissing(A2.Direct_Bilirubin,'movmedian',10); 
A2.Alkaline_Phosphotase= fillmissing(A2.Alkaline_Phosphotase,'movmedian',10); 
A2.Alamine_Aminotransferase= fillmissing(A2.Alamine_Aminotransferase,'movmedian',10); 
A2.Aspartate_Aminotransferase= fillmissing(A2.Aspartate_Aminotransferase,'movmedian',10); 
A2.Total_Protiens= fillmissing(A2.Total_Protiens,'movmedian',10); 
A2.Albumin= fillmissing(A2.Albumin,'movmedian',10); 
A2.Albumin_and_Globulin_Ratio= fillmissing(A2.Albumin_and_Globulin_Ratio,'movmedian',10); 
%}

% inlocuirea valorilor extreme cu valorile anterioare
A.Age = filloutliers(A.Age, 'previous' );
A.Total_Bilirubin = filloutliers(A.Total_Bilirubin, 'previous' );
A.Direct_Bilirubin = filloutliers(A.Direct_Bilirubin, 'previous' );
A.Alkaline_Phosphotase = filloutliers(A.Alkaline_Phosphotase, 'previous' );
A.Alamine_Aminotransferase = filloutliers(A.Alamine_Aminotransferase, 'previous' );
A.Aspartate_Aminotransferase = filloutliers(A.Aspartate_Aminotransferase, 'previous' );
A.Total_Protiens = filloutliers(A.Total_Protiens, 'previous' );
A.Albumin = filloutliers(A.Albumin, 'previous' );
A.Albumin_and_Globulin_Ratio = filloutliers(A.Albumin_and_Globulin_Ratio, 'previous' );

% inlocuire valori lipsa cu valoarea mediana
A.Age= fillmissing(A.Age,'movmedian',10); 
A.Total_Bilirubin= fillmissing(A.Total_Bilirubin,'movmedian',10); 
A.Direct_Bilirubin= fillmissing(A.Direct_Bilirubin,'movmedian',10); 
A.Alkaline_Phosphotase= fillmissing(A.Alkaline_Phosphotase,'movmedian',10); 
A.Alamine_Aminotransferase= fillmissing(A.Alamine_Aminotransferase,'movmedian',10); 
A.Aspartate_Aminotransferase= fillmissing(A.Aspartate_Aminotransferase,'movmedian',10); 
A.Total_Protiens= fillmissing(A.Total_Protiens,'movmedian',10); 
A.Albumin= fillmissing(A.Albumin,'movmedian',10); 
A.Albumin_and_Globulin_Ratio= fillmissing(A.Albumin_and_Globulin_Ratio,'movmedian',10); 
A1=A;
A2=A;

deSters = A1.Afectiune_hepatica == 1;
A1(deSters,:) = [];
deSters = A2.Afectiune_hepatica == 0;
A2(deSters,:) = [];



%numarul de valori lipsa dupa prelucrarea datelor
TFA = nnz(ismissing(A))

%%
min11=min(T.Age)
max11=max(T.Age)
ave11=mean(T.Age)
med11=median(T.Age)
std11=std(T.Age)

min12=min(A.Total_Bilirubin)
max12=max(A.Total_Bilirubin)
ave12=mean(A.Total_Bilirubin)
med12=median(A.Total_Bilirubin)
std12=std(A.Total_Bilirubin)

min13=min(A.Direct_Bilirubin)
max13=max(A.Direct_Bilirubin)
ave13=mean(A.Direct_Bilirubin)
med13=median(A.Direct_Bilirubin)
std13=std(A.Direct_Bilirubin)

min14=min(A.Alkaline_Phosphotase)
max14=max(A.Alkaline_Phosphotase)
ave14=mean(A.Alkaline_Phosphotase)
med14=median(A.Alkaline_Phosphotase)
std14=std(A.Alkaline_Phosphotase)

min15=min(A.Alamine_Aminotransferase)
max15=max(A.Alamine_Aminotransferase)
ave15=mean(A.Alamine_Aminotransferase)
med15=median(A.Alamine_Aminotransferase)
std15=std(A.Alamine_Aminotransferase)

min16=min(A.Aspartate_Aminotransferase)
max16=max(A.Aspartate_Aminotransferase)
ave16=mean(A.Aspartate_Aminotransferase)
med16=median(A.Aspartate_Aminotransferase)
std16=std(A.Aspartate_Aminotransferase)

min17=min(A.Total_Protiens)
max17=max(A.Total_Protiens)
ave17=mean(A.Total_Protiens)
med17=median(A.Total_Protiens)
std17=std(A.Total_Protiens)

min18=min(A.Albumin)
max18=max(A.Albumin)
ave18=mean(A.Albumin)
med18=median(A.Albumin)
std18=std(A.Albumin)

min19=min(A.Albumin_and_Globulin_Ratio)
max19=max(A.Albumin_and_Globulin_Ratio)
ave19=mean(A.Albumin_and_Globulin_Ratio)
med19=median(A.Albumin_and_Globulin_Ratio)
std19=std(A.Albumin_and_Globulin_Ratio)

%% Histograme si boxplot inainte de prelucrarea datelor
% Histograme pentru pacientii fara afectiune hepatica 
figure(1)
sgtitle('Histograme inainte de prelucrarea datelor (fara afectiune)') 
subplot(3,3,1)
histogram( T1.Age ,300)
title('Varsta pacientilor')

subplot(3,3,2)
histogram( T1.Total_Bilirubin ,300)
title('Total Bilirubina')

subplot(3,3,3)
histogram( T1.Direct_Bilirubin ,300)
title('Direct Bilirubin')

subplot(3,3,4)
histogram( T1.Alkaline_Phosphotase ,300)
title('Alkaline Phosphotase')

subplot(3,3,5)
histogram( T1.Alamine_Aminotransferase ,300)
title('Alamine Aminotransferase')

subplot(3,3,6)
histogram( T1.Aspartate_Aminotransferase ,300)
title('Aspartate Aminotransferase')

subplot(3,3,7)
histogram( T1.Total_Protiens ,300)
title('Total Protiens')

subplot(3,3,8)
histogram( T1.Albumin ,300)
title('Albumin')

subplot(3,3,9)
histogram( T1.Albumin_and_Globulin_Ratio ,300)
title('Albumin and Globulin Ratio')

% Boxplot pentru pacientii fara afectiune hepatica 
figure(2)
sgtitle('Histograme inainte de prelucrarea datelor (fara afectiune)') 
subplot(3,3,1)
boxplot(T1.Age)
title('Varsta pacientilor')

subplot(3,3,2)
boxplot(T1.Total_Bilirubin)
title('Total Bilirubina')

subplot(3,3,3)
boxplot(T1.Direct_Bilirubin)
title('Direct Bilirubin')

subplot(3,3,4)
boxplot(T1.Alkaline_Phosphotase)
title('Alkaline Phosphotase')

subplot(3,3,5)
boxplot(T1.Alamine_Aminotransferase)
title('Alamine Aminotransferase')

subplot(3,3,6)
boxplot(T1.Aspartate_Aminotransferase)
title('Aspartate Aminotransferase')

subplot(3,3,7)
boxplot(T1.Total_Protiens)
title('Total Protiens')

subplot(3,3,8)
boxplot(T1.Albumin)
title('Albumin')

subplot(3,3,9)
boxplot(T1.Albumin_and_Globulin_Ratio)
title('Albumin and Globulin Ratio')

% Histograme pentru pacientii cu afectiune hepatica 
figure(3)
sgtitle('Histograme inainte de prelucrarea datelor (cu afectiune)') 
subplot(3,3,1)
histogram( T2.Age ,300)
title('Varsta pacientilor')

subplot(3,3,2)
histogram( T2.Total_Bilirubin ,300)
title('Total Bilirubina')

subplot(3,3,3)
histogram( T2.Direct_Bilirubin ,300)
title('Direct Bilirubin')

subplot(3,3,4)
histogram( T2.Alkaline_Phosphotase ,300)
title('Alkaline Phosphotase')

subplot(3,3,5)
histogram( T2.Alamine_Aminotransferase ,300)
title('Alamine Aminotransferase')

subplot(3,3,6)
histogram( T2.Aspartate_Aminotransferase ,300)
title('Aspartate Aminotransferase')

subplot(3,3,7)
histogram( T2.Total_Protiens ,300)
title('Total Protiens')

subplot(3,3,8)
histogram( T2.Albumin ,300)
title('Albumin')

subplot(3,3,9)
histogram( T2.Albumin_and_Globulin_Ratio ,300)
title('Albumin and Globulin Ratio')

% Boxplot pentru pacientii cu afectiune hepatica 
figure(4)
sgtitle('Histograme inainte de prelucrarea datelor (cu afectiune)') 
subplot(3,3,1)
boxplot(T2.Age)
title('Varsta pacientilor')

subplot(3,3,2)
boxplot(T2.Total_Bilirubin)
title('Total Bilirubina')

subplot(3,3,3)
boxplot(T2.Direct_Bilirubin)
title('Direct Bilirubin')

subplot(3,3,4)
boxplot(T2.Alkaline_Phosphotase)
title('Alkaline Phosphotase')

subplot(3,3,5)
boxplot(T2.Alamine_Aminotransferase)
title('Alamine Aminotransferase')

subplot(3,3,6)
boxplot(T2.Aspartate_Aminotransferase)
title('Aspartate Aminotransferase')

subplot(3,3,7)
boxplot(T2.Total_Protiens)
title('Total Protiens')

subplot(3,3,8)
boxplot(T2.Albumin)
title('Albumin')

subplot(3,3,9)
boxplot(T2.Albumin_and_Globulin_Ratio)
title('Albumin and Globulin Ratio')

%% Histograme si boxplot dupa prelucrarea datelor
% Histograme dupa prelucrarea datelor pentru pacientii fara afectiune
figure(5)
sgtitle('Histograme dupa prelucrarea datelor (fara afectiune)') 
subplot(3,3,1)
histogram( A1.Age ,300)
title('Varsta pacientilor')

subplot(3,3,2)
histogram( A1.Total_Bilirubin ,300)
title('Total Bilirubina')

subplot(3,3,3)
histogram( A1.Direct_Bilirubin ,300)
title('Direct Bilirubin')

subplot(3,3,4)
histogram( A1.Alkaline_Phosphotase ,300)
title('Alkaline Phosphotase')

subplot(3,3,5)
histogram( A1.Alamine_Aminotransferase ,300)
title('Alamine Aminotransferase')

subplot(3,3,6)
histogram( A1.Aspartate_Aminotransferase ,300)
title('Aspartate Aminotransferase')

subplot(3,3,7)
histogram( A1.Total_Protiens ,300)
title('Total Protiens')

subplot(3,3,8)
histogram( A1.Albumin ,300)
title('Albumin')

subplot(3,3,9)
histogram( A1.Albumin_and_Globulin_Ratio ,300)
title('Albumin and Globulin Ratio')

% Boxplot dupa prelucrarea datelor pentru pacientii fara afectiune
figure(6)
sgtitle('Histograme dupa prelucrarea datelor (fara afectiune)') 
subplot(3,3,1)
boxplot(A1.Age)
title('Varsta pacientilor')

subplot(3,3,2)
boxplot(A1.Total_Bilirubin)
title('Total Bilirubina')

subplot(3,3,3)
boxplot(A1.Direct_Bilirubin)
title('Direct Bilirubin')

subplot(3,3,4)
boxplot(A1.Alkaline_Phosphotase)
title('Alkaline Phosphotase')

subplot(3,3,5)
boxplot(A1.Alamine_Aminotransferase)
title('Alamine Aminotransferase')

subplot(3,3,6)
boxplot(A1.Aspartate_Aminotransferase)
title('Aspartate Aminotransferase')

subplot(3,3,7)
boxplot(A1.Total_Protiens)
title('Total Protiens')

subplot(3,3,8)
boxplot(A1.Albumin)
title('Albumin')

subplot(3,3,9)
boxplot(A1.Albumin_and_Globulin_Ratio)
title('Albumin and Globulin Ratio')

% Histograme dupa prelucrarea datelor pentru pacientii cu afectiune
figure(7)
sgtitle('Histograme dupa prelucrarea datelor (cu afectiune)') 
subplot(3,3,1)
histogram( A2.Age ,300)
title('Varsta pacientilor')

subplot(3,3,2)
histogram( A2.Total_Bilirubin ,300)
title('Total Bilirubina')

subplot(3,3,3)
histogram( A2.Direct_Bilirubin ,300)
title('Direct Bilirubin')

subplot(3,3,4)
histogram( A2.Alkaline_Phosphotase ,300)
title('Alkaline Phosphotase')

subplot(3,3,5)
histogram( A2.Alamine_Aminotransferase ,300)
title('Alamine Aminotransferase')

subplot(3,3,6)
histogram( A2.Aspartate_Aminotransferase ,300)
title('Aspartate Aminotransferase')

subplot(3,3,7)
histogram( A2.Total_Protiens ,300)
title('Total Protiens')

subplot(3,3,8)
histogram( A2.Albumin ,300)
title('Albumin')

subplot(3,3,9)
histogram( A2.Albumin_and_Globulin_Ratio ,300)
title('Albumin and Globulin Ratio')

% Boxplot dupa prelucrarea datelor pentru pacientii cu afectiune
figure(8)
sgtitle('Histograme dupa prelucrarea datelor (cu afectiune)') 
subplot(3,3,1)
boxplot(A2.Age)
title('Varsta pacientilor')

subplot(3,3,2)
boxplot(A2.Total_Bilirubin)
title('Total Bilirubina')

subplot(3,3,3)
boxplot(A2.Direct_Bilirubin)
title('Direct Bilirubin')

subplot(3,3,4)
boxplot(A2.Alkaline_Phosphotase)
title('Alkaline Phosphotase')

subplot(3,3,5)
boxplot(A2.Alamine_Aminotransferase)
title('Alamine Aminotransferase')

subplot(3,3,6)
boxplot(A2.Aspartate_Aminotransferase)
title('Aspartate Aminotransferase')

subplot(3,3,7)
boxplot(A2.Total_Protiens)
title('Total Protiens')

subplot(3,3,8)
boxplot(A2.Albumin)
title('Albumin')

subplot(3,3,9)
boxplot(A2.Albumin_and_Globulin_Ratio)
title('Albumin and Globulin Ratio')

%{
newNames=[A. Properties. VariableNames , 'Cu_afectiune'];

for ii=1:size(A,1)
 if(A.Afectiune_hepatica(ii)>0)
col_noua(ii)=1;
else
 col_noua(ii)=0;
end
end
AC=table(col_noua');
A=[A AC];

A. Properties. VariableNames = newNames ;
%}

%% Clasificatori pentru invatarea automata. Naïve Bayes
procent_retinut=25;
indice_testare=randperm(size(A,1), round(procent_retinut/100*size(A,1)));
A_testare=A(indice_testare,:)
A_antrenare=setdiff(A,A_testare);

Y1=A_antrenare(:,2:end-1); %atribute antrenare
Y=A_antrenare(:,11); %raspuns antrenare

X=A_testare(:,2:end-1); %atribute testare

status_adevar=A_testare(:,end); %raspuns testare

Mdl = fitcnb(Y1,Y); % antrenare model tree

status_predict = predict(Mdl,X); %raspuns model

status_adevarL(table2array(status_adevar)==0)={'fara afectiune'};
status_adevarL(table2array(status_adevar)==1)={'afectiune'};
status_predictL(status_predict=='0')={'fara afectiune'};
status_predictL(status_predict==1)={'afectiune'};

figure;
cm2 = confusionchart(status_adevarL,status_predictL);
sortClasses(cm2,["afectiune","fara afectiune"])
cm2.XLabel='predictie';
cm2.YLabel='adevar';
cm2.Title='Naive Bayes';

%% metricilor de evaluare a performantei modelului Naive Bayes
nb=metrici(table2array(status_adevar),status_predict)

%% Curba ROC
A3=A;
[X1,Y1,A4,AUC] = perfcurve(table2array(status_adevar),status_predict,true);
figure
plot(X1,Y1, 'linewidth',3)
legend(['AUC = ' num2str(AUC)])
xlabel('1-Specificitate')
ylabel('Sensibilitate')
title('ROC Naive Bayes')

%%
% separare atribute si etichete pentru cele 2 seturi
ind_atribute=1:size(A_testare,2)-1;
X=A_testare(:,ind_atribute);
status_adevar=A_testare.Afectiune_hepatica;
Y=A_antrenare(:,ind_atribute);
Y=A_antrenare.Afectiune_hepatica;
% antrenare si predictie model Naïve Bayes
Mdl=fitcnb(Y,A_antrenare);
status_predict=predict(Mdl,X);
% conversie etichete clase
status_adevarL(status_adevar==1)={'normal'};
status_adevarL(status_adevar==3)={'anormal'};
status_predictL(status_predict==1)={'normal'};
status_predictL(status_predict==3)={'anormal'};
% generare matrice de contingenta (confuzie) si calcul metrici de performanta
figure;
cm2 = confusionchart(status_adevarL,status_predictL);
sortClasses(cm2,["anormal","normal"])
cm2.XLabel='predictie';
cm2.YLabel='adevar';