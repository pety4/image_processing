%функция расчёта производной 2 порядка
function [der_2] = second_derivative(v)
    v=double(v);
    [m,n]=size(v);
    der_2=zeros(m,n);
    for i = 2:m-1
        der_2(i,1)=v(i+1,1)+v(i-1,1)-2*v(i,1);
    end
end

