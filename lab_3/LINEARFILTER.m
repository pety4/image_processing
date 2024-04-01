function [g] = LINEARFILTER(f)
    addpath('lab_1')
    a=10;
    b=10;
    m=2*a+1;
    n=2*b+1;
    w=zeros(m,n);
    w=ones(m,n);
    w=w/sum(w,'all');
    [f,M,N]=is_gray(f);
    M_1=M+2*a;
    N_1=N+2*b;
    f_1=zeros(M_1,N_1);
    f_1(1+a:M+a, 1+b:N+b)=f;
    g=zeros(M,N);
    for i = (1+a):(M+a)
        for j = (1+b):(N+b)
            R=0;
            for s=1:m
                for t=1:n
                    R=R+w(s,t)*f_1(i-a-1+s,j-b-1+t);
                end
            end
            g(i-a,j-b)=R;
        end
    end
end

