clear all;
%добавление в path папок
addpath("lab_1","lab_2","images");
%чтение и проверка на ЧБ эталонного изображения
[template_image,m_template,n_template]=is_gray(imread('airport.tif'));
%построение нормированной гистограммы эталонного изображения
[pz,r]=norm_histogm(template_image);
%отображение в отдельном окне эталонного изображения и его нормированной гистограммы
figure;
tiledlayout('flow');
subplot(2,1,1);
imshow(template_image);
title("Эталонное изображение");
subplot(2,1,2);
bar(r,pz);
title("Нормированная гистограмма эталонного изображения");
%чтение и проверка на ЧБ исходного изображения
[image,m,n]=imread('airport_light.tif');
%отображение исходного изображения
figure;
tiledlayout('flow');
subplot(2,2,1);
imshow(image);
title("Исходное изображение изображение");
%отображение нормированной гистограммы исходного изображения
[p_image, r_image]=norm_histogm(image);
subplot(2,2,3);
bar(r_image,p_image);
title("Нормированная гистограмма исходного изображения");
%приведение гистограммы
g=GIVENHIST(image,pz);
%отображение полученного изображения
subplot(2,2,2);
imshow(g);
title("Полученное изображение");
%отображение нормированной гистограммы полученного изображения
[p_g, r_g]=norm_histogm(g);
subplot(2,2,4);
bar(r_g,p_g);
title("Нормированная гистограмма полученного изображения");