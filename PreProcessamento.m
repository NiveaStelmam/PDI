close all
clear all

im = imread('C:\Users\Adriano\Documents\artemia.jpg');

for i=3:size(im,1) - 2
  for j=3:size(im,2) - 2
    px = im(i-2:i+2,j-2:j+2);
    imBlur(i,j) = uint8(sum(sum(px))/25);
    imMedian(i,j) = median(median(px));
  end
end

figure(1);
imshow(imBlur)

figure(2);
imshow(imMedian)

for i=8:size(im,1) - 7
  for j=8:size(im,2) - 7
    px = im(i-7:i+7,j-7:j+7);
    imBlur6(i,j) = uint8(sum(sum(px))/100);
    imMedian6(i,j) = median(median(px));
  end
end

figure(3);
imshow(imBlur6)

figure(4);
imshow(imMedian6)

for i=9:size(im,1) - 8
  for j=9:size(im,2) - 8
    px = im(i-8:i+8,j-8:j+8);
    imBlur7(i,j) = uint8(sum(sum(px))/121);
    imMedian7(i,j) = median(median(px));
  end
end


figure(5);
imshow(imBlur7)

figure(6);
imshow(imMedian7)

for i=10:size(im,1) - 9
  for j=10:size(im,2) - 9
    px = im(i-9:i+9,j-9:j+9);
    imBlur8(i,j) = uint8(sum(sum(px))/144);
    imMedian8(i,j) = median(median(px));
  end
end

figure(7);
imshow(imBlur8)

figure(8);
imshow(imMedian8)

for i=11:size(im,1) - 10
  for j=11:size(im,2) - 10
    px = im(i-10:i+10,j-10:j+10);
    imBlur9(i,j) = uint8(sum(sum(px))/169);
    imMedian9(i,j) = median(median(px));
  end
end

figure(9);
imshow(imBlur9)

figure(10);
imshow(imMedian9)
