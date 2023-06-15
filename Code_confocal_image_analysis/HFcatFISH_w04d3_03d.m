%% H1a-Fos catFISH 

w04d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d301H0.jpg');
w04d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d301F0.jpg');
w04d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d301B0a.jpg');
w04d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d301B0b.jpg');
w04d301B0 = imfuse(w04d301B0a, w04d301B0b, 'blend');
w04d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d302H0.jpg');
w04d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d302F0.jpg');
w04d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d302B0a.jpg');
w04d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d302B0b.jpg');
w04d302B0 = imfuse(w04d302B0a, w04d302B0b, 'blend');
w04d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d303H0.jpg');
w04d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d303F0.jpg');
w04d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d303B0a.jpg');
w04d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d303B0b.jpg');
w04d303B0 = imfuse(w04d303B0a, w04d303B0b, 'blend');
w04d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d304H0.jpg');
w04d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d304F0.jpg');
w04d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d304B0a.jpg');
w04d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w04d304B0b.jpg');
w04d304B0 = imfuse(w04d304B0a, w04d304B0b, 'blend');

w04d301H = w04d301H0(:,:,1);
w04d301F = w04d301F0(:,:,2);
w04d301B = w04d301B0(:,:,3);
w04d302H = w04d302H0(:,:,1);
w04d302F = w04d302F0(:,:,2);
w04d302B = w04d302B0(:,:,3);
w04d303H = w04d303H0(:,:,1);
w04d303F = w04d303F0(:,:,2);
w04d303B = w04d303B0(:,:,3);
w04d304H = w04d304H0(:,:,1);
w04d304F = w04d304F0(:,:,2);
w04d304B = w04d304B0(:,:,3);

%% w04d301

%w04d301B (B)
SE50 = strel('square',50);
w04d301B01 = imtophat(w04d301B, SE50);
w04d301Baht = adapthisteq(w04d301B01);
avg = ones(3,3)/9;
w04d301Bmed = medfilt2(w04d301Baht,[3,3]);
w04d301B02 = imtophat(w04d301Bmed,SE50);
w04d301Bcom = imcomplement(w04d301B02);
w04d301B03 = medfilt2(w04d301Bcom,[3,3]);
w04d301B04 = imcomplement(w04d301B03); % DAPI(B): pre1

%w04d301H_Hfos (R)
w04d301H01 = imtophat(w04d301H, SE50);
w04d301Hcom = imcomplement(w04d301H01);
w04d301H02 = medfilt2(w04d301Hcom, [3,3]);
w04d301H03 = imcomplement(w04d301H02);
w04d301H03_T105 = w04d301H03 > 90; % H1a_fosi % T change <------------
w04d301B04_T120 = w04d301B04 > 120; % DAPI(B): pre2a
w04d301Hfos1 = imfuse(w04d301H03_T105, w04d301B04_T120, 'blend');
w04d301Hfos2 = w04d301Hfos1 > 140; % H1a_fosi (R): final
w04d301HB1 = imfuse(w04d301Hfos2, w04d301B04,'Colorchannel',[1 0 2]);

%w04d301F_Ffos (G)
w04d301F01 = imtophat(w04d301F, SE50);
w04d301Fcom = imcomplement(w04d301F01);
w04d301F02 = medfilt2(w04d301Fcom, [3,3]);
w04d301F03 = imcomplement(w04d301F02);
w04d301F03_T105 = w04d301F03 > 85; % Fos_fosi % T change <------------
w04d301B04_T120 = w04d301B04 > 120; % DAPI(B): pre2a
w04d301Ffos1 = imfuse(w04d301F03_T105, w04d301B04_T120, 'blend');
w04d301Ffos2 = w04d301Ffos1 > 140; % Fos_fosi (G): final
w04d301HFB2 = imoverlay(w04d301HB1,w04d301Ffos2,"green");
imwrite(w04d301HFB2, 'w04d301HFB2.tif');



%% w04d302

%w04d302B (B)
SE50 = strel('square',50);
w04d302B01 = imtophat(w04d302B, SE50);
w04d302Baht = adapthisteq(w04d302B01);
%avg = ones(3,3)/9;
w04d302Bmed = medfilt2(w04d302Baht,[3,3]);
w04d302B02 = imtophat(w04d302Bmed,SE50);
w04d302Bcom = imcomplement(w04d302B02);
w04d302B03 = medfilt2(w04d302Bcom,[3,3]);
w04d302B04 = imcomplement(w04d302B03); % DAPI(B): pre1

%w04d302H_Hfos (R)
w04d302H01 = imtophat(w04d302H, SE50);
w04d302Hcom = imcomplement(w04d302H01);
w04d302H02 = medfilt2(w04d302Hcom, [3,3]);
w04d302H03 = imcomplement(w04d302H02);
w04d302H03_T105 = w04d302H03 > 90; % H1a_fosi % T change <------------
w04d302B04_T120 = w04d302B04 > 120; % DAPI(B): pre2a
w04d302Hfos1 = imfuse(w04d302H03_T105, w04d302B04_T120, 'blend');
w04d302Hfos2 = w04d302Hfos1 > 140; % H1a_fosi (R): final
w04d302HB1 = imfuse(w04d302Hfos2, w04d302B04,'Colorchannel',[1 0 2]);

