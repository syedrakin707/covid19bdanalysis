
%%To Parvez Bhai,four ANFIS objects have been made
%%ANFIS 1 is Days against Increase Percentage in Confirmed Cases
%%ANFIS 2 is Days against Confirmed Cases
%%ANFIS 3 is Days against Increase Percentage in Deaths
%%ANFIS 4 is Days against Deaths
days_full = DAYS;
cases_cf_full = CASES_CF; cases_cf_increment_full = CASES_CF_CIP;
deaths_cf_full = DEATHS_CF; deaths_cf_increment_full = DEATHS_CF_CIP;
cured_cf_full = CURED_CF; cured_cf_increment_full = CURED_CF_CIP;
cases_daily_full = CASES_DAILY; cases_daily_increment_full = CASES_DAILY_CIP;
deaths_daily_full = DEATHS_DAILY; deaths_daily_increment_full = DEATHS_DAILY_CIP;
cured_daily_full = CURED_DAILY; cured_daily_increment_full = CURED_DAILY_CIP;

days_train = days_full(1:76);
days_test = days_full(77:86);

cases_cf_train = cases_cf_full(1:76);
deaths_cf_train = deaths_cf_full(1:76);
cases_cf_increment_train = cases_cf_increment_full(1:76);
deaths_cf_increment_train = deaths_cf_increment_full(1:76);
cured_cf_train = cured_cf_full(1:76);
cured_cf_increment_train = cured_cf_increment_full(1:76);
cases_daily_train = cases_daily_full(1:76);
cases_daily_increment_train = cases_daily_increment_full(1:76);
deaths_daily_train = deaths_daily_full(1:76);
deaths_daily_increment_train = deaths_daily_increment_full(1:76);
cured_daily_train = cured_daily_full(1:76);
cured_daily_increment_train = cured_daily_full(1:76);

cases_cf_test = cases_cf_full(77:86);
deaths_cf_test = deaths_cf_full(77:86);
cases_cf_increment_test = cases_cf_increment_full(77:86);
deaths_cf_increment_test = deaths_cf_increment_full(77:86);
cured_cf_test = cured_cf_full(77:86);
cured_cf_increment_test = cured_cf_increment_full(77:86);
cases_daily_test = cases_daily_full(77:86);
cases_daily_increment_test = cases_daily_increment_full(77:86);
deaths_daily_test = deaths_daily_full(77:86);
deaths_daily_increment_test = deaths_daily_increment_full(77:86);
cured_daily_test = cured_daily_full(77:86);
cured_daily_increment_test = cured_daily_full(77:86);

genOpt = genfisOptions('GridPartition');
genOpt.NumMembershipFunctions = 5;
genOpt.InputMembershipFunctionType = 'gbellmf';
genOpt.OutputMembershipFunctionType = 'linear';
inFIS = genfis(days_train,cases_cf_train,genOpt);
inFIS2 = genfis(days_train,deaths_cf_train,genOpt);
inFIS3 = genfis(days_train,cases_cf_increment_train,genOpt);
inFIS4 = genfis(days_train,deaths_cf_increment_train,genOpt);
inFIS5 = genfis(days_train,cured_cf_train,genOpt);
inFIS6 = genfis(days_train,cured_cf_increment_train,genOpt);
inFIS7 = genfis(days_train,cases_daily_train,genOpt);
inFIS8 = genfis(days_train,cases_daily_increment_train,genOpt);
inFIS9 = genfis(days_train,deaths_daily_train,genOpt);
inFIS10 = genfis(days_train,deaths_daily_increment_train,genOpt);
inFIS11 = genfis(days_train,cured_daily_train,genOpt);
inFIS12 = genfis(days_train,cured_daily_increment_train,genOpt);

opt = anfisOptions('InitialFIS',inFIS,'EpochNumber',100);
opt.StepSizeIncreaseRate = 1.10;
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;
opt.ValidationData = [days_test cases_cf_test];

opt2 = anfisOptions('InitialFIS',inFIS2,'EpochNumber',100);
opt2.StepSizeIncreaseRate = 1.10;
opt2.DisplayANFISInformation = 0;
opt2.DisplayErrorValues = 0;
opt2.DisplayStepSize = 0;
opt2.DisplayFinalResults = 0;
opt2.ValidationData = [days_test deaths_cf_test];

opt3 = anfisOptions('InitialFIS',inFIS3,'EpochNumber',100);
opt3.StepSizeIncreaseRate = 1.10;
opt3.DisplayANFISInformation = 0;
opt3.DisplayErrorValues = 0;
opt3.DisplayStepSize = 0;
opt3.DisplayFinalResults = 0;
opt3.ValidationData = [days_test cases_cf_increment_test];

