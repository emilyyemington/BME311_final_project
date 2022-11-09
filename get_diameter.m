% Distensbility: Carotid Area Calculation
% BME 311

clear;clc;
[file folder]=uigetfile('*');
fullFileName = fullfile(folder, file);
videoObject = VideoReader(fullFileName);
implay(fullFileName)   %Find Systolic or Diastolic frame
%% Measure Area

frame=45;
frames=floor(videoObject.Duration*videoObject.FrameRate);
image = read(videoObject,frame);
scale = 155;              %pixels per centimeter
image = rgb2gray(image);
imagesc(image);colormap gray
[xs_y ys_y]=getpts;
radius_y=(rssq([ys_y(2)-ys_y(1),xs_y(2)-xs_y(1)])/2)/scale;
[xs_x ys_x]=getpts;
radius_x=(rssq([ys_x(2)-ys_x(1),xs_x(2)-xs_x(1)])/2)/scale;
area=pi*radius_x*radius_y  %cm2
%%
