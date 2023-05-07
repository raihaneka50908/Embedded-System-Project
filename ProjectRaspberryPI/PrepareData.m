clc;clear;close all;

net=googlenet;
ukuran=[224 224 3];

loc='/Users/raihan/Documents/MATLAB/Dataset/Dataset_Penggunaan_Masker';

imds=imageDatastore(loc,'LabelSource',...
    'foldernames','IncludeSubfolders',true,'FileExtensions',{'.png','.jpg','.jfif','.jpeg'});
imds.ReadFcn=@(x)imresize(imread(x),[224 224]);

[train,validate]=splitEachLabel(imds,0.7,'randomize');
train=augmentedImageDatastore(ukuran,train,'ColorPreprocessing','gray2rgb');
validate=augmentedImageDatastore(ukuran,validate,'ColorPreprocessing','gray2rgb');