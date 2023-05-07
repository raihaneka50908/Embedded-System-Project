clc;clear;close all;

load MyNet_Result.mat
I=imread('MenggunakanMasker.jpg');
I1=imread('TidakAdaOrang.jpg');
I2=imread('TidakMemakaiMasker.jpg');

I_t=imresize(I,[224 224]);
I1_t=imresize(I1,[224 224]);
I2_t=imresize(I2,[224 224]);

[pred,score]=classify(MyNetResult,I_t);
[pred1,score1]=classify(MyNetResult,I1_t);
[pred2,score2]=classify(MyNetResult,I2_t);

figure(1)
subplot(131)
imshow(I)
title(pred)
subplot(132)
imshow(I1)
title(char(pred1))
subplot(133)
imshow(I2)
title(pred2)