number = 4;
im = imread(['IMG',num2str(number),'.jpg']);
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

%%
Rmin = min(R(:)); Rmax = max(R(:));
Gmin = min(G(:)); Gmax = max(G(:));
Bmin = min(B(:)); Bmax = max(B(:));

Rstretch = (R-Rmin).*(255./(Rmax-Rmin));
Gstretch = (G-Gmin).*(255./(Gmax-Gmin));
Bstretch = (B-Bmin).*(255./(Bmax-Bmin));

imrestore = im;
imrestore(:,:,1) = Rstretch;
imrestore(:,:,2) = Gstretch;
imrestore(:,:,3) = Bstretch;

% figure(1); imshow(im); 
[counts1,loc1] = imhist(Rstretch);
figure(2); bar(loc1,counts1);
[counts,loc] = imhist(R);
figure(3); bar(loc,counts);
% figure(2); imshow(imrestore); 
% imwrite(imrestore, [num2str(number),'CS.jpg']); 

%%
Rmean = mean(R(:));
Gmean = mean(G(:));
Bmean = mean(B(:));

Rwb = R.*(255./Rmean);
Gwb = G.*(255./Gmean);
Bwb = B.*(255./Bmean);

imrestore(:,:,1) = Rwb;
imrestore(:,:,2) = Gwb;
imrestore(:,:,3) = Bwb;

% figure(3); imshow(imrestore);
% imwrite(imrestore, [num2str(number),'grayworld.jpg']); 

%%
%imcrp = (imcrop(im,[550 510 130 70])); %IMG3
%imcrp = (imcrop(im,[280 515 140 85])); %IMG2
imcrp = (imcrop(im,[300 1020 40 20])); %IMG4
Rcrp = imcrp(:,:,1);
Gcrp = imcrp(:,:,2);
Bcrp = imcrp(:,:,3);

Rw = mean(Rcrp(:));
Gw = mean(Gcrp(:));
Bw = mean(Bcrp(:));

Rwb = R.*(255./Rw);
Gwb = G.*(255./Gw);
Bwb = B.*(255./Bw);

imrestore(:,:,1) = Rwb;
imrestore(:,:,2) = Gwb;
imrestore(:,:,3) = Bwb;

figure(4); imshow(imcrp);
imwrite(imcrp, [num2str(number),'cropped.jpg']); 
figure(5); imshow(imrestore);
imwrite(imrestore, [num2str(number),'WP.jpg']); 

figure(6); imshow(R); imwrite(R,'R.jpg'); 
figure(7); imshow(G); imwrite(G,'G.jpg'); 
figure(8); imshow(B); imwrite(B,'B.jpg');
