%% H1a-Fos catFISH 

w02d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d301H0.jpg');
w02d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d301F0.jpg');
w02d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d301B0a.jpg');
w02d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d301B0b.jpg');
w02d301B0 = imfuse(w02d301B0a, w02d301B0b, 'blend');
w02d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d302H0.jpg');
w02d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d302F0.jpg');
w02d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d302B0a.jpg');
w02d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d302B0b.jpg');
w02d302B0 = imfuse(w02d302B0a, w02d302B0b, 'blend');
w02d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d303H0.jpg');
w02d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d303F0.jpg');
w02d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d303B0a.jpg');
w02d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d303B0b.jpg');
w02d303B0 = imfuse(w02d303B0a, w02d303B0b, 'blend');
w02d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d304H0.jpg');
w02d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d304F0.jpg');
w02d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d304B0a.jpg');
w02d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w02d304B0b.jpg');
w02d304B0 = imfuse(w02d304B0a, w02d304B0b, 'blend');

w02d301H = w02d301H0(:,:,1);
w02d301F = w02d301F0(:,:,2);
w02d301B = w02d301B0(:,:,3);
w02d302H = w02d302H0(:,:,1);
w02d302F = w02d302F0(:,:,2);
w02d302B = w02d302B0(:,:,3);
w02d303H = w02d303H0(:,:,1);
w02d303F = w02d303F0(:,:,2);
w02d303B = w02d303B0(:,:,3);
w02d304H = w02d304H0(:,:,1);
w02d304F = w02d304F0(:,:,2);
w02d304B = w02d304B0(:,:,3);

%% w02d301

%w02d301B (B)
SE50 = strel('square',50);
w02d301B01 = imtophat(w02d301B, SE50);
w02d301Baht = adapthisteq(w02d301B01);
avg = ones(3,3)/9;
w02d301Bmed = medfilt2(w02d301Baht,[3,3]);
w02d301B02 = imtophat(w02d301Bmed,SE50);
w02d301Bcom = imcomplement(w02d301B02);
w02d301B03 = medfilt2(w02d301Bcom,[3,3]);
w02d301B04 = imcomplement(w02d301B03); % DAPI(B): pre1

%w02d301H_Hfos (R)
w02d301H01 = imtophat(w02d301H, SE50);
w02d301Hcom = imcomplement(w02d301H01);
w02d301H02 = medfilt2(w02d301Hcom, [3,3]);
w02d301H03 = imcomplement(w02d301H02);
w02d301H03_T105 = w02d301H03 > 90; % H1a_fosi % T change <------------
w02d301B04_T120 = w02d301B04 > 120; % DAPI(B): pre2a
w02d301Hfos1 = imfuse(w02d301H03_T105, w02d301B04_T120, 'blend');
w02d301Hfos2 = w02d301Hfos1 > 140; % H1a_fosi (R): final
w02d301HB1 = imfuse(w02d301Hfos2, w02d301B04,'Colorchannel',[1 0 2]);

%w02d301F_Ffos (G)
w02d301F01 = imtophat(w02d301F, SE50);
w02d301Fcom = imcomplement(w02d301F01);
w02d301F02 = medfilt2(w02d301Fcom, [3,3]);
w02d301F03 = imcomplement(w02d301F02);
w02d301F03_T105 = w02d301F03 > 85; % Fos_fosi % T change <------------
w02d301B04_T120 = w02d301B04 > 120; % DAPI(B): pre2a
w02d301Ffos1 = imfuse(w02d301F03_T105, w02d301B04_T120, 'blend');
w02d301Ffos2 = w02d301Ffos1 > 140; % Fos_fosi (G): final
w02d301HFB2 = imoverlay(w02d301HB1,w02d301Ffos2,"green");
imwrite(w02d301HFB2, 'w02d301HFB2.tif');



%% w02d302

%w02d302B (B)
SE50 = strel('square',50);
w02d302B01 = imtophat(w02d302B, SE50);
w02d302Baht = adapthisteq(w02d302B01);
%avg = ones(3,3)/9;
w02d302Bmed = medfilt2(w02d302Baht,[3,3]);
w02d302B02 = imtophat(w02d302Bmed,SE50);
w02d302Bcom = imcomplement(w02d302B02);
w02d302B03 = medfilt2(w02d302Bcom,[3,3]);
w02d302B04 = imcomplement(w02d302B03); % DAPI(B): pre1

%w02d302H_Hfos (R)
w02d302H01 = imtophat(w02d302H, SE50);
w02d302Hcom = imcomplement(w02d302H01);
w02d302H02 = medfilt2(w02d302Hcom, [3,3]);
w02d302H03 = imcomplement(w02d302H02);
w02d302H03_T105 = w02d302H03 > 90; % H1a_fosi % T change <------------
w02d302B04_T120 = w02d302B04 > 120; % DAPI(B): pre2a
w02d302Hfos1 = imfuse(w02d302H03_T105, w02d302B04_T120, 'blend');
w02d302Hfos2 = w02d302Hfos1 > 140; % H1a_fosi (R): final
w02d302HB1 = imfuse(w02d302Hfos2, w02d302B04,'Colorchannel',[1 0 2]);

