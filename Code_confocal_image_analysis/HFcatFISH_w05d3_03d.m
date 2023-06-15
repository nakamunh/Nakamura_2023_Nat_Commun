%% H1a-Fos catFISH 

w05d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d301H0.jpg');
w05d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d301F0.jpg');
w05d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d301B0a.jpg');
w05d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d301B0b.jpg');
w05d301B0 = imfuse(w05d301B0a, w05d301B0b, 'blend');
w05d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d302H0.jpg');
w05d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d302F0.jpg');
w05d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d302B0a.jpg');
w05d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d302B0b.jpg');
w05d302B0 = imfuse(w05d302B0a, w05d302B0b, 'blend');
w05d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303H0.jpg');
w05d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303F0.jpg');
w05d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303B0a.jpg');
w05d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303B0b.jpg');
w05d303B0 = imfuse(w05d303B0a, w05d303B0b, 'blend');

w05d301H = w05d301H0(:,:,1);
w05d301F = w05d301F0(:,:,2);
w05d301B = w05d301B0(:,:,3);
w05d302H = w05d302H0(:,:,1);
w05d302F = w05d302F0(:,:,2);
w05d302B = w05d302B0(:,:,3);
w05d303H = w05d303H0(:,:,1);
w05d303F = w05d303F0(:,:,2);
w05d303B = w05d303B0(:,:,3);


%% w05d301

%w05d301B (B)
SE50 = strel('square',50);
w05d301B01 = imtophat(w05d301B, SE50);
w05d301Baht = adapthisteq(w05d301B01);
avg = ones(3,3)/9;
w05d301Bmed = medfilt2(w05d301Baht,[3,3]);
w05d301B02 = imtophat(w05d301Bmed,SE50);
w05d301Bcom = imcomplement(w05d301B02);
w05d301B03 = medfilt2(w05d301Bcom,[3,3]);
w05d301B04 = imcomplement(w05d301B03); % DAPI(B): pre1

%w05d301H_Hfos (R)
w05d301H01 = imtophat(w05d301H, SE50);
w05d301Hcom = imcomplement(w05d301H01);
w05d301H02 = medfilt2(w05d301Hcom, [3,3]);
w05d301H03 = imcomplement(w05d301H02);
w05d301H03_T105 = w05d301H03 > 90; % H1a_fosi % T change <------------
w05d301B04_T120 = w05d301B04 > 120; % DAPI(B): pre2a
w05d301Hfos1 = imfuse(w05d301H03_T105, w05d301B04_T120, 'blend');
w05d301Hfos2 = w05d301Hfos1 > 140; % H1a_fosi (R): final
w05d301HB1 = imfuse(w05d301Hfos2, w05d301B04,'Colorchannel',[1 0 2]);

%w05d301F_Ffos (G)
w05d301F01 = imtophat(w05d301F, SE50);
w05d301Fcom = imcomplement(w05d301F01);
w05d301F02 = medfilt2(w05d301Fcom, [3,3]);
w05d301F03 = imcomplement(w05d301F02);
w05d301F03_T105 = w05d301F03 > 85; % Fos_fosi % T change <------------
w05d301B04_T120 = w05d301B04 > 120; % DAPI(B): pre2a
w05d301Ffos1 = imfuse(w05d301F03_T105, w05d301B04_T120, 'blend');
w05d301Ffos2 = w05d301Ffos1 > 140; % Fos_fosi (G): final
w05d301HFB2 = imoverlay(w05d301HB1,w05d301Ffos2,"green");
imwrite(w05d301HFB2, 'w05d301HFB2.tif');



%% w05d302

%w05d302B (B)
SE50 = strel('square',50);
w05d302B01 = imtophat(w05d302B, SE50);
w05d302Baht = adapthisteq(w05d302B01);
%avg = ones(3,3)/9;
w05d302Bmed = medfilt2(w05d302Baht,[3,3]);
w05d302B02 = imtophat(w05d302Bmed,SE50);
w05d302Bcom = imcomplement(w05d302B02);
w05d302B03 = medfilt2(w05d302Bcom,[3,3]);
w05d302B04 = imcomplement(w05d302B03); % DAPI(B): pre1

