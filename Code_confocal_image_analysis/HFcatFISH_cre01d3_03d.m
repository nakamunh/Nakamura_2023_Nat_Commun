%% H1a-Fos catFISH 

cre01d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d301H0.jpg');
cre01d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d301F0.jpg');
cre01d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d301B0a.jpg');
cre01d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d301B0b.jpg');
cre01d301B0 = imfuse(cre01d301B0a, cre01d301B0b, 'blend');
cre01d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d302H0.jpg');
cre01d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d302F0.jpg');
cre01d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d302B0a.jpg');
cre01d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d302B0b.jpg');
cre01d302B0 = imfuse(cre01d302B0a, cre01d302B0b, 'blend');
cre01d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d303H0.jpg');
cre01d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d303F0.jpg');
cre01d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d303B0a.jpg');
cre01d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre01d303B0b.jpg');
cre01d303B0 = imfuse(cre01d303B0a, cre01d303B0b, 'blend');

cre01d301H = cre01d301H0(:,:,1);
cre01d301F = cre01d301F0(:,:,2);
cre01d301B = cre01d301B0(:,:,3);
cre01d302H = cre01d302H0(:,:,1);
cre01d302F = cre01d302F0(:,:,2);
cre01d302B = cre01d302B0(:,:,3);
cre01d303H = cre01d303H0(:,:,1);
cre01d303F = cre01d303F0(:,:,2);
cre01d303B = cre01d303B0(:,:,3);


%% cre01d301

%cre01d301B (B)
SE50 = strel('square',50);
cre01d301B01 = imtophat(cre01d301B, SE50);
cre01d301Baht = adapthisteq(cre01d301B01);
avg = ones(3,3)/9;
cre01d301Bmed = medfilt2(cre01d301Baht,[3,3]);
cre01d301B02 = imtophat(cre01d301Bmed,SE50);
cre01d301Bcom = imcomplement(cre01d301B02);
cre01d301B03 = medfilt2(cre01d301Bcom,[3,3]);
cre01d301B04 = imcomplement(cre01d301B03); % DAPI(B): pre1

%cre01d301H_Hfos (R)
cre01d301H01 = imtophat(cre01d301H, SE50);
cre01d301Hcom = imcomplement(cre01d301H01);
cre01d301H02 = medfilt2(cre01d301Hcom, [3,3]);
cre01d301H03 = imcomplement(cre01d301H02);
cre01d301H03_T105 = cre01d301H03 > 90; % H1a_fosi % T change <------------
cre01d301B04_T120 = cre01d301B04 > 120; % DAPI(B): pre2a
cre01d301Hfos1 = imfuse(cre01d301H03_T105, cre01d301B04_T120, 'blend');
cre01d301Hfos2 = cre01d301Hfos1 > 140; % H1a_fosi (R): final
cre01d301HB1 = imfuse(cre01d301Hfos2, cre01d301B04,'Colorchannel',[1 0 2]);

%cre01d301F_Ffos (G)
cre01d301F01 = imtophat(cre01d301F, SE50);
cre01d301Fcom = imcomplement(cre01d301F01);
cre01d301F02 = medfilt2(cre01d301Fcom, [3,3]);
cre01d301F03 = imcomplement(cre01d301F02);
cre01d301F03_T105 = cre01d301F03 > 85; % Fos_fosi % T change <------------
cre01d301B04_T120 = cre01d301B04 > 120; % DAPI(B): pre2a
cre01d301Ffos1 = imfuse(cre01d301F03_T105, cre01d301B04_T120, 'blend');
cre01d301Ffos2 = cre01d301Ffos1 > 140; % Fos_fosi (G): final
cre01d301HFB2 = imoverlay(cre01d301HB1,cre01d301Ffos2,"green");
imwrite(cre01d301HFB2, 'cre01d301HFB2.tif');



%% cre01d302

%cre01d302B (B)
SE50 = strel('square',50);
cre01d302B01 = imtophat(cre01d302B, SE50);
cre01d302Baht = adapthisteq(cre01d302B01);
%avg = ones(3,3)/9;
cre01d302Bmed = medfilt2(cre01d302Baht,[3,3]);
cre01d302B02 = imtophat(cre01d302Bmed,SE50);
cre01d302Bcom = imcomplement(cre01d302B02);
cre01d302B03 = medfilt2(cre01d302Bcom,[3,3]);
cre01d302B04 = imcomplement(cre01d302B03); % DAPI(B): pre1