%w02d302F_Ffos (G)
w02d302F01 = imtophat(w02d302F, SE50);
w02d302Fcom = imcomplement(w02d302F01);
w02d302F02 = medfilt2(w02d302Fcom, [3,3]);
w02d302F03 = imcomplement(w02d302F02);
w02d302F03_T105 = w02d302F03 > 85; % Fos_fosi % T change <------------
w02d302B04_T120 = w02d302B04 > 120; % DAPI(B): pre2a
w02d302Ffos1 = imfuse(w02d302F03_T105, w02d302B04_T120, 'blend');
w02d302Ffos2 = w02d302Ffos1 > 140; % Fos_fosi (G): final
w02d302HFB2 = imoverlay(w02d302HB1,w02d302Ffos2,"green");
imwrite(w02d302HFB2, 'w02d302HFB2.tif');



%% w02d303

%w02d303B (B)
SE50 = strel('square',50);
w02d303B01 = imtophat(w02d303B, SE50);
w02d303Baht = adapthisteq(w02d303B01);
%avg = ones(3,3)/9;
w02d303Bmed = medfilt2(w02d303Baht,[3,3]);
w02d303B02 = imtophat(w02d303Bmed,SE50);
w02d303Bcom = imcomplement(w02d303B02);
w02d303B03 = medfilt2(w02d303Bcom,[3,3]);
w02d303B04 = imcomplement(w02d303B03); % DAPI(B): pre1

%w02d303H_Hfos (R)
w02d303H01 = imtophat(w02d303H, SE50);
w02d303Hcom = imcomplement(w02d303H01);
w02d303H02 = medfilt2(w02d303Hcom, [3,3]);
w02d303H03 = imcomplement(w02d303H02);
w02d303H03_T105 = w02d303H03 > 90; % H1a_fosi % T change <------------
w02d303B04_T120 = w02d303B04 > 120; % DAPI(B): pre2a
w02d303Hfos1 = imfuse(w02d303H03_T105, w02d303B04_T120, 'blend');
w02d303Hfos2 = w02d303Hfos1 > 140; % H1a_fosi (R): final
w02d303HB1 = imfuse(w02d303Hfos2, w02d303B04,'Colorchannel',[1 0 2]);

%w02d303F_Ffos (G)
w02d303F01 = imtophat(w02d303F, SE50);
w02d303Fcom = imcomplement(w02d303F01);
w02d303F02 = medfilt2(w02d303Fcom, [3,3]);
w02d303F03 = imcomplement(w02d303F02);
w02d303F03_T105 = w02d303F03 > 85; % Fos_fosi % T change <------------
w02d303B04_T120 = w02d303B04 > 120; % DAPI(B): pre2a
w02d303Ffos1 = imfuse(w02d303F03_T105, w02d303B04_T120, 'blend');
w02d303Ffos2 = w02d303Ffos1 > 140; % Fos_fosi (G): final
w02d303HFB2 = imoverlay(w02d303HB1,w02d303Ffos2,"green");
imwrite(w02d303HFB2, 'w02d303HFB2.tif');



%% w02d304

%w02d304B (B)
SE50 = strel('square',50);
w02d304B01 = imtophat(w02d304B, SE50);
w02d304Baht = adapthisteq(w02d304B01);
%avg = ones(3,3)/9;
w02d304Bmed = medfilt2(w02d304Baht,[3,3]);
w02d304B02 = imtophat(w02d304Bmed,SE50);
w02d304Bcom = imcomplement(w02d304B02);
w02d304B03 = medfilt2(w02d304Bcom,[3,3]);
w02d304B04 = imcomplement(w02d304B03); % DAPI(B): pre1

%w02d304H_Hfos (R)
w02d304H01 = imtophat(w02d304H, SE50);
w02d304Hcom = imcomplement(w02d304H01);
w02d304H02 = medfilt2(w02d304Hcom, [3,3]);
w02d304H03 = imcomplement(w02d304H02);
w02d304H03_T105 = w02d304H03 > 90; % H1a_fosi % T change <------------
w02d304B04_T120 = w02d304B04 > 120; % DAPI(B): pre2a
w02d304Hfos1 = imfuse(w02d304H03_T105, w02d304B04_T120, 'blend');
w02d304Hfos2 = w02d304Hfos1 > 140; % H1a_fosi (R): final
w02d304HB1 = imfuse(w02d304Hfos2, w02d304B04,'Colorchannel',[1 0 2]);

%w02d304F_Ffos (G)
w02d304F01 = imtophat(w02d304F, SE50);
w02d304Fcom = imcomplement(w02d304F01);
w02d304F02 = medfilt2(w02d304Fcom, [3,3]);
w02d304F03 = imcomplement(w02d304F02);
w02d304F03_T105 = w02d304F03 > 85; % Fos_fosi % T change <------------
w02d304B04_T120 = w02d304B04 > 120; % DAPI(B): pre2a
w02d304Ffos1 = imfuse(w02d304F03_T105, w02d304B04_T120, 'blend');
w02d304Ffos2 = w02d304Ffos1 > 140; % Fos_fosi (G): final
w02d304HFB2 = imoverlay(w02d304HB1,w02d304Ffos2,"green");
imwrite(w02d304HFB2, 'w02d304HFB2.tif');


