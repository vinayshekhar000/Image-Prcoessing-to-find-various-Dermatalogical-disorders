
a=imread('C:\Users\Sujay\Downloads\test1.jpg');
b=rgb2gray(a);
c=im2bw(b,0.5);
A= imsharpen(b);
%subplot(1,3,1);imshow(a);
%subplot(1,3,2);imshow(b);
subplot(1,3,3);imshow(c);
%{
a = imread('rice.png');
imshow(a), title('Original Image');
b = imsharpen(a,'Radius',2,'Amount',1);
figure, imshow(b), title('Sharpened Image');
%}
%READ AN 2D IMAGE
%A=imread('C:\Users\Kumar BN\Desktop\Image Processing\test.png');
title('IMAGE WITH SALT AND PEPPER NOISE');
figure,imshow(A);

%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA=zeros(size(A)+2);
B=zeros(size(A));

%COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
      %LET THE WINDOW BE AN ARRAY
      %STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
      %SORT AND FIND THE MIDDLE ELEMENT
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        med=sort(window);
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
        B(i,j)=med(5);
       
    end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
title('IMAGE AFTER MEDIAN FILTERING');
figure,imshow(B);
%}
I =imread('C:\Users\Sujay\Downloads\test1.jpg')
Iblur1 = imgaussfilt(I,2);
Iblur2 = imgaussfilt(I,4);
Iblur3 = imgaussfilt(I,8);
figure
imshow(I)
title('Original image')

figure
imshow(Iblur1)
title('Smoothed image, \sigma = 2')

figure
imshow(Iblur2)
title('Smoothed image, \sigma = 4')

figure
imshow(Iblur3)
title('Smoothed image, \sigma = 8')