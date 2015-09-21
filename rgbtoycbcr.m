clear;
A=imread('C:\Users\Sujay\Downloads\test1.jpg');
a=rgb2gray(A);
Z=rgb2gray(A);
background = imopen(a,strel('disk',150));
figure
surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');
I2 = a - background;
%imshow(I2);
I3 = imadjust(I2);
imshow(I3);
level = graythresh(I3);
bw = im2bw(I3,level);
bw = bwareaopen(bw, 50);
%imshow(bw);
cc = bwconncomp(bw, 4);
cc.NumObjects;
C=double(a);


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
     
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        a(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end
%figure,imshow(a); title('Sobel gradient');

%threshold value
Thresh=100;
a=max(a,Thresh);
a(a==round(Thresh))=0;

a=uint8(a);
%figure,imshow(~a);title('Edge detected Image');

C=double(a);


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
     
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        a(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end
%figure,imshow(a); title('Sobel gradient');

%threshold value
Thresh=100;
a=max(a,Thresh);
a(a==round(Thresh))=0;

a=uint8(a);
%figure,imshow(~a);title('Edge detected Image');

cd = bwconncomp(a, 4);
cd.NumObjects;

mask = a>100;
mask = imfill(mask,'holes');
%figure,imshow(mask);title('Mask');
cq = bwconncomp(a, 8);
numPixels =cellfun(@numel,cq.PixelIdxList);

whatever=(bw>0.5);
%figure,imshow(whatever);title('roi');