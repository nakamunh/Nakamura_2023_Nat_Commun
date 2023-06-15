%% H1a-Fos catFISH 

cre06d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301H0.jpg');
cre06d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301F0.jpg');
cre06d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301B0a.jpg');
cre06d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301B0b.jpg');
cre06d301B0 = imfuse(cre06d301B0a, cre06d301B0b, 'blend');
cre06d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302H0.jpg');
cre06d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302F0.jpg');
cre06d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302B0a.jpg');
cre06d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302B0b.jpg');
cre06d302B0 = imfuse(cre06d302B0a, cre06d302B0b, 'blend');
cre06d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d303H0.jpg');
cre06d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d303F0.jpg');
cre06d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d303B0a.jpg');
cre06d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d303B0b.jpg');
cre06d303B0 = imfuse(cre06d303B0a, cre06d303B0b, 'blend');

cre06d301H = cre06d301H0(:,:,1);
cre06d301F = cre06d301F0(:,:,2);
cre06d301B = cre06d301B0(:,:,3);
cre06d302H = cre06d302H0(:,:,1);
cre06d302F = cre06d302F0(:,:,2);
cre06d302B = cre06d302B0(:,:,3);
cre06d303H = cre06d303H0(:,:,1);
cre06d303F = cre06d303F0(:,:,2);
cre06d303B = cre06d303B0(:,:,3);


%% cre06d301

%cre06d301B (B)
SE50 = strel('square',50);
cre06d301B01 = imtophat(cre06d301B, SE50);
cre06d301Baht = adapthisteq(cre06d301B01);
avg = ones(3,3)/9;
cre06d301Bmed = medfilt2(cre06d301Baht,[3,3]);
cre06d301B02 = imtophat(cre06d301Bmed,SE50);
cre06d301Bcom = imcomplement(cre06d301B02);
cre06d301B03 = medfilt2(cre06d301Bcom,[3,3]);
cre06d301B04 = imcomplement(cre06d301B03); % DAPI(B): pre1

%cre06d301H_Hfos (R)
cre06d301H01 = imtophat(cre06d301H, SE50);
cre06d301Hcom = imcomplement(cre06d301H01);
cre06d301H02 = medfilt2(cre06d301Hcom, [3,3]);
cre06d301H03 = imcomplement(cre06d301H02);
cre06d301H03_T105 = cre06d301H03 > 90; % H1a_fosi % T change <------------
cre06d301B04_T120 = cre06d301B04 > 120; % DAPI(B): pre2a
cre06d301Hfos1 = imfuse(cre06d301H03_T105, cre06d301B04_T120, 'blend');
cre06d301Hfos2 = cre06d301Hfos1 > 140; % H1a_fosi (R): final
cre06d301HB1 = imfuse(cre06d301Hfos2, cre06d301B04,'Colorchannel',[1 0 2]);

%cre06d301F_Ffos (G)
cre06d301F01 = imtophat(cre06d301F, SE50);
cre06d301Fcom = imcomplement(cre06d301F01);
cre06d301F02 = medfilt2(cre06d301Fcom, [3,3]);
cre06d301F03 = imcomplement(cre06d301F02);
cre06d301F03_T105 = cre06d301F03 > 85; % Fos_fosi % T change <------------
cre06d301B04_T120 = cre06d301B04 > 120; % DAPI(B): pre2a
cre06d301Ffos1 = imfuse(cre06d301F03_T105, cre06d301B04_T120, 'blend');
cre06d301Ffos2 = cre06d301Ffos1 > 140; % Fos_fosi (G): final
cre06d301HFB2 = imoverlay(cre06d301HB1,cre06d301Ffos2,"green");
imwrite(cre06d301HFB2, 'cre06d301HFB2.tif');



%% cre06d302

%cre06d302B (B)
SE50 = strel('square',50);
cre06d302B01 = imtophat(cre06d302B, SE50);
cre06d302Baht = adapthisteq(cre06d302B01);
%avg = ones(3,3)/9;
cre06d302Bmed = medfilt2(cre06d302Baht,[3,3]);
cre06d302B02 = imtophat(cre06d302Bmed,SE50);
cre06d302Bcom = imcomplement(cre06d302B02);
cre06d302B03 = medfilt2(cre06d302Bcom,[3,3]);
cre06d302B04 = imcomplement(cre06d302B03); % DAPI(B): pre1

