close all;
clear all;

image =imread('cell.jpg');
figure(1); imshow(image);
im = double(image);
imR = im(:,:,1); imG = im(:,:,2); imB = im(:,:,3);
imI = imR + imG + imB;
imI(imI==0) = 100000;
imr = imR./imI; img = imG./imI; imb = imB./imI;

cell1 = imcrop(im, [85 60 15 10]);
realcell1 = imcrop(im,[50 120 35 35]);
cell2 = imcrop(im, [68 94 13 10]);
realcell2 = imcrop(im, [56 81 30 30]);
cell3 = imcrop(im, [153 49 13 10]);
realcell3 = imcrop(im, [146 40 30 25]);
cell4 = imcrop(im, [140 75 15 10]);
realcell4 = imcrop(im, [130 68 45 27]);
cell5 = imcrop(im, [110 80 20 20]);
roi = cell3;
roiR = roi(:,:,1); roiG = roi(:,:,2); roiB = roi(:,:,3); roiI = roiR + roiG + roiB; roiI(roiI==0) = 100000;
roir = roiR./roiI; roig = roiG./roiI;
aver = mean(roir(:)); stdevr = std(roir(:)); 
probr = (1./(stdevr.*sqrt(2.*pi))).*exp(-1.*((imr-aver).^2)./(2.*stdevr.^2));
aveg = mean(roig(:)); stdevg = std(roig(:));
probg = (1./(stdevg.*sqrt(2.*pi))).*exp(-1.*((img-aveg).^2)./(2.*stdevg.^2));
jointprob = probr.*probg;
figure(3);imshow(jointprob);
% imwrite(uint8(realcell5), 'cellreal5.jpg');
% imwrite(uint8(roi),'cell5.jpg');
% imwrite(jointprob,'cell5para.jpg');



