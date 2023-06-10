clc;
clear;
close;
A=imread("image.jpg");
B=rgb2gray(A);

%fft of the image
Bt=fft2(B);
flow=log(abs(fftshift(Bt))+1);

Btsort = sort(abs(Bt(:)));
keep=0.90; 
thresh = Btsort(floor((1-keep)*length(Btsort)));
ind = abs(Bt)>thresh;                        %Find small indices
Atlow = Bt.*ind;                             %Threshold small indices
Alow=uint8(ifft2(Atlow));                    % Compressed image

keep=0.50; 
thresh = Btsort(floor((1-keep)*length(Btsort)));
ind = abs(Bt)>thresh;                        %Find small indices
Atlow = Bt.*ind;                             %Threshold small indices
Alow2=uint8(ifft2(Atlow));                    % Compressed image

keep=0.01; 
thresh = Btsort(floor((1-keep)*length(Btsort)));
ind = abs(Bt)>thresh;                        %Find small indices
Atlow = Bt.*ind;                             %Threshold small indices
Alow3=uint8(ifft2(Atlow));                    % Compressed image

keep=0.002; 
thresh = Btsort(floor((1-keep)*length(Btsort)));
ind = abs(Bt)>thresh;                        %Find small indices
Atlow = Bt.*ind;                             %Threshold small indices
Alow4=uint8(ifft2(Atlow));                    % Compressed image

figure(1);
imshow(A);
title("Original Image");
figure(2);
imshow(B);
title("Gray Scale Image");
figure(3);
imshow(flow,[]);
title("FFT of the Image");
figure(4);
imshow(Alow) % Plot Reconstruction
imwrite(Alow,"imc1.jpg");
title("Image Reconstructed with 90% of FFT Values");
figure(5);
imshow(Alow2) % Plot Reconstruction
imwrite(Alow2,"imc2.jpg");
title("Image Reconstructed with 50% of FFT Values");
figure(6);
imshow(Alow3) % Plot Reconstruction
imwrite(Alow3,"imc3.jpg");
title("Image Reconstructed with 1% of FFT Values");
figure(7);
imshow(Alow4) % Plot Reconstruction
imwrite(Alow4,"imc4.jpg");
title("Image Reconstructed with 0.2% of FFT Values");