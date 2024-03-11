function [h,r]=HISTOGM(f)
    L=2^8;
    r=0:(L-1);
    h=zeros(L,1);
    %image_gray=rgb2gray(image);
    %r_min=min(f(:));
    %r_max=max(f(:));
    [m,n] = size(f);
    for i=1:m
        for j=1:n
            h(uint16(f(i,j))+1)=h(uint16(f(i,j))+1)+1;
        end
    end
    %h_max=max(h(:));
end

%subplot(2,2,3);
%imhist(image_gray); встроенная функция matlab для построения гистограмм
%axes([0 r_max 0 h_max]) не работает