%cre06d302H_Hfos (R)
cre06d302H01 = imtophat(cre06d302H, SE50);
cre06d302Hcom = imcomplement(cre06d302H01);
cre06d302H02 = medfilt2(cre06d302Hcom, [3,3]);
cre06d302H03 = imcomplement(cre06d302H02);
cre06d302H03_T105 = cre06d302H03 > 90; % H1a_fosi % T change <------------
cre06d302B04_T120 = cre06d302B04 > 120; % DAPI(B): pre2a
cre06d302Hfos1 = imfuse(cre06d302H03_T105, cre06d302B04_T120, 'blend');
cre06d302Hfos2 = cre06d302Hfos1 > 140; % H1a_fosi (R): final
cre06d302HB1 = imfuse(cre06d302Hfos2, cre06d302B04,'Colorchannel',[1 0 2]);

%cre06d302F_Ffos (G)
cre06d302F01 = imtophat(cre06d302F, SE50);
cre06d302Fcom = imcomplement(cre06d302F01);
cre06d302F02 = medfilt2(cre06d302Fcom, [3,3]);
cre06d302F03 = imcomplement(cre06d302F02);
cre06d302F03_T105 = cre06d302F03 > 85; % Fos_fosi % T change <------------
cre06d302B04_T120 = cre06d302B04 > 120; % DAPI(B): pre2a
cre06d302Ffos1 = imfuse(cre06d302F03_T105, cre06d302B04_T120, 'blend');
cre06d302Ffos2 = cre06d302Ffos1 > 140; % Fos_fosi (G): final
cre06d302HFB2 = imoverlay(cre06d302HB1,cre06d302Ffos2,"green");
imwrite(cre06d302HFB2, 'cre06d302HFB2.tif');



%% cre06d303

%cre06d303B (B)
SE50 = strel('square',50);
cre06d303B01 = imtophat(cre06d303B, SE50);
cre06d303Baht = adapthisteq(cre06d303B01);
%avg = ones(3,3)/9;
cre06d303Bmed = medfilt2(cre06d303Baht,[3,3]);
cre06d303B02 = imtophat(cre06d303Bmed,SE50);
cre06d303Bcom = imcomplement(cre06d303B02);
cre06d303B03 = medfilt2(cre06d303Bcom,[3,3]);
cre06d303B04 = imcomplement(cre06d303B03); % DAPI(B): pre1

%cre06d303H_Hfos (R)
cre06d303H01 = imtophat(cre06d303H, SE50);
cre06d303Hcom = imcomplement(cre06d303H01);
cre06d303H02 = medfilt2(cre06d303Hcom, [3,3]);
cre06d303H03 = imcomplement(cre06d303H02);
cre06d303H03_T105 = cre06d303H03 > 90; % H1a_fosi % T change <------------
cre06d303B04_T120 = cre06d303B04 > 120; % DAPI(B): pre2a
cre06d303Hfos1 = imfuse(cre06d303H03_T105, cre06d303B04_T120, 'blend');
cre06d303Hfos2 = cre06d303Hfos1 > 140; % H1a_fosi (R): final
cre06d303HB1 = imfuse(cre06d303Hfos2, cre06d303B04,'Colorchannel',[1 0 2]);

%cre06d303F_Ffos (G)
cre06d303F01 = imtophat(cre06d303F, SE50);
cre06d303Fcom = imcomplement(cre06d303F01);
cre06d303F02 = medfilt2(cre06d303Fcom, [3,3]);
cre06d303F03 = imcomplement(cre06d303F02);
cre06d303F03_T105 = cre06d303F03 > 85; % Fos_fosi % T change <------------
cre06d303B04_T120 = cre06d303B04 > 120; % DAPI(B): pre2a
cre06d303Ffos1 = imfuse(cre06d303F03_T105, cre06d303B04_T120, 'blend');
cre06d303Ffos2 = cre06d303Ffos1 > 140; % Fos_fosi (G): final
cre06d303HFB2 = imoverlay(cre06d303HB1,cre06d303Ffos2,"green");
imwrite(cre06d303HFB2, 'cre06d303HFB2.tif');



