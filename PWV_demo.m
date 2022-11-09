%Plot PWV Data
% BME 311

clear;clc;
[file, folder]=uigetfile('*');
fullFileName = fullfile(folder, file);

%read in data from tsv text file
data = readmatrix(fullFileName);
data = data(2:end, :);

distance=1.24; %carotid to ankle, meters
initial=20; %initial time point
final=23; %ending time point

time=data(:,1);
ecg=data(:,2);
mic=data(:,3);
pressure=data(:,4);

%%
subplot(311);plot(time,ecg,'o');xlim([initial final]);ylabel('ECG')
subplot(312);plot(time,mic,'o');xlim([initial final]);ylabel('MIC')
subplot(313);plot(time,pressure,'o');xlim([initial final]);xlabel('Time (Seconds)');ylabel('Pressure')

%% Measure Carotid Ankle
[xs, ys]=getpts;  % Select first heart sound and upstroke of pressuree
dt=(xs(2)-xs(1))
PWV=distance/(xs(2)-xs(1))
