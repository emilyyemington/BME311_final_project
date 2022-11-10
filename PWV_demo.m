%Plot PWV Data
% BME 311

clear;clc;
[file, folder]=uigetfile('*');
fullFileName = fullfile(folder, file);

%read in data from tsv text file
data = readmatrix(fullFileName);
data = data(2:end, :);

distance=1.24; %carotid to ankle, meters

time=data(:,1);
ecg=data(:,2);
mic=data(:,3);
pressure=data(:,4);

initial=rand*(max(time)-min(time)-3)+min(time); %initial time point
final=initial+3; %ending time point


%%
subplot(311);plot(time,ecg,'o');xlim([initial final]);ylabel('ECG')
subplot(312);plot(time,mic,'o');xlim([initial final]);ylabel('MIC')
subplot(313);plot(time,pressure,'o');xlim([initial final]);xlabel('Time (Seconds)');ylabel('Pressure')

%% Measure Carotid Ankle
[xs, ys]=getpts;  % Select first heart sound and upstroke of pressuree
dt=(xs(2)-xs(1))
PWV=distance/(xs(2)-xs(1))
