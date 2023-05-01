close all;
clear all;

%%
I = imread('check.jpg');
[count,cells] = imhist(I, 256);
a = plot(cells,count);
BW = I<200;
imshow(BW);

% imwrite(a, 'checkplot.jpg');
BW225 = I < 200;
imwrite(BW225, 'checkbw_200.jpg');
% BW175 = I < 175;
% imwrite(BW175, 'checkbw_175.jpg');
% BW125 = I < 125;
% imwrite(BW125, 'checkbw_125.jpg');
% BW75 = I < 75;
% imwrite(BW75, 'checkbw_75.jpg');
% BW25 = I < 25;
% imwrite(BW25, 'checkbw_25.jpg');
