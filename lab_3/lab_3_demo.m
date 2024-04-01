addpath('images');
f=imread('aaa.png');
g=LINEARFILTER(f);
subplot(1,2,1);
imshow(f);
title('Исходное изображение');
subplot(1,2,2);
imshow(mat2gray(g));
title('Обработанное изображение изображение');