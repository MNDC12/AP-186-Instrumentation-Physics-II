close all;
clear all;

%% NONPARAMETRIC SEGM
image =imread('rubik2.jpg');
figure(1); imshow(image);
im = double(image);
imR = im(:,:,1); imG = im(:,:,2); imB = im(:,:,3);
imI = imR + imG + imB;
imI(imI==0) = 1000000;
imr = imR./imI; img = imG./imI; imb = imB./imI;

%im = image;
red1 = imcrop(im, [1080 400 40 30]);
red2 = imcrop(im,[550 850 50 40]);
orange1 = imcrop(im, [660 140 40 30]); 
orange2 = imcrop(im,[950 930 50 40]);
yellow1 = imcrop(im, [200 520 40 40]);
yellow2 = imcrop(im,[670 980 40 30]);
green1 = imcrop(im,[1000 780 50 40]);
green2 = imcrop(im, [130 880 50 20]);
blue1 = imcrop(im,[160 620 60 40]); %top view
blue2 = imcrop(im,[410 920 50 30]); %side view
white1 = imcrop(im, [730 250 30 30]);
white2 = imcrop(im,[110 780 50 40]);

roi = white1;
roiR = roi(:,:,1); roiG = roi(:,:,2); roiB = roi(:,:,3);
roiI = roiR + roiG + roiB; roiI(roiI==0) = 1000000;
roir = roiR./roiI; roig = roiG./roiI;

%% 

bin = 100;
intr = round(roir*(bin-1)+1);
intg = round(roig*(bin-1)+1);
color = intg(:) + (intr(:)-1)*bin;
hist = zeros(bin,bin);
for row = 1:bin
    for column = 1:(bin-row+1)
        hist(row,column) = length(find(color ==(((column+(row-1)*bin)))));
    end
end
a = imrotate(hist,90);
figure(3);imshow(a);
imwrite(a, ['C:\Users\Mary\Desktop\Year5_Sem1\186\Act7\last\100.jpg']);

imsize = size(imr); npsroi  = zeros(imsize(1),imsize(2));
for i = 1:imsize(1)
    for j = 1:imsize(2)
        rnew = round(imr(i,j)*(bin-1)+1);
        gnew = round(img(i,j)*(bin-1)+1);
        npsroi(i,j) = hist(rnew,gnew);
    end
end

figure(4); imshow(npsroi);
% imwrite(hist,'white2hist.jpg');
imwrite(npsroi,'nonpara100.jpg');