opt4 = anfisOptions('InitialFIS',inFIS4,'EpochNumber',100);
opt4.StepSizeIncreaseRate = 1.10;
opt4.DisplayANFISInformation = 0;
opt4.DisplayErrorValues = 0;
opt4.DisplayStepSize = 0;
opt4.DisplayFinalResults = 0;
opt4.ValidationData = [days_test deaths_cf_increment_test];

opt5 = anfisOptions('InitialFIS',inFIS5,'EpochNumber',100);
opt5.StepSizeIncreaseRate = 1.10;
opt5.DisplayANFISInformation = 0;
opt5.DisplayErrorValues = 0;
opt5.DisplayStepSize = 0;
opt5.DisplayFinalResults = 0;
opt5.ValidationData = [days_test cured_cf_test];

opt6 = anfisOptions('InitialFIS',inFIS6,'EpochNumber',100);
opt6.StepSizeIncreaseRate = 1.10;
opt6.DisplayANFISInformation = 0;
opt6.DisplayErrorValues = 0;
opt6.DisplayStepSize = 0;
opt6.DisplayFinalResults = 0;
opt6.ValidationData = [days_test cured_cf_increment_test];

opt7 = anfisOptions('InitialFIS',inFIS7,'EpochNumber',100);
opt7.StepSizeIncreaseRate = 1.10;
opt7.DisplayANFISInformation = 0;
opt7.DisplayErrorValues = 0;
opt7.DisplayStepSize = 0;
opt7.DisplayFinalResults = 0;
opt7.ValidationData = [days_test cases_daily_test];

opt8 = anfisOptions('InitialFIS',inFIS8,'EpochNumber',100);
opt8.StepSizeIncreaseRate = 1.10;
opt8.DisplayANFISInformation = 0;
opt8.DisplayErrorValues = 0;
opt8.DisplayStepSize = 0;
opt8.DisplayFinalResults = 0;
opt8.ValidationData = [days_test cases_daily_increment_test];

opt9 = anfisOptions('InitialFIS',inFIS9,'EpochNumber',100);
opt9.StepSizeIncreaseRate = 1.10;
opt9.DisplayANFISInformation = 0;
opt9.DisplayErrorValues = 0;
opt9.DisplayStepSize = 0;
opt9.DisplayFinalResults = 0;
opt9.ValidationData = [days_test deaths_daily_test];

opt10 = anfisOptions('InitialFIS',inFIS10,'EpochNumber',100);
opt10.StepSizeIncreaseRate = 1.10;
opt10.DisplayANFISInformation = 0;
opt10.DisplayErrorValues = 0;
opt10.DisplayStepSize = 0;
opt10.DisplayFinalResults = 0;
opt10.ValidationData = [days_test deaths_daily_increment_test];

opt11 = anfisOptions('InitialFIS',inFIS11,'EpochNumber',100);
opt11.StepSizeIncreaseRate = 1.10;
opt11.DisplayANFISInformation = 0;
opt11.DisplayErrorValues = 0;
opt11.DisplayStepSize = 1;
opt11.DisplayFinalResults = 0;
opt11.ValidationData = [days_test cured_daily_test];

opt12 = anfisOptions('InitialFIS',inFIS12,'EpochNumber',100);
opt12.StepSizeIncreaseRate = 1.10;
opt12.DisplayANFISInformation = 0;
opt12.DisplayErrorValues = 0;
opt12.DisplayStepSize = 0;
opt12.DisplayFinalResults = 0;
opt12.ValidationData = [days_test cured_daily_increment_test];

[fis,trainError,stepSize,chkfis,chkError] = anfis([days_train cases_cf_train],opt);

[fis2,trainError2,stepSize2,chkfis2,chkError2] = anfis([days_train deaths_cf_train],opt2);

[fis3,trainError3,stepSize3,chkfis3,chkError3] = anfis([days_train cases_cf_increment_train],opt3);

[fis4,trainError4,stepSize4,chkfis4,chkError4] = anfis([days_train deaths_cf_increment_train],opt4);

[fis5,trainError5,stepSize5,chkfis5,chkError5] = anfis([days_train cured_cf_train],opt5);

[fis6,trainError6,stepSize6,chkfis6,chkError6] = anfis([days_train cured_cf_increment_train],opt6);

[fis7,trainError7,stepSize7,chkfis7,chkError7] = anfis([days_train cases_daily_train],opt7);

[fis8,trainError8,stepSize8,chkfis8,chkError8] = anfis([days_train cases_daily_increment_train],opt8);

[fis9,trainError9,stepSize9,chkfis9,chkError9] = anfis([days_train deaths_daily_train],opt9);

[fis10,trainError10,stepSize10,chkfis10,chkError10] = anfis([days_train deaths_daily_increment_train],opt10);

[fis11,trainError11,stepSize11,chkfis11,chkError11] = anfis([days_train cured_daily_train],opt11);

