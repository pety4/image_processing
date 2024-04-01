%функция построения нормализованной гистограммы
function [norm_h,r]=norm_histogm(image)
    addpath('lab_1\');
    [norm_h,r]=HISTOGM(image);
    [m,n]=size(image);
    norm_h=norm_h/(m*n);
end