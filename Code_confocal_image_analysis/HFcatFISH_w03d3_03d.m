%% H1a-Fos catFISH 

w03d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d301H0.jpg');
w03d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d301F0.jpg');
w03d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d301B0a.jpg');
w03d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d301B0b.jpg');
w03d301B0 = imfuse(w03d301B0a, w03d301B0b, 'blend');
w03d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d302H0.jpg');
w03d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d302F0.jpg');
w03d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d302B0a.jpg');
w03d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d302B0b.jpg');
w03d302B0 = imfuse(w03d302B0a, w03d302B0b, 'blend');
w03d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d303H0.jpg');
w03d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d303F0.jpg');
w03d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d303B0a.jpg');
w03d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d303B0b.jpg');
w03d303B0 = imfuse(w03d303B0a, w03d303B0b, 'blend');
w03d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d304H0.jpg');
w03d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d304F0.jpg');
w03d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d304B0a.jpg');
w03d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w03d304B0b.jpg');
w03d304B0 = imfuse(w03d304B0a, w03d304B0b, 'blend');

w03d301H = w03d301H0(:,:,1);
w03d301F = w03d301F0(:,:,2);
w03d301B = w03d301B0(:,:,3);
w03d302H = w03d302H0(:,:,1);
w03d302F = w03d302F0(:,:,2);
w03d302B = w03d302B0(:,:,3);
w03d303H = w03d303H0(:,:,1);
w03d303F = w03d303F0(:,:,2);
w03d303B = w03d303B0(:,:,3);
w03d304H = w03d304H0(:,:,1);
w03d304F = w03d304F0(:,:,2);
w03d304B = w03d304B0(:,:,3);

%% w03d301

%w03d301B (B)
SE50 = strel('square',50);
w03d301B01 = imtophat(w03d301B, SE50);
w03d301Baht = adapthisteq(w03d301B01);
avg = ones(3,3)/9;
w03d301Bmed = medfilt2(w03d301Baht,[3,3]);
w03d301B02 = imtophat(w03d301Bmed,SE50);
w03d301Bcom = imcomplement(w03d301B02);
w03d301B03 = medfilt2(w03d301Bcom,[3,3]);
w03d301B04 = imcomplement(w03d301B03); % DAPI(B): pre1

%w03d301H_Hfos (R)
w03d301H01 = imtophat(w03d301H, SE50);
w03d301Hcom = imcomplement(w03d301H01);
w03d301H02 = medfilt2(w03d301Hcom, [3,3]);
w03d301H03 = imcomplement(w03d301H02);
w03d301H03_T105 = w03d301H03 > 90; % H1a_fosi % T change <------------
w03d301B04_T120 = w03d301B04 > 120; % DAPI(B): pre2a
w03d301Hfos1 = imfuse(w03d301H03_T105, w03d301B04_T120, 'blend');
w03d301Hfos2 = w03d301Hfos1 > 140; % H1a_fosi (R): final
w03d301HB1 = imfuse(w03d301Hfos2, w03d301B04,'Colorchannel',[1 0 2]);

%w03d301F_Ffos (G)
w03d301F01 = imtophat(w03d301F, SE50);
w03d301Fcom = imcomplement(w03d301F01);
w03d301F02 = medfilt2(w03d301Fcom, [3,3]);
w03d301F03 = imcomplement(w03d301F02);
w03d301F03_T105 = w03d301F03 > 85; % Fos_fosi % T change <------------
w03d301B04_T120 = w03d301B04 > 120; % DAPI(B): pre2a
w03d301Ffos1 = imfuse(w03d301F03_T105, w03d301B04_T120, 'blend');
w03d301Ffos2 = w03d301Ffos1 > 140; % Fos_fosi (G): final
w03d301HFB2 = imoverlay(w03d301HB1,w03d301Ffos2,"green");
imwrite(w03d301HFB2, 'w03d301HFB2.tif');



%% w03d302

%w03d302B (B)
SE50 = strel('square',50);
w03d302B01 = imtophat(w03d302B, SE50);
w03d302Baht = adapthisteq(w03d302B01);
%avg = ones(3,3)/9;
w03d302Bmed = medfilt2(w03d302Baht,[3,3]);
w03d302B02 = imtophat(w03d302Bmed,SE50);
w03d302Bcom = imcomplement(w03d302B02);
w03d302B03 = medfilt2(w03d302Bcom,[3,3]);
w03d302B04 = imcomplement(w03d302B03); % DAPI(B): pre1

%w03d302H_Hfos (R)
w03d302H01 = imtophat(w03d302H, SE50);
w03d302Hcom = imcomplement(w03d302H01);
w03d302H02 = medfilt2(w03d302Hcom, [3,3]);
w03d302H03 = imcomplement(w03d302H02);
w03d302H03_T105 = w03d302H03 > 90; % H1a_fosi % T change <------------
w03d302B04_T120 = w03d302B04 > 120; % DAPI(B): pre2a
w03d302Hfos1 = imfuse(w03d302H03_T105, w03d302B04_T120, 'blend');
w03d302Hfos2 = w03d302Hfos1 > 140; % H1a_fosi (R): final
w03d302HB1 = imfuse(w03d302Hfos2, w03d302B04,'Colorchannel',[1 0 2]);

