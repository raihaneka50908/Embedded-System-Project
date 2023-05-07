function raspi_gneet_es_proj()
raspiObj=raspi();
cam=cameraboard(raspiObj,'Resolution','1920x1080');

net=coder.loadDeepLearningNetwork('TrainResultNew.mat','trainedNetwork_1');
ukuran=net.Layers(1).InputSize;
ukuran=ukuran(1:2);

to_show="..........";

start=tic;
fprintf('Entry While Loop..... \n');

while true
    img=snapshot(cam);
    el_time=toc(start);
    if el_time>1
        IMG=imresize(img,ukuran);
        [label,score]=net.classify(IMG);
        max_scr=max(score);
        label_str=string(label);
        to_show=sprintf("Label : %s \n Score : %f \n",label_str,max_scr);
        start=tic;
    end
    img_label=insertText(img,[0 0],to_show);
    displayImage(raspiObj,img_label);
end
end