%% H1a-Fos catFISH 

w01d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d301H0.jpg');
w01d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d301F0.jpg');
w01d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d301B0a.jpg');
w01d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d301B0b.jpg');
w01d301B0 = imfuse(w01d301B0a, w01d301B0b, 'blend');
w01d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d302H0.jpg');
w01d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d302F0.jpg');
w01d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d302B0a.jpg');
w01d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d302B0b.jpg');
w01d302B0 = imfuse(w01d302B0a, w01d302B0b, 'blend');
w01d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d303H0.jpg');
w01d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d303F0.jpg');
w01d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d303B0a.jpg');
w01d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d303B0b.jpg');
w01d303B0 = imfuse(w01d303B0a, w01d303B0b, 'blend');
w01d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d304H0.jpg');
w01d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d304F0.jpg');
w01d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d304B0a.jpg');
w01d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w01d304B0b.jpg');
w01d304B0 = imfuse(w01d304B0a, w01d304B0b, 'blend');

w01d301H = w01d301H0(:,:,1);
w01d301F = w01d301F0(:,:,2);
w01d301B = w01d301B0(:,:,3);
w01d302H = w01d302H0(:,:,1);
w01d302F = w01d302F0(:,:,2);
w01d302B = w01d302B0(:,:,3);
w01d303H = w01d303H0(:,:,1);
w01d303F = w01d303F0(:,:,2);
w01d303B = w01d303B0(:,:,3);
w01d304H = w01d304H0(:,:,1);
w01d304F = w01d304F0(:,:,2);
w01d304B = w01d304B0(:,:,3);

%% w01d301

%w01d301B (B)
SE50 = strel('square',50);
w01d301B01 = imtophat(w01d301B, SE50);
w01d301Baht = adapthisteq(w01d301B01);
avg = ones(3,3)/9;
w01d301Bmed = medfilt2(w01d301Baht,[3,3]);
w01d301B02 = imtophat(w01d301Bmed,SE50);
w01d301Bcom = imcomplement(w01d301B02);
w01d301B03 = medfilt2(w01d301Bcom,[3,3]);
w01d301B04 = imcomplement(w01d301B03); % DAPI(B): pre1

%w01d301H_Hfos (R)
w01d301H01 = imtophat(w01d301H, SE50);
w01d301Hcom = imcomplement(w01d301H01);
w01d301H02 = medfilt2(w01d301Hcom, [3,3]);
w01d301H03 = imcomplement(w01d301H02);
w01d301H03_T105 = w01d301H03 > 90; % H1a_fosi % T change <------------
w01d301B04_T120 = w01d301B04 > 120; % DAPI(B): pre2a
w01d301Hfos1 = imfuse(w01d301H03_T105, w01d301B04_T120, 'blend');
w01d301Hfos2 = w01d301Hfos1 > 140; % H1a_fosi (R): final
w01d301HB1 = imfuse(w01d301Hfos2, w01d301B04,'Colorchannel',[1 0 2]);

%w01d301F_Ffos (G)
w01d301F01 = imtophat(w01d301F, SE50);
w01d301Fcom = imcomplement(w01d301F01);
w01d301F02 = medfilt2(w01d301Fcom, [3,3]);
w01d301F03 = imcomplement(w01d301F02);
w01d301F03_T105 = w01d301F03 > 85; % Fos_fosi % T change <------------
w01d301B04_T120 = w01d301B04 > 120; % DAPI(B): pre2a
w01d301Ffos1 = imfuse(w01d301F03_T105, w01d301B04_T120, 'blend');
w01d301Ffos2 = w01d301Ffos1 > 140; % Fos_fosi (G): final
w01d301HFB2 = imoverlay(w01d301HB1,w01d301Ffos2,"green");
imwrite(w01d301HFB2, 'w01d301HFB2.tif');



%% w01d302

%w01d302B (B)
SE50 = strel('square',50);
w01d302B01 = imtophat(w01d302B, SE50);
w01d302Baht = adapthisteq(w01d302B01);
%avg = ones(3,3)/9;
w01d302Bmed = medfilt2(w01d302Baht,[3,3]);
w01d302B02 = imtophat(w01d302Bmed,SE50);
w01d302Bcom = imcomplement(w01d302B02);
w01d302B03 = medfilt2(w01d302Bcom,[3,3]);
w01d302B04 = imcomplement(w01d302B03); % DAPI(B): pre1

%w01d302H_Hfos (R)
w01d302H01 = imtophat(w01d302H, SE50);
w01d302Hcom = imcomplement(w01d302H01);
w01d302H02 = medfilt2(w01d302Hcom, [3,3]);
w01d302H03 = imcomplement(w01d302H02);
w01d302H03_T105 = w01d302H03 > 90; % H1a_fosi % T change <------------
w01d302B04_T120 = w01d302B04 > 120; % DAPI(B): pre2a
w01d302Hfos1 = imfuse(w01d302H03_T105, w01d302B04_T120, 'blend');
w01d302Hfos2 = w01d302Hfos1 > 140; % H1a_fosi (R): final
w01d302HB1 = imfuse(w01d302Hfos2, w01d302B04,'Colorchannel',[1 0 2]);

