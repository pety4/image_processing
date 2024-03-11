function [s] = TAU(r,p)
    sum_p=0;
    L=2^8;
    for i = 1:r+1
        sum_p=sum_p+p(i);
    end
    s=round((L-1)*sum_p);
end