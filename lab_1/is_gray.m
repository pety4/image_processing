function [image_gray, m, n] = is_gray(image)
    [m,n,q]=size(image);
    if q==3
        image_gray=rgb2gray(image);
    else
        image_gray=image;
    end
end