[fis12,trainError12,stepSize12,chkfis12,chkError12] = anfis([days_train cured_daily_increment_train],opt12);

%%Plots of Input Membership Functions start here
%%Part 1
figure

subplot(3,2,1)
[x,mf1] = plotmf(fis,'input',1);
plot(x,mf1)
legend('mf1.1', 'mf1.2', 'mf1.3', 'mf1.4', 'mf1.5')

subplot(3,2,2)
[x,mf2] = plotmf(fis2,'input',1);
plot(x,mf2)
legend('mf2.1', 'mf2.2', 'mf2.3', 'mf2.4', 'mf2.5')

subplot(3,2,3)
[x,mf3] = plotmf(fis3,'input',1);
plot(x,mf3)
legend('mf3.1', 'mf3.2', 'mf3.3', 'mf3.4', 'mf3.5')

subplot(3,2,4)
[x,mf4] = plotmf(fis4,'input',1);
plot(x,mf4)
legend('mf4.1', 'mf4.2', 'mf4.3', 'mf4.4', 'mf4.5')

subplot(3,2,5)
[x,mf5] = plotmf(fis5,'input',1);
plot(x,mf5)
legend('mf5.1', 'mf5.2', 'mf5.3', 'mf5.4', 'mf5.5')

subplot(3,2,6)
[x,mf6] = plotmf(fis6,'input',1);
plot(x,mf6)
legend('mf6.1', 'mf6.2', 'mf6.3', 'mf6.4', 'mf6.5')

figure
subplot(3,2,1)
[x,mf7] = plotmf(fis7,'input',1);
plot(x,mf7)
legend('mf7.1', 'mf7.2', 'mf7.3', 'mf7.4', 'mf7.5')

subplot(3,2,2)
[x,mf8] = plotmf(fis8,'input',1);
plot(x,mf8)
legend('mf8.1', 'mf8.2', 'mf8.3', 'mf8.4', 'mf8.5')

subplot(3,2,3)
[x,mf9] = plotmf(fis9,'input',1);
plot(x,mf9)
legend('mf9.1', 'mf9.2', 'mf9.3', 'mf9.4', 'mf9.5')

subplot(3,2,4)
[x,mf10] = plotmf(fis10,'input',1);
plot(x,mf10)
legend('mf10.1', 'mf10.2', 'mf10.3', 'mf10.4', 'mf10.5')

subplot(3,2,5)
[x,mf11] = plotmf(fis11,'input',1);
plot(x,mf11)
legend('mf11.1', 'mf11.2', 'mf11.3', 'mf11.4', 'mf11.5')

subplot(3,2,6)
[x,mf12] = plotmf(fis12,'input',1);
plot(x,mf12)
legend('mf12.1', 'mf12.2', 'mf12.3', 'mf12.4', 'mf12.5')

%%Plots of Input Membership Functions end here
%%Plots of Output Surfaces start here
%%Part 1
figure
subplot(3,2,1)
gensurf(fis);
legend('Surface Plot - Cummulative Cases','Location','northwest')

subplot(3,2,2)
gensurf(fis2);
legend('Surface Plot - Cummulative Deaths','Location','northwest')

subplot(3,2,3)
gensurf(fis3);
legend('Surface Plot - % Change in Cummulative Cases','Location','northwest')

subplot(3,2,4)
gensurf(fis4);
legend('Surface Plot - % Change in Cummulative Deaths','Location','southwest')

subplot(3,2,5)
gensurf(fis5);
legend('Surface Plot - Cummulative Recoveries','Location','northwest')

subplot(3,2,6)
gensurf(fis6);
legend('Surface Plot - % Change in Cummulative Recoveries','Location','southwest')

%%Part 2
figure
subplot(3,2,1)
gensurf(fis7);
legend('Surface Plot - Daily Cases','Location','northwest')

subplot(3,2,2)
gensurf(fis8);
legend('Surface Plot - % Change in Daily Cases','Location','northwest')

subplot(3,2,3)
gensurf(fis9);
legend('Surface Plot - Daily Deaths','Location','northwest')

subplot(3,2,4)
gensurf(fis10);
legend('Surface Plot - % Change in Daily Deaths','Location','northwest')

subplot(3,2,5)
gensurf(fis11);
legend('Surface Plot - Daily Recoveries','Location','northwest')

subplot(3,2,6)
gensurf(fis12);
legend('Surface Plot - % Change in Daily Recoveries','Location','northwest')

%%Plots of Output Surfaces end here

%%Days Against Cumulative Cases Start Here
figure

subplot(2,2,1)

