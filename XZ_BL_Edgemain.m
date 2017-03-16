% Date: 03/04/2017
% Photomosaic image generator
% 
% Author: Xinxin Zhang
% Author: Baihan Lin

% Edge enhancement main

% find the edges using canny/sober operator

clear all; close all; clc;

I = imread('bicycle_kick.jpg');
Imos8 = imread('bk_mosaic8.png');

[imageW, imageH, Dim] = size(I);
r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

% I = rgb2gray(I);
% imshow(I);
% title('Original Image');
% mask = zeros(size(I));
% mask(1:383,1:280) = 1;
% figure;
% imshow(mask);
% title('Initial Contour Location');
% bw = activecontour(I,mask,300);
% figure;
% imshow(bw);
% title('Segmented Image');

idx = segmentImg(I, 2);

idxnew = idx;

 w1 = 257;
 h1 = 427;
 p = idx(1,1); % background
% forground represented with color white
% background represented with color black
for w = 1: imageW
    for h = 1:imageH
        if (idx(w,h) ~= p && w <= w1 && h <= h1)
            r(w, h) = 255;
            g(w, h) = 255;
            b(w, h) = 255;
            idxnew(w, h) = 1; % foreground

        else
            r(w, h) = 0;
            g(w, h) = 0;
            b(w, h) = 0;
            idxnew(w, h) = 0; % background
        end
    end
end
Iseg = cat(3, r, g, b);
figure; imshow(Iseg);

% se = strel('ball', 5, 5);
% Idila = imdilate(Iseg, se);
% closing removing small holes
% figure; title('dilation'); imshow(Idila);
% Ierod = imerode(Idila,se);
% figure; title('Erosion'); imshow(Ierod);

% for hn = 1:7
%     
%     
% end

tileSize = 8;
xnum = (imageW / tileSize);
ynum = ceil(imageH / tileSize);






