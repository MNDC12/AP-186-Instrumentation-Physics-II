close all
clear all
%% Initialization

xo = -6:1:6; yo = xo; [Xo,Yo] = meshgrid(xo,yo);
xe1 = -6:1:5; yo1 = -6:1:6; [Xe1,Yo1] = meshgrid(xe1,yo1);
xe = -6:1:5; ye = xe; [Xe,Ye] = meshgrid(xe,ye);

% shapes
squ = ((abs(Xo)<= 2.5).*(abs(Yo)<=2.5)); 
tri = ((Xe1<= 1 & Xe1>=-2).*(abs(Yo1-1)<=0.5)+(abs(Xe1+1)<=1.5).*(abs(Yo1)<=0.5)...
    +(abs(Xe1+2)<=0.5).*(abs(Yo1+1)<=0.5));
hol = ((Xe<=4 & Xe>=-5).*(Ye<=4 & Ye>=-5)-(Xe<=2 & Xe>=-3).*(Ye<=2 & Ye>=-3)); 
plu = ((abs(Xo)<= 0.5).*(abs(Yo)<=2.5)+(abs(Yo)<= 0.5).*(abs(Xo)<=2.5)-...
    (abs(Xo)<= 0.5).*(abs(Yo)<=0.5)); 

% structuring parameter
struct1 = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0]; 
struct2 = [0 0 0; 0 1 0; 0 1 0; 0 0 0]; 
struct3 = [0 0 0 0; 0 1 1 0; 0 0 0 0]; 
struct4 = [0 0 0 0 0; 0 0 1 0 0; 0 1 1 1 0; 0 0 1 0 0; 0 0 0 0 0];
struct5 = [0 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 0];
%% 

% % square
sqDIL1=imdilate(squ,struct1);sqERO1=imerode(squ,struct1);
sqDIL2=imdilate(squ,struct2);sqERO2=imerode(squ,struct2);
sqDIL3=imdilate(squ,struct3);sqERO3=imerode(squ,struct3);
sqDIL4=imdilate(squ,struct4);sqERO4=imerode(squ,struct4);
sqDIL5=imdilate(squ,struct5);sqERO5=imerode(squ,struct5);

% % triangle
trDIL1=imdilate(tri,struct1);trERO1=imerode(tri,struct1);imwrite(trDIL1,'trDIL1.jpg');imwrite(trERO1,'trERO1.jpg');
trDIL2=imdilate(tri,struct2);trERO2=imerode(tri,struct2);imwrite(trDIL2,'trDIL2.jpg');imwrite(trERO2,'trERO2.jpg');
trDIL3=imdilate(tri,struct3);trERO3=imerode(tri,struct3);imwrite(trDIL3,'trDIL3.jpg');imwrite(trERO3,'trERO3.jpg');
trDIL4=imdilate(tri,struct4);trERO4=imerode(tri,struct4);imwrite(trDIL4,'trDIL4.jpg');imwrite(trERO4,'trERO4.jpg');
trDIL5=imdilate(tri,struct5);trERO5=imerode(tri,struct5);imwrite(trDIL5,'trDIL5.jpg');imwrite(trERO5,'trERO5.jpg');

% % hollow
hDIL1=imdilate(hol,struct1);hERO1=imerode(hol,struct1);
hDIL2=imdilate(hol,struct2);hERO2=imerode(hol,struct2);
hDIL3=imdilate(hol,struct3);hERO3=imerode(hol,struct3);
hDIL4=imdilate(hol,struct4);hERO4=imerode(hol,struct4);
hDIL5=imdilate(hol,struct5);hERO5=imerode(hol,struct5);

% % plus
plDIL1=imdilate(plu,struct1);plERO1=imerode(plu,struct1);imwrite(plDIL1,'plDIL1.jpg');imwrite(plERO1,'plERO1.jpg');
plDIL2=imdilate(plu,struct2);plERO2=imerode(plu,struct2);imwrite(plDIL2,'plDIL2.jpg');imwrite(plERO2,'plERO2.jpg');
plDIL3=imdilate(plu,struct3);plERO3=imerode(plu,struct3);imwrite(plDIL3,'plDIL3.jpg');imwrite(plERO3,'plERO3.jpg');
plDIL4=imdilate(plu,struct4);plERO4=imerode(plu,struct4);imwrite(plDIL4,'plDIL4.jpg');imwrite(plERO4,'plERO4.jpg');
plDIL5=imdilate(plu,struct5);plERO5=imerode(plu,struct5);imwrite(plDIL5,'plDIL5.jpg');imwrite(plERO5,'plERO5.jpg');

figure(); imagesc(plu);colormap(gray); axis equal; axis off;

figure(); imagesc(plDIL1);colormap(gray); axis equal; axis off;
figure(); imagesc(plDIL2);colormap(gray); axis equal; axis off;
figure(); imagesc(plDIL3);colormap(gray); axis equal; axis off;
figure(); imagesc(plDIL4);colormap(gray); axis equal; axis off;
figure(); imagesc(plDIL5);colormap(gray); axis equal; axis off;
