close all;
clear all;
clc

%% functions
n = 5;
time = @(t) [0:1/9000:t];
note = @(t,f) sin(2*pi*f*time(t));

%%

C = 261.63*2;
D = 293.66*2;
E = 329.63*2;
F = 349.23*2;
G = 392.00*2;
A = 440.00*2;
B = 493.88*2;
C1 = 523.25*2;
D1 = 587.33*2;
E1 = 659.26*2;
F1 = 698.46*2;
G1 = 783.99*2;
nan = 0;

T = 1;
quart = 0.25*T;
half = 0.5*T;
whole = 1*T;
eight = T/8; 
rest = 0.75*T; %random

%%
im = imread('jb_longlong.png');
im = imcomplement(rgb2gray(im));
im = im2bw(im,0.2);  figure(1); imshow(im);
hor = strel('line',3,0); %2
ver = strel('line',3,90);
circ = strel('disk',10);
im = imerode(im, hor); figure(2); imshow(im);
im = imerode(im, ver); figure(3); imshow(im);
im = imclose(im, circ); figure(4); imshow(im);

blobs = bwconncomp(im);
stats = regionprops(blobs, 'all');
centroids = cat(1, stats.Centroid);
[row col] = size(centroids); 

j = 0;
for i = 1:row
    k = i+j;
    length(k) = stats(i).MajorAxisLength;
    pos(k) = stats(i).Centroid(2);
    if length(k) > 70 & length(k) < 100
        length = [length, length(k)]; 
        pos(k) = pos(k)+17.5;
        pos = [pos, pos(k)];
        j = j+1;
    end
end


% time
time = length; 
length(length > 100) = rest;
length(length > 13.8 & length < 16.9) = quart; 
length(length > 16.9 & length < 50) = whole; 
length(length > 10 & length < 13.8) = half;
length(length > 70) = eight;

freq = pos;
% frequency 
pos(pos > 76.9) = C;
pos(pos > 53.8 & pos < 56) = G;
pos(pos > 66 & pos < 69) = E;
pos(pos > 73 & pos < 75.7) = D;
pos(pos > 59 & pos < 61.2) = F;
pos(pos==52.5) = nan;


music = [];

for i = 1:row+j
    music = [music, note(length(i),pos(i))];
end

sound(music);
audiowrite('JB.wav',music,8192);


