clear all;
addpath('images','lab_1');
f_image=imread('terminal_dark.png');
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
g_G_x=LINEARFILTER_CASTOM_MASK(f,w_G_x);
g_G_y=LINEARFILTER_CASTOM_MASK(f,w_G_y);
g_L=LINEARFILTER_CASTOM_MASK(f,w_L);
g_L_diag=LINEARFILTER_CASTOM_MASK(f,w_L_diag);
figure;
imshow(f_image);
title('Исходное изображение');
figure;
imshow(mat2gray(g_G_x));
title('Изображение, обработанное маской Собела G_x');
figure;
imshow(mat2gray(g_G_y));
title('Изображение, обработанное маской Собела G_y');
figure;
imshow(mat2gray(abs(g_G_x)+abs(g_G_y)));
title('Изображение, обработанное фильтром на основе первой производной');
figure;
imshow(mat2gray(g_L));
title({'Изображение, обработанное маской лапласиана';'без учёта диагональных направлений'});
figure;
imshow(mat2gray(g_L_diag));
title({'Изображение, обработанное маской лапласиана';'с учётом диагональных направлений'});