%cre01d302H_Hfos (R)
cre01d302H01 = imtophat(cre01d302H, SE50);
cre01d302Hcom = imcomplement(cre01d302H01);
cre01d302H02 = medfilt2(cre01d302Hcom, [3,3]);
cre01d302H03 = imcomplement(cre01d302H02);
cre01d302H03_T105 = cre01d302H03 > 90; % H1a_fosi % T change <------------
cre01d302B04_T120 = cre01d302B04 > 120; % DAPI(B): pre2a
cre01d302Hfos1 = imfuse(cre01d302H03_T105, cre01d302B04_T120, 'blend');
cre01d302Hfos2 = cre01d302Hfos1 > 140; % H1a_fosi (R): final
cre01d302HB1 = imfuse(cre01d302Hfos2, cre01d302B04,'Colorchannel',[1 0 2]);

%cre01d302F_Ffos (G)
cre01d302F01 = imtophat(cre01d302F, SE50);
cre01d302Fcom = imcomplement(cre01d302F01);
cre01d302F02 = medfilt2(cre01d302Fcom, [3,3]);
cre01d302F03 = imcomplement(cre01d302F02);
cre01d302F03_T105 = cre01d302F03 > 85; % Fos_fosi % T change <------------
cre01d302B04_T120 = cre01d302B04 > 120; % DAPI(B): pre2a
cre01d302Ffos1 = imfuse(cre01d302F03_T105, cre01d302B04_T120, 'blend');
cre01d302Ffos2 = cre01d302Ffos1 > 140; % Fos_fosi (G): final
cre01d302HFB2 = imoverlay(cre01d302HB1,cre01d302Ffos2,"green");
imwrite(cre01d302HFB2, 'cre01d302HFB2.tif');



%% cre01d303

%cre01d303B (B)
SE50 = strel('square',50);
cre01d303B01 = imtophat(cre01d303B, SE50);
cre01d303Baht = adapthisteq(cre01d303B01);
%avg = ones(3,3)/9;
cre01d303Bmed = medfilt2(cre01d303Baht,[3,3]);
cre01d303B02 = imtophat(cre01d303Bmed,SE50);
cre01d303Bcom = imcomplement(cre01d303B02);
cre01d303B03 = medfilt2(cre01d303Bcom,[3,3]);
cre01d303B04 = imcomplement(cre01d303B03); % DAPI(B): pre1

%cre01d303H_Hfos (R)
cre01d303H01 = imtophat(cre01d303H, SE50);
cre01d303Hcom = imcomplement(cre01d303H01);
cre01d303H02 = medfilt2(cre01d303Hcom, [3,3]);
cre01d303H03 = imcomplement(cre01d303H02);
cre01d303H03_T105 = cre01d303H03 > 90; % H1a_fosi % T change <------------
cre01d303B04_T120 = cre01d303B04 > 120; % DAPI(B): pre2a
cre01d303Hfos1 = imfuse(cre01d303H03_T105, cre01d303B04_T120, 'blend');
cre01d303Hfos2 = cre01d303Hfos1 > 140; % H1a_fosi (R): final
cre01d303HB1 = imfuse(cre01d303Hfos2, cre01d303B04,'Colorchannel',[1 0 2]);

%cre01d303F_Ffos (G)
cre01d303F01 = imtophat(cre01d303F, SE50);
cre01d303Fcom = imcomplement(cre01d303F01);
cre01d303F02 = medfilt2(cre01d303Fcom, [3,3]);
cre01d303F03 = imcomplement(cre01d303F02);
cre01d303F03_T105 = cre01d303F03 > 85; % Fos_fosi % T change <------------
cre01d303B04_T120 = cre01d303B04 > 120; % DAPI(B): pre2a
cre01d303Ffos1 = imfuse(cre01d303F03_T105, cre01d303B04_T120, 'blend');
cre01d303Ffos2 = cre01d303Ffos1 > 140; % Fos_fosi (G): final
cre01d303HFB2 = imoverlay(cre01d303HB1,cre01d303Ffos2,"green");
imwrite(cre01d303HFB2, 'cre01d303HFB2.tif');



