%Найденный в интернете пример эквализации гистограммы

% MATLAB code for Histogram equalisation 
% function to return resultant 
% image: Apply on single channel only. 
function new_img=example(img) 
Freq=zeros(1,256); 
[x,y,z]=size(img); 

% Convert into grayscale if 
% image is coloured. 
if(z==3) 
	img=rgb2gray(img); 
end

% Calculate frequency of each 
% intensity value. 
for i=1:x 
	for j=1:y 
		Freq(img(i,j)+1)=Freq(img(i,j)+1)+1; 
	end
end

% Calculate PDF for each intensity value. 
PDF=zeros(1,256); 
Total=x*y; 
for i=1:256 
	PDF(i)=Freq(i)/Total; 
end

% Calculate the CDF for each intensity value. 
CDF=zeros(1,256); 
CDF(1)=PDF(1); 
for i=2:256 
	CDF(i)=CDF(i-1)+PDF(i); 
end

% Multiply by Maximum intensity value 
% and round off the result. 
Result=zeros(1,256); 
for i=1:256 
	Result(i)=uint8(CDF(i)*(255)); 
end

% Compute the new image. 
mat=zeros(size(img)); 
for i=1:x 
	for j=1:y 
		mat(i,j)=Result(img(i,j)+1); 
	end
end
	
new_img=mat; 
% imshow(img, []); 
% caption = sprintf("Original input Image"); 
% title(caption, 'FontSize', 14); 
% drawnow; 
% pause(5); 
% imshow(new_img, []); 
% caption = sprintf("Original output Image"); 
% title(caption, 'FontSize', 14); 
% drawnow; 
subplot(2,2,1);
imshow(img,[]);
subplot(2,2,3);
imhist(img);
subplot(2,2,2);
imshow(new_img,[]);
subplot(2,2,4);
imhist(new_img);
end
