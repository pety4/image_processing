clear all;
k=6;
addpath('images','lab_1','lab_2');
image=imread('abstraction.png');
[image,m,n]=is_gray(image);
imshow(image);
figure;
V=(image(k,:))';
plot(V);
title(sprintf('Распределение яркости пикселей данного профиля по %i-ой строке',k));
der_1_V=derivative(V);
hold on;
plot(der_1_V);
der_2_V=second_derivative(V);
plot(der_2_V);
legend(sprintf('Распределение яркости пикселей данного профиля'), ...
    'Производная первого порядка', ...
    'Производная второго порядка','Location','best');
figure;
imshow(V');
title('Обрабатываемая строка');

