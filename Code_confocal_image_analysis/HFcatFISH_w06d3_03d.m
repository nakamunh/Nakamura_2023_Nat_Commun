%% H1a-Fos catFISH 

w06d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d301H0.jpg');
w06d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d301F0.jpg');
w06d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d301B0a.jpg');
w06d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d301B0b.jpg');
w06d301B0 = imfuse(w06d301B0a, w06d301B0b, 'blend');
w06d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d302H0.jpg');
w06d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d302F0.jpg');
w06d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d302B0a.jpg');
w06d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d302B0b.jpg');
w06d302B0 = imfuse(w06d302B0a, w06d302B0b, 'blend');
w06d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d303H0.jpg');
w06d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d303F0.jpg');
w06d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d303B0a.jpg');
w06d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d303B0b.jpg');
w06d303B0 = imfuse(w06d303B0a, w06d303B0b, 'blend');
w06d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d304H0.jpg');
w06d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d304F0.jpg');
w06d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d304B0a.jpg');
w06d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w06d304B0b.jpg');
w06d304B0 = imfuse(w06d304B0a, w06d304B0b, 'blend');

w06d301H = w06d301H0(:,:,1);
w06d301F = w06d301F0(:,:,2);
w06d301B = w06d301B0(:,:,3);
w06d302H = w06d302H0(:,:,1);
w06d302F = w06d302F0(:,:,2);
w06d302B = w06d302B0(:,:,3);
w06d303H = w06d303H0(:,:,1);
w06d303F = w06d303F0(:,:,2);
w06d303B = w06d303B0(:,:,3);
w06d304H = w06d304H0(:,:,1);
w06d304F = w06d304F0(:,:,2);
w06d304B = w06d304B0(:,:,3);

%% w06d301

%w06d301B (B)
SE50 = strel('square',50);
w06d301B01 = imtophat(w06d301B, SE50);
w06d301Baht = adapthisteq(w06d301B01);
avg = ones(3,3)/9;
w06d301Bmed = medfilt2(w06d301Baht,[3,3]);
w06d301B02 = imtophat(w06d301Bmed,SE50);
w06d301Bcom = imcomplement(w06d301B02);
w06d301B03 = medfilt2(w06d301Bcom,[3,3]);
w06d301B04 = imcomplement(w06d301B03); % DAPI(B): pre1

%w06d301H_Hfos (R)
w06d301H01 = imtophat(w06d301H, SE50);
w06d301Hcom = imcomplement(w06d301H01);
w06d301H02 = medfilt2(w06d301Hcom, [3,3]);
w06d301H03 = imcomplement(w06d301H02);
w06d301H03_T105 = w06d301H03 > 90; % H1a_fosi % T change <------------
w06d301B04_T120 = w06d301B04 > 120; % DAPI(B): pre2a
w06d301Hfos1 = imfuse(w06d301H03_T105, w06d301B04_T120, 'blend');
w06d301Hfos2 = w06d301Hfos1 > 140; % H1a_fosi (R): final
w06d301HB1 = imfuse(w06d301Hfos2, w06d301B04,'Colorchannel',[1 0 2]);

%w06d301F_Ffos (G)
w06d301F01 = imtophat(w06d301F, SE50);
w06d301Fcom = imcomplement(w06d301F01);
w06d301F02 = medfilt2(w06d301Fcom, [3,3]);
w06d301F03 = imcomplement(w06d301F02);
w06d301F03_T105 = w06d301F03 > 85; % Fos_fosi % T change <------------
w06d301B04_T120 = w06d301B04 > 120; % DAPI(B): pre2a
w06d301Ffos1 = imfuse(w06d301F03_T105, w06d301B04_T120, 'blend');
w06d301Ffos2 = w06d301Ffos1 > 140; % Fos_fosi (G): final
w06d301HFB2 = imoverlay(w06d301HB1,w06d301Ffos2,"green");
imwrite(w06d301HFB2, 'w06d301HFB2.tif');



%% w06d302

%w06d302B (B)
SE50 = strel('square',50);
w06d302B01 = imtophat(w06d302B, SE50);
w06d302Baht = adapthisteq(w06d302B01);
%avg = ones(3,3)/9;
w06d302Bmed = medfilt2(w06d302Baht,[3,3]);
w06d302B02 = imtophat(w06d302Bmed,SE50);
w06d302Bcom = imcomplement(w06d302B02);
w06d302B03 = medfilt2(w06d302Bcom,[3,3]);
w06d302B04 = imcomplement(w06d302B03); % DAPI(B): pre1

%w06d302H_Hfos (R)
w06d302H01 = imtophat(w06d302H, SE50);
w06d302Hcom = imcomplement(w06d302H01);
w06d302H02 = medfilt2(w06d302Hcom, [3,3]);
w06d302H03 = imcomplement(w06d302H02);
w06d302H03_T105 = w06d302H03 > 90; % H1a_fosi % T change <------------
w06d302B04_T120 = w06d302B04 > 120; % DAPI(B): pre2a
w06d302Hfos1 = imfuse(w06d302H03_T105, w06d302B04_T120, 'blend');
w06d302Hfos2 = w06d302Hfos1 > 140; % H1a_fosi (R): final
w06d302HB1 = imfuse(w06d302Hfos2, w06d302B04,'Colorchannel',[1 0 2]);

