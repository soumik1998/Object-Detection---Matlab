function detectBalls(file_name)
rgb = imread(file_name);
figure
imshow(rgb)
d = imdistline;
delete(d);
gray_image = rgb2gray(rgb);
imshow(gray_image);
[centers, radii] = imfindcircles(rgb,[20 200],'ObjectPolarity','dark', ...
    'Sensitivity',0.9,'Method','twostage')
imshow(rgb);

h = viscircles(centers,radii);