%w01d302F_Ffos (G)
w01d302F01 = imtophat(w01d302F, SE50);
w01d302Fcom = imcomplement(w01d302F01);
w01d302F02 = medfilt2(w01d302Fcom, [3,3]);
w01d302F03 = imcomplement(w01d302F02);
w01d302F03_T105 = w01d302F03 > 85; % Fos_fosi % T change <------------
w01d302B04_T120 = w01d302B04 > 120; % DAPI(B): pre2a
w01d302Ffos1 = imfuse(w01d302F03_T105, w01d302B04_T120, 'blend');
w01d302Ffos2 = w01d302Ffos1 > 140; % Fos_fosi (G): final
w01d302HFB2 = imoverlay(w01d302HB1,w01d302Ffos2,"green");
imwrite(w01d302HFB2, 'w01d302HFB2.tif');



%% w01d303

%w01d303B (B)
SE50 = strel('square',50);
w01d303B01 = imtophat(w01d303B, SE50);
w01d303Baht = adapthisteq(w01d303B01);
%avg = ones(3,3)/9;
w01d303Bmed = medfilt2(w01d303Baht,[3,3]);
w01d303B02 = imtophat(w01d303Bmed,SE50);
w01d303Bcom = imcomplement(w01d303B02);
w01d303B03 = medfilt2(w01d303Bcom,[3,3]);
w01d303B04 = imcomplement(w01d303B03); % DAPI(B): pre1

%w01d303H_Hfos (R)
w01d303H01 = imtophat(w01d303H, SE50);
w01d303Hcom = imcomplement(w01d303H01);
w01d303H02 = medfilt2(w01d303Hcom, [3,3]);
w01d303H03 = imcomplement(w01d303H02);
w01d303H03_T105 = w01d303H03 > 90; % H1a_fosi % T change <------------
w01d303B04_T120 = w01d303B04 > 120; % DAPI(B): pre2a
w01d303Hfos1 = imfuse(w01d303H03_T105, w01d303B04_T120, 'blend');
w01d303Hfos2 = w01d303Hfos1 > 140; % H1a_fosi (R): final
w01d303HB1 = imfuse(w01d303Hfos2, w01d303B04,'Colorchannel',[1 0 2]);

%w01d303F_Ffos (G)
w01d303F01 = imtophat(w01d303F, SE50);
w01d303Fcom = imcomplement(w01d303F01);
w01d303F02 = medfilt2(w01d303Fcom, [3,3]);
w01d303F03 = imcomplement(w01d303F02);
w01d303F03_T105 = w01d303F03 > 85; % Fos_fosi % T change <------------
w01d303B04_T120 = w01d303B04 > 120; % DAPI(B): pre2a
w01d303Ffos1 = imfuse(w01d303F03_T105, w01d303B04_T120, 'blend');
w01d303Ffos2 = w01d303Ffos1 > 140; % Fos_fosi (G): final
w01d303HFB2 = imoverlay(w01d303HB1,w01d303Ffos2,"green");
imwrite(w01d303HFB2, 'w01d303HFB2.tif');



%% w01d304

%w01d304B (B)
SE50 = strel('square',50);
w01d304B01 = imtophat(w01d304B, SE50);
w01d304Baht = adapthisteq(w01d304B01);
%avg = ones(3,3)/9;
w01d304Bmed = medfilt2(w01d304Baht,[3,3]);
w01d304B02 = imtophat(w01d304Bmed,SE50);
w01d304Bcom = imcomplement(w01d304B02);
w01d304B03 = medfilt2(w01d304Bcom,[3,3]);
w01d304B04 = imcomplement(w01d304B03); % DAPI(B): pre1

%w01d304H_Hfos (R)
w01d304H01 = imtophat(w01d304H, SE50);
w01d304Hcom = imcomplement(w01d304H01);
w01d304H02 = medfilt2(w01d304Hcom, [3,3]);
w01d304H03 = imcomplement(w01d304H02);
w01d304H03_T105 = w01d304H03 > 90; % H1a_fosi % T change <------------
w01d304B04_T120 = w01d304B04 > 120; % DAPI(B): pre2a
w01d304Hfos1 = imfuse(w01d304H03_T105, w01d304B04_T120, 'blend');
w01d304Hfos2 = w01d304Hfos1 > 140; % H1a_fosi (R): final
w01d304HB1 = imfuse(w01d304Hfos2, w01d304B04,'Colorchannel',[1 0 2]);

%w01d304F_Ffos (G)
w01d304F01 = imtophat(w01d304F, SE50);
w01d304Fcom = imcomplement(w01d304F01);
w01d304F02 = medfilt2(w01d304Fcom, [3,3]);
w01d304F03 = imcomplement(w01d304F02);
w01d304F03_T105 = w01d304F03 > 85; % Fos_fosi % T change <------------
w01d304B04_T120 = w01d304B04 > 120; % DAPI(B): pre2a
w01d304Ffos1 = imfuse(w01d304F03_T105, w01d304B04_T120, 'blend');
w01d304Ffos2 = w01d304Ffos1 > 140; % Fos_fosi (G): final
w01d304HFB2 = imoverlay(w01d304HB1,w01d304Ffos2,"green");
imwrite(w01d304HFB2, 'w01d304HFB2.tif');