anfisoutput = evalfis(days_test,fis);
anfisoutputchk = evalfis(days_test,chkfis);
plot(days_test,anfisoutput, '*r')
xlabel("Days")
ylabel("Number of Cumulative Cases")
hold on
plot(days_train,cases_cf_train,'--b')
hold on
plot(days_test, cases_cf_test, '+b')
legend("Predicted Cumulative Cases","Trained Cumulative Cases","Actual Cumulative Cases", "location", "northwest")
hold off

cases_cf_fc_error = abs(cases_cf_test - anfisoutput);

subplot(2,2,2);
plot(days_test,cases_cf_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted Cumulative Cases)")
legend("Error(Forcasted Cumulative Cases)", "location", "northwest")

subplot(2,2,3)
anfisoutput1b = evalfis(days_train,fis);
plot(days_train,anfisoutput1b, '+r')
xlabel("Days")
ylabel("Number of Cumulative Cases")
hold on
plot(days_train,cases_cf_train,'--b')
legend("ANFIS Results (Cumulative Cases)", "Trained Cumulative Cases" , "location", "northwest")
hold off

error1 = abs(cases_cf_train-anfisoutput1b);

subplot(2,2,4)
plot(days_train,error1, '--r')
xlabel("Days")
ylabel("Error(Trained Cumulative Cases)")
legend("Error(Trained Cumulative Cases)", "location", "northwest")

mae_cases_cf_tnt = mae(error1);
mape_cases_cf_tnt = mae_cases_cf_tnt*100;
mae_cases_cf_fc = mae(cases_cf_fc_error);
mape_cases_cf_fc = mae_cases_cf_fc*100;
fisRMSE = min(trainError);
chkfisRMSE = min(chkError);
mse_cases_cf_tnt = mean((error1 - anfisoutput1b).^2);
mse_cases_cf_fc = mean((cases_cf_test - anfisoutput).^2);

%%Days Against Cumulative Cases End Here
%%Days Against Cumulative Deaths Start Here
figure

subplot(2,2,1)

anfisoutput2 = evalfis(days_test,fis2);
anfisoutputchk2 = evalfis(days_test,chkfis2);
plot(days_test,anfisoutput2, '*r')
xlabel("Days")
ylabel("Number of Cumulative Deaths")
hold on
plot(days_train,deaths_cf_train,'--b')
hold on
plot(days_test, deaths_cf_test, '+b')
legend("Predicted Cumulative Deaths","Trained Cumulative Deaths","Actual Cumulative Deaths", "location", "northwest")
hold off

deaths_cf_fc_error = deaths_cf_test - anfisoutput2;

subplot(2,2,2);
plot(days_test,deaths_cf_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted Cumulative Deaths)")
legend("Error(Forcasted Cumulative Deaths)", "location", "northwest")

subplot(2,2,3)
anfisoutput2b = evalfis(days_train,fis2);
plot(days_train,anfisoutput2b, '+r')
xlabel("Days")
ylabel("Number of Cumulative Deaths")
hold on
plot(days_train,deaths_cf_train,'--b')
legend("ANFIS Results (Cumulative Deaths)","Trained Cumulative Deaths", "location", "northwest")
hold off

error2 = abs(deaths_cf_train-anfisoutput2b);

subplot(2,2,4)
plot(days_train,error2, '--r')
xlabel("Days")
ylabel("Error(Trained Cumulative Deaths)")
legend("Error(Trained Cumulative Deaths)", "location", "northwest")

mae_deaths_cf_tnt = mae(error2);
mape_deaths_cf_tnt = mae_deaths_cf_tnt*100;
mae_deaths_cf_fc = mae(deaths_cf_fc_error);
mape_deaths_cf_fc = mae_deaths_cf_fc*100;
fisRMSE2 = min(trainError2);
chkfisRMSE2 = min(chkError2);
mse_deaths_cf_fc_tnt = mean((error2 - anfisoutput2b).^2);
mse_deaths_cf_fc = mean((deaths_cf_test - anfisoutput2).^2);
%%Days Against Cumulative Deaths End Here

%%Days Against Increment in Cumulative Cases Start Here
figure

subplot(2,2,1)

anfisoutput3 = evalfis(days_test,fis3);
anfisoutputchk3 = evalfis(days_test,chkfis3);
plot(days_test,anfisoutput3, '*r')
xlabel("Days")
ylabel("% Change in Cumulative Cases")
hold on
plot(days_train,cases_cf_increment_train,'--b')
hold on
plot(days_test, cases_cf_increment_test, '+b')
legend("Predicted % Change in Cumulative Cases","Trained % Change in Cumulative Cases","Actual % Change in Cumulative Cases", "location", "northwest")
hold off

cases_cf_increment_fc_error = cases_cf_increment_test - anfisoutput3;

subplot(2,2,2);
plot(days_test,cases_cf_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forecasted % Change in Cumulative Cases)")
legend("Error(Forecasted % Change in Cumulative Cases)", "location", "northwest")