%w04d302F_Ffos (G)
w04d302F01 = imtophat(w04d302F, SE50);
w04d302Fcom = imcomplement(w04d302F01);
w04d302F02 = medfilt2(w04d302Fcom, [3,3]);
w04d302F03 = imcomplement(w04d302F02);
w04d302F03_T105 = w04d302F03 > 85; % Fos_fosi % T change <------------
w04d302B04_T120 = w04d302B04 > 120; % DAPI(B): pre2a
w04d302Ffos1 = imfuse(w04d302F03_T105, w04d302B04_T120, 'blend');
w04d302Ffos2 = w04d302Ffos1 > 140; % Fos_fosi (G): final
w04d302HFB2 = imoverlay(w04d302HB1,w04d302Ffos2,"green");
imwrite(w04d302HFB2, 'w04d302HFB2.tif');



%% w04d303

%w04d303B (B)
SE50 = strel('square',50);
w04d303B01 = imtophat(w04d303B, SE50);
w04d303Baht = adapthisteq(w04d303B01);
%avg = ones(3,3)/9;
w04d303Bmed = medfilt2(w04d303Baht,[3,3]);
w04d303B02 = imtophat(w04d303Bmed,SE50);
w04d303Bcom = imcomplement(w04d303B02);
w04d303B03 = medfilt2(w04d303Bcom,[3,3]);
w04d303B04 = imcomplement(w04d303B03); % DAPI(B): pre1

%w04d303H_Hfos (R)
w04d303H01 = imtophat(w04d303H, SE50);
w04d303Hcom = imcomplement(w04d303H01);
w04d303H02 = medfilt2(w04d303Hcom, [3,3]);
w04d303H03 = imcomplement(w04d303H02);
w04d303H03_T105 = w04d303H03 > 90; % H1a_fosi % T change <------------
w04d303B04_T120 = w04d303B04 > 120; % DAPI(B): pre2a
w04d303Hfos1 = imfuse(w04d303H03_T105, w04d303B04_T120, 'blend');
w04d303Hfos2 = w04d303Hfos1 > 140; % H1a_fosi (R): final
w04d303HB1 = imfuse(w04d303Hfos2, w04d303B04,'Colorchannel',[1 0 2]);

%w04d303F_Ffos (G)
w04d303F01 = imtophat(w04d303F, SE50);
w04d303Fcom = imcomplement(w04d303F01);
w04d303F02 = medfilt2(w04d303Fcom, [3,3]);
w04d303F03 = imcomplement(w04d303F02);
w04d303F03_T105 = w04d303F03 > 85; % Fos_fosi % T change <------------
w04d303B04_T120 = w04d303B04 > 120; % DAPI(B): pre2a
w04d303Ffos1 = imfuse(w04d303F03_T105, w04d303B04_T120, 'blend');
w04d303Ffos2 = w04d303Ffos1 > 140; % Fos_fosi (G): final
w04d303HFB2 = imoverlay(w04d303HB1,w04d303Ffos2,"green");
imwrite(w04d303HFB2, 'w04d303HFB2.tif');



%% w04d304

%w04d304B (B)
SE50 = strel('square',50);
w04d304B01 = imtophat(w04d304B, SE50);
w04d304Baht = adapthisteq(w04d304B01);
%avg = ones(3,3)/9;
w04d304Bmed = medfilt2(w04d304Baht,[3,3]);
w04d304B02 = imtophat(w04d304Bmed,SE50);
w04d304Bcom = imcomplement(w04d304B02);
w04d304B03 = medfilt2(w04d304Bcom,[3,3]);
w04d304B04 = imcomplement(w04d304B03); % DAPI(B): pre1

%w04d304H_Hfos (R)
w04d304H01 = imtophat(w04d304H, SE50);
w04d304Hcom = imcomplement(w04d304H01);
w04d304H02 = medfilt2(w04d304Hcom, [3,3]);
w04d304H03 = imcomplement(w04d304H02);
w04d304H03_T105 = w04d304H03 > 90; % H1a_fosi % T change <------------
w04d304B04_T120 = w04d304B04 > 120; % DAPI(B): pre2a
w04d304Hfos1 = imfuse(w04d304H03_T105, w04d304B04_T120, 'blend');
w04d304Hfos2 = w04d304Hfos1 > 140; % H1a_fosi (R): final
w04d304HB1 = imfuse(w04d304Hfos2, w04d304B04,'Colorchannel',[1 0 2]);

%w04d304F_Ffos (G)
w04d304F01 = imtophat(w04d304F, SE50);
w04d304Fcom = imcomplement(w04d304F01);
w04d304F02 = medfilt2(w04d304Fcom, [3,3]);
w04d304F03 = imcomplement(w04d304F02);
w04d304F03_T105 = w04d304F03 > 85; % Fos_fosi % T change <------------
w04d304B04_T120 = w04d304B04 > 120; % DAPI(B): pre2a
w04d304Ffos1 = imfuse(w04d304F03_T105, w04d304B04_T120, 'blend');
w04d304Ffos2 = w04d304Ffos1 > 140; % Fos_fosi (G): final
w04d304HFB2 = imoverlay(w04d304HB1,w04d304Ffos2,"green");
imwrite(w04d304HFB2, 'w04d304HFB2.tif');


