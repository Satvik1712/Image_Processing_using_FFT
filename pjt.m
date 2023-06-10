clc;
clear;
close;
A=imread("image.jpg");
B=rgb2gray(A);
%fft of the image
Bt=fft2(B);
flow=log(abs(fftshift(Bt))+1);

[b1,a1]=butter(5,0.9);
y=(filter2(b1,a1,flow))+1;
thresh = y(floor((1-0.90)*length(y)));
ind = abs(Bt)>thresh; %Find small indices
Atlow = Bt.*ind; %Threshold small indices
Alow=uint8(ifft2(Atlow)); % Compressed image

[b2,a2]=butter(15,0.9);
y1=(filter2(b2,a2,flow))+1;
thresh = y1(floor((1-0.90)*length(y1)));
ind = abs(Bt)>thresh; %Find small indices
Atlow = Bt.*ind; %Threshold small indices
Alow2=uint8(ifft2(Atlow)); % Compressed image

[b3,a3]=butter(25,0.9);
y2=(filter2(b3,a3,flow))+1;
thresh = y2(floor((1-0.90)*length(y2)));
ind = abs(Bt)>thresh; %Find small indices
Atlow = Bt.*ind; %Threshold small indices
Alow3=uint8(ifft2(Atlow)); % Compressed image

figure(1);
imshow(A);
title("Original Image");
figure(2);
imshow(B);
title("Gray Scale Image");
figure(3);
imshow(mat2gray(flow),[]);
title("FFT of the Image");
figure(4);
freqz(b1,a1);
title("Low Pass Filter with Order 5");
figure(5);
imshow(mat2gray(y),[]);
title("FFT after Filtering with a Filter of Order 5");
figure(6);
imshow(Alow) % Plot Reconstruction
title("Image After Filtering with Filter of Order 5");
imwrite(Alow,"ic1.jpg");
figure(7);
freqz(b2,a2);
title("Low Pass Filter with Order 15");
figure(8);
imshow(mat2gray(y1),[]);
title("FFT after Filtering with a Filter of Order 15");
figure(9);
imshow(Alow2) % Plot Reconstruction
title("Image After Filtering with Filter of Order 15");
imwrite(Alow2,"ic2.jpg");
figure(10);
freqz(b3,a3);
title("Low Pass Filter with Order 25");
figure(11);
imshow(mat2gray(y2),[]);
title("FFT after Filtering with a Filter of Order 25");
figure(12);
imshow(Alow3) % Plot Reconstruction
title("Image After Filtering with Filter of Order 25");
imwrite(Alow3,"ic3.jpg");