subplot(2,2,3)
anfisoutput3b = evalfis(days_train,fis3);
plot(days_train,anfisoutput3b, '+r')
xlabel("Days")
ylabel("% Change in Cumulative Cases")
hold on
plot(days_train,cases_cf_increment_train,'--b')
legend("ANFIS Results (% Change in Cumulative Cases)","Trained % Change in Cumulative Cases", "location", "northwest")
hold off

error3 = abs(cases_cf_increment_train-anfisoutput3b);

subplot(2,2,4)
plot(days_train,error3, '--r')
xlabel("Days")
ylabel("Error(Trained % Change in Cumulative Cases)")
legend("Error(Trained % Change in Cumulative Cases)", "location", "northwest")

mae_cases_cf_increment_tnt = mae(error3);
mape_cases_cf_increment_tnt = mae_cases_cf_increment_tnt*100;
mae_cases_cf_increment_fc = mae(cases_cf_increment_fc_error);
mape_cases_cf_increment_fc = mae_cases_cf_increment_fc*100;
fisRMSE3 = min(trainError3);
chkfisRMSE3 = min(chkError3);
mse_cases_cf_increment_tnt = mean((error3 - anfisoutput3b).^2);
mse_cases_cf_increment_fc = mean((cases_cf_increment_test - anfisoutput3).^2);
%%Days Against Increment in Cumulative Cases End Here

%%Days Against Increment in Cumulative Deaths Start Here
figure

subplot(2,2,1)

anfisoutput4 = evalfis(days_test,fis4);
anfisoutputchk4 = evalfis(days_test,chkfis4);
plot(days_test,anfisoutput4, '*r')
xlabel("Days")
ylabel("% Change in Cumulative Deaths")
hold on
plot(days_train,deaths_cf_increment_train,'--b')
hold on
plot(days_test, deaths_cf_increment_test, '+b')
legend("Predicted % Change in Cumulative Deaths","Trained % Change in Cumulative Deaths","Actual % Change in Cumulative Deaths", "location", "northwest")
hold off

deaths_cf_increment_fc_error = deaths_cf_increment_test - anfisoutput4;

subplot(2,2,2);
plot(days_test,deaths_cf_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forecasted % Change in Cumulative Deaths)")
legend("Error(Forecasted % Change in Cumulative Deaths)", "location", "northwest")

subplot(2,2,3)
anfisoutput4b = evalfis(days_train,fis4);
plot(days_train,anfisoutput4b, '+r')
xlabel("Days")
ylabel("% Increase in Cumulative Deaths")
hold on
plot(days_train,deaths_cf_increment_train,'--b')
legend("ANFIS Results (% Change in Cumulative Deaths)","Trained % Change in Cumulative Deaths", "location", "northwest")
hold off

error4 = abs(deaths_cf_increment_train-anfisoutput4b);

subplot(2,2,4)
plot(days_train,error4, '--r')
xlabel("Days")
ylabel("Error(Trained % Change in Cumulative Deaths)")
legend("Error(Trained % Change in Cumulative Deaths)", "location", "northwest")

mae_deaths_cf_increment_tnt = mae(error4);
mape_deaths_cf_increment_tnt = mae_deaths_cf_increment_tnt*100;
mae_deaths_cf_increment_fc = mae(deaths_cf_increment_fc_error);
mape_deaths_cf_increment_fc = mae_deaths_cf_increment_fc*100;
fisRMSE4 = min(trainError4);
chkfisRMSE4 = min(chkError4);
mse_deaths_cf_increment_tnt = mean((error4 - anfisoutput4b).^2);
mse_deaths_cf_increment_fc = mean((deaths_cf_increment_test - anfisoutput4).^2);
%%Days Against Increment in Cumulative Deaths End Here

%%Days Against Cumulative Cured Cases Start Here
figure

subplot(2,2,1)

anfisoutput5 = evalfis(days_test,fis5);
anfisoutputchk5 = evalfis(days_test,chkfis5);
plot(days_test,anfisoutput5, '*r')
xlabel("Days")
ylabel("Number of Cumulative Recoveries")
hold on
plot(days_train,cured_cf_train,'--b')
hold on
plot(days_test, cured_cf_test, '+b')
legend("Predicted Cumulative Recoveries","Trained Cumulative Recoveries","Actual Cumulative Recoveries", "location", "northwest")
hold off

cured_fc_error = abs(cured_cf_test - anfisoutput5);

subplot(2,2,2);
plot(days_test,cured_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forecasted Cumulative Recoveries)")
legend("Error(Forecasted Cumulative Recoveries)", "location", "northwest")

