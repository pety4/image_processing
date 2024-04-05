clear all;
f_image=imread('terminal_dark.png');
%f2=rgb2gray(f1);
f=im2double(f_image);
%маска Собела G_x
w_G_x=[-1 -2 -1;
    0 0 0;
    1 2 1];
%маска Собела G_y
w_G_y=[-1 0 2;
    -2 0 2;
    -1 0 1];
%маска лапласиана без учёта диагональных направлений
w_L=[0 1 0;
    1 -4 1;
    0 1 0];
%маска лапласиана с учётом диагональных направлений
w_L_diag=[1 1 1;
            1 -8 1;
            1 1 1];
A=1.0;
g_G_x=LINEARFILTER_CASTOM_MASK(f,w_G_x);
g_G_y=LINEARFILTER_CASTOM_MASK(f,w_G_y);
g_L=LINEARFILTER_CASTOM_MASK(f,w_L);
g_L_diag=LINEARFILTER_CASTOM_MASK(f,w_L_diag);

g_G=abs(g_G_x)+abs(g_G_x);

figure;
imshow(f);
title('Исходное изображение');

figure;
imshow(mat2gray(g_G));
title('$|G_{x}|+|G_{y}|$','interpreter','latex');
for i=A:0.5:2.0
    figure;
    imshow(mat2gray(i*im2double(f)-g_G));
    title(sprintf('Преобразованное оператором градиента изображение, A=%d',i));
end

figure;
imshow(mat2gray(g_L));
title('Преобразованное маской лапласиана без учета диагональных направлений изображение')
for i=A:0.5:2
    figure;
    imshow(mat2gray(i*f+g_L));
    title(sprintf('Преобразованное оператором лапласиана без учета диагональных направлений изображение, A=%d',i));
 end

figure;
imshow(mat2gray(g_L_diag));
title('Преобразованное маской лапласиана с учетом диагональных направлений изображение')

for i=A:0.5:2
    figure;
    imshow(mat2gray(i*im2double(f)-g_L_diag));
    title(sprintf('Преобразованное оператором лапласиана с учетом диагональных направлений изображение, A=%d',i));
end