%w05d302H_Hfos (R)
w05d302H01 = imtophat(w05d302H, SE50);
w05d302Hcom = imcomplement(w05d302H01);
w05d302H02 = medfilt2(w05d302Hcom, [3,3]);
w05d302H03 = imcomplement(w05d302H02);
w05d302H03_T105 = w05d302H03 > 90; % H1a_fosi % T change <------------
w05d302B04_T120 = w05d302B04 > 120; % DAPI(B): pre2a
w05d302Hfos1 = imfuse(w05d302H03_T105, w05d302B04_T120, 'blend');
w05d302Hfos2 = w05d302Hfos1 > 140; % H1a_fosi (R): final
w05d302HB1 = imfuse(w05d302Hfos2, w05d302B04,'Colorchannel',[1 0 2]);

%w05d302F_Ffos (G)
w05d302F01 = imtophat(w05d302F, SE50);
w05d302Fcom = imcomplement(w05d302F01);
w05d302F02 = medfilt2(w05d302Fcom, [3,3]);
w05d302F03 = imcomplement(w05d302F02);
w05d302F03_T105 = w05d302F03 > 85; % Fos_fosi % T change <------------
w05d302B04_T120 = w05d302B04 > 120; % DAPI(B): pre2a
w05d302Ffos1 = imfuse(w05d302F03_T105, w05d302B04_T120, 'blend');
w05d302Ffos2 = w05d302Ffos1 > 140; % Fos_fosi (G): final
w05d302HFB2 = imoverlay(w05d302HB1,w05d302Ffos2,"green");
imwrite(w05d302HFB2, 'w05d302HFB2.tif');



%% w05d303

%w05d303B (B)
SE50 = strel('square',50);
w05d303B01 = imtophat(w05d303B, SE50);
w05d303Baht = adapthisteq(w05d303B01);
%avg = ones(3,3)/9;
w05d303Bmed = medfilt2(w05d303Baht,[3,3]);
w05d303B02 = imtophat(w05d303Bmed,SE50);
w05d303Bcom = imcomplement(w05d303B02);
w05d303B03 = medfilt2(w05d303Bcom,[3,3]);
w05d303B04 = imcomplement(w05d303B03); % DAPI(B): pre1

%w05d303H_Hfos (R)
w05d303H01 = imtophat(w05d303H, SE50);
w05d303Hcom = imcomplement(w05d303H01);
w05d303H02 = medfilt2(w05d303Hcom, [3,3]);
w05d303H03 = imcomplement(w05d303H02);
w05d303H03_T105 = w05d303H03 > 90; % H1a_fosi % T change <------------
w05d303B04_T120 = w05d303B04 > 120; % DAPI(B): pre2a
w05d303Hfos1 = imfuse(w05d303H03_T105, w05d303B04_T120, 'blend');
w05d303Hfos2 = w05d303Hfos1 > 140; % H1a_fosi (R): final
w05d303HB1 = imfuse(w05d303Hfos2, w05d303B04,'Colorchannel',[1 0 2]);

%w05d303F_Ffos (G)
w05d303F01 = imtophat(w05d303F, SE50);
w05d303Fcom = imcomplement(w05d303F01);
w05d303F02 = medfilt2(w05d303Fcom, [3,3]);
w05d303F03 = imcomplement(w05d303F02);
w05d303F03_T105 = w05d303F03 > 85; % Fos_fosi % T change <------------
w05d303B04_T120 = w05d303B04 > 120; % DAPI(B): pre2a
w05d303Ffos1 = imfuse(w05d303F03_T105, w05d303B04_T120, 'blend');
w05d303Ffos2 = w05d303Ffos1 > 140; % Fos_fosi (G): final
w05d303HFB2 = imoverlay(w05d303HB1,w05d303Ffos2,"green");
imwrite(w05d303HFB2, 'w05d303HFB2.tif');