subplot(2,2,3)
anfisoutput5b = evalfis(days_train,fis5);
plot(days_train,anfisoutput5b, '+r')
xlabel("Days")
ylabel("Number of Cumulative Cured Cases")
hold on
plot(days_train,cured_cf_train,'--b')
legend("ANFIS Results (Cumulative Recoveries)","Trained Cumulative Recoveries", "location", "northwest")
hold off

error5 = abs(cured_cf_train-anfisoutput5b);

subplot(2,2,4)
plot(days_train,error5, '--r')
xlabel("Days")
ylabel("Error(Trained Cumulative Recoveries)")
legend("Error(Trained Cumulative Recoveries)", "location", "northwest")

mae_cured_cf_tnt = mae(error1);
mape_cured_cf_tnt = mae_cured_cf_tnt*100;
mae_cured_cf_fc = mae(cured_fc_error);
mape_cured_cf_fc = mae_cured_cf_fc*100;
fisRMSE5 = min(trainError5);
chkfisRMSE5 = min(chkError5);
mse_cured_cf_tnt = mean((error5 - anfisoutput5b).^2);
mse_cured_cf_fc = mean((cured_cf_test - anfisoutput5).^2);

%%Days Against Cumulative Cured Cases End Here
%%Days Against Increase in Cumulative Cured Cases Start Here
figure

subplot(2,2,1)

anfisoutput6 = evalfis(days_test,fis6);
anfisoutputchk6 = evalfis(days_test,chkfis6);
plot(days_test,anfisoutput6, '*r')
xlabel("Days")
ylabel("% Change in Cumulative Recoveries")
hold on
plot(days_train,cured_cf_increment_train,'--b')
hold on
plot(days_test, cured_cf_increment_test, '+b')
legend("Predicted % Change in Cumulative Recoveries","Trained % Change in Cumulative Recoveries","Actual % Change in Cumulative Recoveries", "location", "northwest")
hold off

cured_cf_increment_fc_error = cured_cf_increment_test - anfisoutput2;

subplot(2,2,2);
plot(days_test,cured_cf_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted % Change in Cumulative Recoveries)")
legend("Error(Forcasted % Change in Cumulative Recoveries)", "location", "northwest")

subplot(2,2,3)
anfisoutput6b = evalfis(days_train,fis6);
plot(days_train,anfisoutput6b, '+r')
xlabel("Days")
ylabel("% Increase in Cumulative Recoveries")
hold on
plot(days_train,cured_cf_increment_train,'--b')
legend("ANFIS Results (% Change in Cumulative Recoveries)","Trained % Change in Cumulative Recoveries", "location", "northwest")
hold off

error6 = abs(cured_cf_increment_train-anfisoutput6b);

subplot(2,2,4)
plot(days_train,error2, '--r')
xlabel("Days")
ylabel("Error(Trained % Change in Cumulative Recoveries)")
legend("Error(Trained % Change in Cumulative Recoveries)", "location", "northwest")

mae_cured_cf_increment_tnt = mae(error2);
mape_cured_cf_increment_tnt = mae_cured_cf_increment_tnt*100;
mae_cured_cf_increment_fc = mae(cured_cf_increment_fc_error);
mape_cured_cf_increment_fc = mae_cured_cf_increment_fc*100;
fisRMSE6 = min(trainError2);
chkfisRMSE6 = min(chkError2);
mse_cured_cf_increment_tnt = mean((error6 - anfisoutput6b).^2);
mse_cured_cf_increment_fc = mean((cured_cf_increment_test - anfisoutput6).^2);
%%Days Against Increase in Cumulative Cured Cases End Here

%%Days Against Daily Confirmed Cases Start Here
figure

subplot(2,2,1)

anfisoutput7 = evalfis(days_test,fis7);
anfisoutputchk7 = evalfis(days_test,chkfis7);
plot(days_test,anfisoutput7, '*r')
xlabel("Days")
ylabel("Number of Daily Cases")
hold on
plot(days_train,cases_daily_train,'--b')
hold on
plot(days_test, cases_daily_test, '+b')
hold off

cases_daily_fc_error = cases_daily_test - anfisoutput7;

subplot(2,2,2);
plot(days_test,cases_daily_fc_error, '--r')
xlabel("Days")
ylabel("Error(Number of Daily Cases)")


subplot(2,2,3)
anfisoutput7b = evalfis(days_train,fis7);
plot(days_train,anfisoutput7b, '+r')
xlabel("Days")
ylabel("Number of Daily Cases")
hold on
plot(days_train,cases_daily_train,'--b')
hold off

error7 = abs(cases_daily_train-anfisoutput7b);

subplot(2,2,4)
plot(days_train,error3, '--r')
xlabel("Days")
ylabel("Error(Trained Number of Daily Cases)")

