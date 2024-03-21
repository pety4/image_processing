%чтение изображения из файла
image=imread('zeppelin_gray_light.jpg');
%проверка на ЧБ и запись размера изображения
[image,m,n]=is_gray(image);
%imshow(image,[]);
%построение гистограммы изображения
[h,r]=HISTOGM(image);
tiledlayout('flow')
subplot(2,2,1);
imshow(image);
title("Исходное изображение");
%subplot(2,2,3);
%imhist(image);
%title("Гистограмма, построенная матлабом")
%subplot(2,2,2);
%bar(r,h);
%title("Гистограмма, построенная самостоятельно");
%нормализация гистограммы
p=h/(m*n);
subplot(2,2,3);
bar(r,p);
title("Нормированная гистограмма исходного изображения");
image_ekv=ones(m,n);
%эквализация гистограммы
for i=1:m
    for j=1:n
        image_ekv(i,j)=TAU(image(i,j),p);
    end
end

subplot(2,2,2);
imshow(image_ekv,[]);
title("Преобразованное изображение");

[h_ekv, r_ekv]=HISTOGM(image_ekv);
h_ekv=h_ekv/(m*n);
subplot(2,2,4);
bar(r_ekv,h_ekv);
title("Нормированная гистограмма преобразованного изображения");