%w03d302F_Ffos (G)
w03d302F01 = imtophat(w03d302F, SE50);
w03d302Fcom = imcomplement(w03d302F01);
w03d302F02 = medfilt2(w03d302Fcom, [3,3]);
w03d302F03 = imcomplement(w03d302F02);
w03d302F03_T105 = w03d302F03 > 85; % Fos_fosi % T change <------------
w03d302B04_T120 = w03d302B04 > 120; % DAPI(B): pre2a
w03d302Ffos1 = imfuse(w03d302F03_T105, w03d302B04_T120, 'blend');
w03d302Ffos2 = w03d302Ffos1 > 140; % Fos_fosi (G): final
w03d302HFB2 = imoverlay(w03d302HB1,w03d302Ffos2,"green");
imwrite(w03d302HFB2, 'w03d302HFB2.tif');



%% w03d303

%w03d303B (B)
SE50 = strel('square',50);
w03d303B01 = imtophat(w03d303B, SE50);
w03d303Baht = adapthisteq(w03d303B01);
%avg = ones(3,3)/9;
w03d303Bmed = medfilt2(w03d303Baht,[3,3]);
w03d303B02 = imtophat(w03d303Bmed,SE50);
w03d303Bcom = imcomplement(w03d303B02);
w03d303B03 = medfilt2(w03d303Bcom,[3,3]);
w03d303B04 = imcomplement(w03d303B03); % DAPI(B): pre1

%w03d303H_Hfos (R)
w03d303H01 = imtophat(w03d303H, SE50);
w03d303Hcom = imcomplement(w03d303H01);
w03d303H02 = medfilt2(w03d303Hcom, [3,3]);
w03d303H03 = imcomplement(w03d303H02);
w03d303H03_T105 = w03d303H03 > 90; % H1a_fosi % T change <------------
w03d303B04_T120 = w03d303B04 > 120; % DAPI(B): pre2a
w03d303Hfos1 = imfuse(w03d303H03_T105, w03d303B04_T120, 'blend');
w03d303Hfos2 = w03d303Hfos1 > 140; % H1a_fosi (R): final
w03d303HB1 = imfuse(w03d303Hfos2, w03d303B04,'Colorchannel',[1 0 2]);

%w03d303F_Ffos (G)
w03d303F01 = imtophat(w03d303F, SE50);
w03d303Fcom = imcomplement(w03d303F01);
w03d303F02 = medfilt2(w03d303Fcom, [3,3]);
w03d303F03 = imcomplement(w03d303F02);
w03d303F03_T105 = w03d303F03 > 85; % Fos_fosi % T change <------------
w03d303B04_T120 = w03d303B04 > 120; % DAPI(B): pre2a
w03d303Ffos1 = imfuse(w03d303F03_T105, w03d303B04_T120, 'blend');
w03d303Ffos2 = w03d303Ffos1 > 140; % Fos_fosi (G): final
w03d303HFB2 = imoverlay(w03d303HB1,w03d303Ffos2,"green");
imwrite(w03d303HFB2, 'w03d303HFB2.tif');



%% w03d304

%w03d304B (B)
SE50 = strel('square',50);
w03d304B01 = imtophat(w03d304B, SE50);
w03d304Baht = adapthisteq(w03d304B01);
%avg = ones(3,3)/9;
w03d304Bmed = medfilt2(w03d304Baht,[3,3]);
w03d304B02 = imtophat(w03d304Bmed,SE50);
w03d304Bcom = imcomplement(w03d304B02);
w03d304B03 = medfilt2(w03d304Bcom,[3,3]);
w03d304B04 = imcomplement(w03d304B03); % DAPI(B): pre1

%w03d304H_Hfos (R)
w03d304H01 = imtophat(w03d304H, SE50);
w03d304Hcom = imcomplement(w03d304H01);
w03d304H02 = medfilt2(w03d304Hcom, [3,3]);
w03d304H03 = imcomplement(w03d304H02);
w03d304H03_T105 = w03d304H03 > 90; % H1a_fosi % T change <------------
w03d304B04_T120 = w03d304B04 > 120; % DAPI(B): pre2a
w03d304Hfos1 = imfuse(w03d304H03_T105, w03d304B04_T120, 'blend');
w03d304Hfos2 = w03d304Hfos1 > 140; % H1a_fosi (R): final
w03d304HB1 = imfuse(w03d304Hfos2, w03d304B04,'Colorchannel',[1 0 2]);

%w03d304F_Ffos (G)
w03d304F01 = imtophat(w03d304F, SE50);
w03d304Fcom = imcomplement(w03d304F01);
w03d304F02 = medfilt2(w03d304Fcom, [3,3]);
w03d304F03 = imcomplement(w03d304F02);
w03d304F03_T105 = w03d304F03 > 85; % Fos_fosi % T change <------------
w03d304B04_T120 = w03d304B04 > 120; % DAPI(B): pre2a
w03d304Ffos1 = imfuse(w03d304F03_T105, w03d304B04_T120, 'blend');
w03d304Ffos2 = w03d304Ffos1 > 140; % Fos_fosi (G): final
w03d304HFB2 = imoverlay(w03d304HB1,w03d304Ffos2,"green");
imwrite(w03d304HFB2, 'w03d304HFB2.tif');