mae_cases_daily_tnt = mae(error7);
mape_cases_daily_tnt = mae_cases_daily_tnt*100;
mae_cases_daily_fc = mae(cases_daily_fc_error);
mape_cases_daily_fc = mae_cases_daily_fc*100;
fisRMSE7 = min(trainError7);
chkfisRMSE7 = min(chkError7);
mse_cases_daily_tnt = mean((error7 - anfisoutput7b).^2);
mse_cases_daily_fc = mean((cases_daily_test - anfisoutput7).^2);
%%Days Against Daily Confirmed Cases End Here

%%Days Against Increment in Daily Confirmed Cases Start Here
figure

subplot(2,2,1)

anfisoutput8 = evalfis(days_test,fis8);
anfisoutputchk8 = evalfis(days_test,chkfis8);
plot(days_test,anfisoutput8, '*r')
xlabel("Days")
ylabel("% Increase in Daily Cases")
hold on
plot(days_train,cases_daily_increment_train,'--b')
hold on
plot(days_test, cases_daily_increment_test, '+b')
hold off

cases_daily_increment_fc_error = cases_daily_increment_test - anfisoutput4;

subplot(2,2,2);
plot(days_test,cases_daily_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted % Increase in Daily Cases)")


subplot(2,2,3)
anfisoutput8b = evalfis(days_train,fis8);
plot(days_train,anfisoutput8b, '+r')
xlabel("Days")
ylabel("% Increase in Daily Cases")
hold on
plot(days_train,cases_daily_increment_train,'--b')
hold off

error8 = abs(cases_daily_increment_train-anfisoutput8b);

subplot(2,2,4)
plot(days_train,error4, '--r')
xlabel("Days")
ylabel("Error(Trained % Increase in Daily Cases)")

mae_cases_daily_increment_tnt = mae(error8);
mape_cases_daily_increment_tnt = mae_cases_daily_increment_tnt*100;
mae_cases_daily_increment_fc = mae(cases_daily_increment_fc_error);
mape_cases_daily_increment_fc = mae_cases_daily_increment_fc*100;
fisRMSE8 = min(trainError8);
chkfisRMSE8 = min(chkError8);
mse_cases_daily_increment_tnt = mean((error8 - anfisoutput8b).^2);
mse_cases_daily_increment_fc = mean((cases_daily_increment_test - anfisoutput8).^2);
%%Days Against Increment in Daily Confirmed Cases End Here

%%Days Against Daily Deaths Start Here
figure

subplot(2,2,1)

anfisoutput9 = evalfis(days_test,fis9);
anfisoutputchk9 = evalfis(days_test,chkfis9);
plot(days_test,anfisoutput9, '*r')
xlabel("Days")
ylabel("Number of Daily Deaths")
hold on
plot(days_train,deaths_daily_train,'--b')
hold on
plot(days_test, deaths_daily_test, '+b')
hold off

deaths_daily_fc_error = abs(deaths_daily_test - anfisoutput);

subplot(2,2,2);
plot(days_test,deaths_daily_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted Number of Daily Deaths)")


subplot(2,2,3)
anfisoutput9b = evalfis(days_train,fis9);
plot(days_train,anfisoutput9b, '+r')
xlabel("Days")
ylabel("Number of Daily Deaths")
hold on
plot(days_train,deaths_daily_train,'--b')
hold off

error9 = abs(deaths_daily_train-anfisoutput9b);

subplot(2,2,4)
plot(days_train,error1, '--r')
xlabel("Days")
ylabel("Error(Trained Number of Daily Deaths)")

mae_deaths_daily_tnt = mae(error1);
mape_deaths_daily_tnt = mae_deaths_daily_tnt*100;
mae_deaths_daily_fc = mae(deaths_daily_fc_error);
mape_deaths_daily_fc = mae_deaths_daily_fc*100;
fisRMSE9 = min(trainError9);
chkfisRMSE9 = min(chkError9);
mse_deaths_daily_tnt = mean((error9 - anfisoutput9b).^2);
mse_deaths_daily_fc = mean((deaths_daily_test - anfisoutput9).^2);

%%Days Against Daily Deaths End Here
%%Days Against Increment in Daily Deaths Start Here
figure

subplot(2,2,1)

anfisoutput10 = evalfis(days_test,fis10);
anfisoutputchk10 = evalfis(days_test,chkfis10);
plot(days_test,anfisoutput10, '*r')
xlabel("Days")
ylabel("% Increment in Daily Deaths")
hold on
plot(days_train,deaths_daily_increment_train,'--b')
hold on
plot(days_test, deaths_daily_increment_test, '+b')
hold off

deaths_daily_increment_fc_error = deaths_daily_increment_test - anfisoutput10;

subplot(2,2,2);
plot(days_test,deaths_daily_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted % Increment in Daily Deaths)")


