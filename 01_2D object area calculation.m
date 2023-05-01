shape = imread('mapp1.bmp'); %opens image
edge = edge(shape,'roberts'); %gets the edge booleans of the image
[Y,X] = find(edge); %gets the coordinates of the edges
stats = regionprops(edge, 'centroid'); %calculates centroid for connected components in image
centroids = cat(1, stats.Centroid); %stores x and y coordinates of the centroid
imagesc(edge); colormap(gray); hold on; plot(centroids(:,1),centroids(:,2),'b*'); hold off;
x = X-centroids(1,1); y = Y-centroids(1,2); 
[angle,radius] = cart2pol(x,y); %transforms cartesian coordinates to polar coordinates
pixel = [angle,radius,x,y];
sorted = sortrows(pixel,1); %sorts according to the angle
xs = sorted(:,3); ys = sorted(:,4); %cartesian coordinates arranged by angle
area = abs(sum(xs.*ys([2:end,1])-ys.*xs([2:end,1])))/2; %applies Green's Theorem
area_theo = nnz(shape==1); %computes the area from number of pixels
error = (area_theo-area)/((area_theo+area)/2); %computes the percent error

xmax = 890; ymax = 470; %meters
[ny,nx] = size(shape); %pixels
convx = xmax/nx; convy = ymax/ny; %conversion factor
conv_area = area_theo*convx*convy; %converts image area from pixel squared to meters squared
