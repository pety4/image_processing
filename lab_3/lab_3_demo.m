clear all;
addpath('images');
f=imread('aaa.png');
g=LINEARFILTER(f);
%преобразование матрицы в ЧБ изображение
g=mat2gray(g);
subplot(1,2,1);
imshow(f);
title('Исходное изображение');
subplot(1,2,2);
imshow(g);
title('Обработанное изображение');