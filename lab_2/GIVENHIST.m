function [g]=GIVENHIST(f,pz)
    %инициализация векторов и матриц
    pr=[];
    r=[];
    [f,M,N]=is_gray(f); %проверка на формат изображения и сохранение его размера
    g=f;
    %гистограмма исходного изображения
    [h,r]=HISTOGM(f);
    %нормализация гистограммы
    pr=h/(M*N);
    %уровни градации z
    z=0:255;
    %преобразование Г(z) (шаг 1)
    for k=1:256
        GAM(k)=TAU(z(k),pz);
    end

    %главный цикл преобразования (шаг 2-4)
    for i=1:M
        for j=1:N
            %преобразование T(r) для текущего пикселя (шаг 2)
            T=TAU(f(i,j),pr);
            %сравнение T с элементами GAM (шаг 3)
            [x,index]=min(abs(GAM-T));
            %присвоение результата (шаг 4)
            g(i,j)=z(index);
        end
    end

end