%функция пространственной фильтрации изображения с заданной маской
function [filtered_image] = LINEARFILTER_CASTOM_MASK(image,mask)
    %добавление папки в path
    addpath('lab_1')
    [m,n]=size(mask);
    a=(m-1)/2;
    b=(n-1)/2;
    %проверка изображения на ЧБ
    [image,M,N]=is_gray(image);
    %увеличение размеров изображения для корректной работы фильтра
    M_1=M+2*a;
    N_1=N+2*b;
    f_1=zeros(M_1,N_1);
    f_1(1+a:M+a, 1+b:N+b)=image;
    filtered_image=zeros(M,N);
    %фильтрация изображения
    for i = (1+a):(M+a)
        for j = (1+b):(N+b)
            R=0;
            for s=1:m
                for t=1:n
                    R=R+mask(s,t)*f_1(i-a-1+s,j-b-1+t);
                end
            end
            filtered_image(i-a,j-b)=R;
        end
    end
end

