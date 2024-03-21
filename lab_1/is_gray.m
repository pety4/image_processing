%функция проверки изображения на чб и чтения его размеров
function [image_gray, m, n] = is_gray(image)
    %чтение размеров изображения
    [m,n,q]=size(image);
    if q==3
        %преобразование изображение в чб
        image_gray=rgb2gray(image);
    else
        image_gray=image;
    end
end