%w06d302F_Ffos (G)
w06d302F01 = imtophat(w06d302F, SE50);
w06d302Fcom = imcomplement(w06d302F01);
w06d302F02 = medfilt2(w06d302Fcom, [3,3]);
w06d302F03 = imcomplement(w06d302F02);
w06d302F03_T105 = w06d302F03 > 85; % Fos_fosi % T change <------------
w06d302B04_T120 = w06d302B04 > 120; % DAPI(B): pre2a
w06d302Ffos1 = imfuse(w06d302F03_T105, w06d302B04_T120, 'blend');
w06d302Ffos2 = w06d302Ffos1 > 140; % Fos_fosi (G): final
w06d302HFB2 = imoverlay(w06d302HB1,w06d302Ffos2,"green");
imwrite(w06d302HFB2, 'w06d302HFB2.tif');



%% w06d303

%w06d303B (B)
SE50 = strel('square',50);
w06d303B01 = imtophat(w06d303B, SE50);
w06d303Baht = adapthisteq(w06d303B01);
%avg = ones(3,3)/9;
w06d303Bmed = medfilt2(w06d303Baht,[3,3]);
w06d303B02 = imtophat(w06d303Bmed,SE50);
w06d303Bcom = imcomplement(w06d303B02);
w06d303B03 = medfilt2(w06d303Bcom,[3,3]);
w06d303B04 = imcomplement(w06d303B03); % DAPI(B): pre1

%w06d303H_Hfos (R)
w06d303H01 = imtophat(w06d303H, SE50);
w06d303Hcom = imcomplement(w06d303H01);
w06d303H02 = medfilt2(w06d303Hcom, [3,3]);
w06d303H03 = imcomplement(w06d303H02);
w06d303H03_T105 = w06d303H03 > 90; % H1a_fosi % T change <------------
w06d303B04_T120 = w06d303B04 > 120; % DAPI(B): pre2a
w06d303Hfos1 = imfuse(w06d303H03_T105, w06d303B04_T120, 'blend');
w06d303Hfos2 = w06d303Hfos1 > 140; % H1a_fosi (R): final
w06d303HB1 = imfuse(w06d303Hfos2, w06d303B04,'Colorchannel',[1 0 2]);

%w06d303F_Ffos (G)
w06d303F01 = imtophat(w06d303F, SE50);
w06d303Fcom = imcomplement(w06d303F01);
w06d303F02 = medfilt2(w06d303Fcom, [3,3]);
w06d303F03 = imcomplement(w06d303F02);
w06d303F03_T105 = w06d303F03 > 85; % Fos_fosi % T change <------------
w06d303B04_T120 = w06d303B04 > 120; % DAPI(B): pre2a
w06d303Ffos1 = imfuse(w06d303F03_T105, w06d303B04_T120, 'blend');
w06d303Ffos2 = w06d303Ffos1 > 140; % Fos_fosi (G): final
w06d303HFB2 = imoverlay(w06d303HB1,w06d303Ffos2,"green");
imwrite(w06d303HFB2, 'w06d303HFB2.tif');



%% w06d304

%w06d304B (B)
SE50 = strel('square',50);
w06d304B01 = imtophat(w06d304B, SE50);
w06d304Baht = adapthisteq(w06d304B01);
%avg = ones(3,3)/9;
w06d304Bmed = medfilt2(w06d304Baht,[3,3]);
w06d304B02 = imtophat(w06d304Bmed,SE50);
w06d304Bcom = imcomplement(w06d304B02);
w06d304B03 = medfilt2(w06d304Bcom,[3,3]);
w06d304B04 = imcomplement(w06d304B03); % DAPI(B): pre1

%w06d304H_Hfos (R)
w06d304H01 = imtophat(w06d304H, SE50);
w06d304Hcom = imcomplement(w06d304H01);
w06d304H02 = medfilt2(w06d304Hcom, [3,3]);
w06d304H03 = imcomplement(w06d304H02);
w06d304H03_T105 = w06d304H03 > 90; % H1a_fosi % T change <------------
w06d304B04_T120 = w06d304B04 > 120; % DAPI(B): pre2a
w06d304Hfos1 = imfuse(w06d304H03_T105, w06d304B04_T120, 'blend');
w06d304Hfos2 = w06d304Hfos1 > 140; % H1a_fosi (R): final
w06d304HB1 = imfuse(w06d304Hfos2, w06d304B04,'Colorchannel',[1 0 2]);

%w06d304F_Ffos (G)
w06d304F01 = imtophat(w06d304F, SE50);
w06d304Fcom = imcomplement(w06d304F01);
w06d304F02 = medfilt2(w06d304Fcom, [3,3]);
w06d304F03 = imcomplement(w06d304F02);
w06d304F03_T105 = w06d304F03 > 85; % Fos_fosi % T change <------------
w06d304B04_T120 = w06d304B04 > 120; % DAPI(B): pre2a
w06d304Ffos1 = imfuse(w06d304F03_T105, w06d304B04_T120, 'blend');
w06d304Ffos2 = w06d304Ffos1 > 140; % Fos_fosi (G): final
w06d304HFB2 = imoverlay(w06d304HB1,w06d304Ffos2,"green");
imwrite(w06d304HFB2, 'w06d304HFB2.tif');


