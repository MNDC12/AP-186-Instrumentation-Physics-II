xdel(winsid())

im = imread('4.jpg');
im = rgb2gray(im);
im_min = min(im); im_max = max(im);
disp("min = "); disp(im_min); 
disp("max = "); disp(im_max);
imwrite(im, '4_gray.png');

//PDF of Original Image
scf(); histplot(256, double(im)); 
xtitle("Grayscale PDF of Original Image");

//CDF of Original Image
[counts1, loc1] = imhist(im);
CDF1 = cumsum(counts1)/length(im);
scf(); plot(CDF1); 
xtitle("CDF of Original Image");

//desired CDF
x = [0:255];
xx = linspace(-2,2,256);
des_lin = x/255.0; 
des_quad = x.^2/(255.0^2);
des_erf = 0.5*(erf(xx)+1);
scf(); plot(des_lin); xtitle("Desired Linear CDF");
scf(); plot(des_quad); xtitle("Desired Quadratic CDF");
scf(); plot(des_erf); xtitle("Desired Erf CDF");

//backprojection
des = des_erf;
d = splin(x,des);
[y1, y2, y3] = interp(CDF1, des, x, d);
image = im;
for i = 0:255
    image(find(im == i)) = y1(i+1);
end 
imwrite(image, "4_erf_enhanced.png")

//PDF of enhanced image
scf(); histplot(256, double(image)); 
xtitle("Grayscale PDF of Enhanced Image");

//CDF of enhanced image
[counts2, bins2] = imhist(image);
CDF2 = cumsum(counts2)/length(image);
scf(); plot(CDF2);
xtitle("CDF of Enhanced Image");
