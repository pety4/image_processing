%функция расчёта производной 1 порядка
function [der_1] = derivative(v)
    v=double(v);
    [m,n]=size(v);
    der_1=zeros(m,n);
    for i = 1:m-1
        der_1(i,1)=v(i+1,1)-v(i,1);
    end
end