subplot(2,2,3)
anfisoutput10b = evalfis(days_train,fis10);
plot(days_train,anfisoutput10b, '+r')
xlabel("Days")
ylabel("% Increment in Daily Deaths")
hold on
plot(days_train,deaths_daily_increment_train,'--b')
hold off

error10 = abs(deaths_daily_increment_train-anfisoutput10b);

subplot(2,2,4)
plot(days_train,error2, '--r')
xlabel("Days")
ylabel("Error(Trained % Increment in Daily Deaths)")

mae_deaths_daily_increment_tnt = mae(error2);
mape_deaths_daily_increment_tnt = mae_deaths_daily_increment_tnt*100;
mae_deaths_daily_increment_fc = mae(deaths_daily_increment_fc_error);
mape_deaths_daily_increment_fc = mae_deaths_daily_increment_fc*100;
fisRMSE10 = min(trainError10);
chkfisRMSE10 = min(chkError10);
mse_deaths_daily_increment_tnt = mean((error10 - anfisoutput10b).^2);
mse_deaths_daily_increment_fc = mean((deaths_daily_increment_test - anfisoutput10).^2);
%%Days Against Increment in Daily Deaths End Here

%%Days Against Daily Cured Cases Start Here
figure

subplot(2,2,1)

anfisoutput11 = evalfis(days_test,fis11);
anfisoutputchk11 = evalfis(days_test,chkfis11);
plot(days_test,anfisoutput11, '*r')
xlabel("Days")
ylabel("Number of Daily Cured Cases")
hold on
plot(days_train,cured_daily_train,'--b')
hold on
plot(days_test, cured_daily_test, '+b')
hold off

cured_daily_fc_error = cured_daily_test - anfisoutput11;

subplot(2,2,2);
plot(days_test,cured_daily_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forecasted Daily Cured Cases)")


subplot(2,2,3)
anfisoutput11b = evalfis(days_train,fis11);
plot(days_train,anfisoutput11b, '+r')
xlabel("Days")
ylabel("Number of Daily Cured Cases")
hold on
plot(days_train,cured_daily_train,'--b')
hold off

error11 = abs(cured_daily_train-anfisoutput11b);

subplot(2,2,4)
plot(days_train,error11, '--r')
xlabel("Days")
ylabel("Error(Trained Daily Cured Cases)")

mae_cured_daily_tnt = mae(error3);
mape_cured_daily_tnt = mae_cured_daily_tnt*100;
mae_cured_daily_fc = mae(cured_daily_fc_error);
mape_cured_daily_fc = mae_cured_daily_fc*100;
fisRMSE11 = min(trainError11);
chkfisRMSE11 = min(chkError11);
mse_cured_daily_tnt = mean((error11 - anfisoutput11b).^2);
mse_cured_daily_fc = mean((cured_daily_test - anfisoutput11).^2);
%%Days Against Daily Cured Cases End Here

%%Days Against Increment in Daily Cured Cases Start Here
figure

subplot(2,2,1)

anfisoutput12 = evalfis(days_test,fis12);
anfisoutputchk12 = evalfis(days_test,chkfis12);
plot(days_test,anfisoutput12, '*r')
xlabel("Days")
ylabel("% Inc. in Daily Cured Cases")
hold on
plot(days_train,cured_daily_increment_train,'--b')
hold on
plot(days_test, cured_daily_increment_test, '+b')
hold off

cured_daily_increment_fc_error = cured_daily_increment_test - anfisoutput12;

subplot(2,2,2);
plot(days_test,cured_daily_increment_fc_error, '--r')
xlabel("Days")
ylabel("Error(Forcasted % Inc. in Daily Cured Cases)")


subplot(2,2,3)
anfisoutput12b = evalfis(days_train,fis12);
plot(days_train,anfisoutput12b, '+r')
xlabel("Days")
ylabel("% Inc. in Daily Cured Cases")
hold on
plot(days_train,cured_daily_increment_train,'--b')
hold off

error12 = abs(cured_daily_increment_train-anfisoutput12b);

subplot(2,2,4)
plot(days_train,error12, '--r')
xlabel("Days")
ylabel("Error(Trained % Inc. in Daily Cured Cases)")

mae_cured_daily_increment_tnt = mae(error12);
mape_cured_daily_increment_tnt = mae_cured_daily_increment_tnt*100;
mae_cured_daily_increment_fc = mae(cured_daily_increment_fc_error);
mape_cured_daily_increment_fc = mae_cured_daily_increment_fc*100;
fisRMSE12 = min(trainError12);
chkfisRMSE12 = min(chkError12);
mse_cured_daily_increment_tnt = mean((error12 - anfisoutput12b).^2);
mse_cured_daily_increment_fc = mean((cured_daily_increment_test - anfisoutput12).^2);
%%Days Against Increment in Daily Cured Cases End Here
