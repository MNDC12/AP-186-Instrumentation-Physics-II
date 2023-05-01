close all;
clear all;

image =imread('cell.jpg');
figure(1); imshow(image);
im = double(image);
imR = im(:,:,1); imG = im(:,:,2); imB = im(:,:,3);
imI = imR + imG + imB;
imI(imI==0) = 1000000;
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

roi = cell4;
roiR = roi(:,:,1); roiG = roi(:,:,2); roiB = roi(:,:,3);
roiI = roiR + roiG + roiB; roiI(roiI==0) = 1000000;
roir = roiR./roiI; roig = roiG./roiI;

%% 

bin = 32;
intr = round(roir*(bin-1)+1);
intg = round(roig*(bin-1)+1);
color = intg(:) + (intr(:)-1)*bin;
hist = zeros(bin,bin);
for row = 1:bin
    for column = 1:(bin-row+1)
        hist(row,column) = length(find(color ==(((column+(row-1)*bin)))));
    end
end
figure(3);imshow(imrotate(hist.*255,90)); colormap(jet);

imsize = size(imr); npsroi  = zeros(imsize(1),imsize(2));
for i = 1:imsize(1)
    for j = 1:imsize(2)
        rnew = round(imr(i,j)*(bin-1)+1);
        gnew = round(img(i,j)*(bin-1)+1);
        npsroi(i,j) = hist(rnew,gnew);
    end
end

figure(4); imshow(npsroi);
imwrite(hist,'cell5hist.jpg');
imwrite(npsroi,'cell4nonpara.jpg');