% Date: 03/04/2017
% Photomosaic image generator
%
% Author: Xinxin Zhang
% Author: Baihan Lin

% Edge enhancement main

% find the edges using canny/sober operator

clear all; close all; clc;

I = imread('bicycle_kick.jpg');
Imos = imread('bk_mosaic8.png');

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

redge = BL_outEdge(r);
gedge = BL_outEdge(g);
bedge = BL_outEdge(b);
Iedge = cat(3, redge, gedge, bedge);

% figure; imshow(Iseg);
% figure; imshow(Iedge);
% 
greyIseg = rgb2gray(Iseg);
% figure; imshow(greyIseg);

edge = BL_outEdge(greyIseg);

tSize = 8;
xnum = floor(imageW / tSize);
ynum = floor(imageH / tSize);

mos = zeros(xnum, ynum);

rImos = Imos(:,:,1);
gImos = Imos(:,:,2);
bImos = Imos(:,:,3);

for w = 1: imageW
    for h = 1:imageH
        if (edge(w,h) == 1 && mod(w, tSize) ~= 0)
            if (greyIseg(w-1,h) == 0)
                left = 0;
                right = 255;
            else
                left = 255;
                right = 0;
            end
            lineStart = floor(w-mod(w, tSize))+1;
            rImos(lineStart:w, h) = left;
            gImos(lineStart:w, h) = left;
            bImos(lineStart:w, h) = left;
            if (w-mod(w, tSize)+8 < imageW)
                lineEnd = floor(w-mod(w, tSize)+8);
            else
                lineEnd = imageW;
            end
            rImos((w+1):lineEnd, h) = right;
            gImos((w+1):lineEnd, h) = right;
            bImos((w+1):lineEnd, h) = right;
            break;
        end;
    end;
end;

ImosFinal = cat(3, rImos, gImos, bImos);
figure; imshow(ImosFinal);

