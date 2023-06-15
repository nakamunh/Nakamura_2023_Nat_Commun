%% H1a-Fos catFISH 

cre02d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d301H0.jpg');
cre02d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d301F0.jpg');
cre02d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d301B0a.jpg');
cre02d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d301B0b.jpg');
cre02d301B0 = imfuse(cre02d301B0a, cre02d301B0b, 'blend');
cre02d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d302H0.jpg');
cre02d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d302F0.jpg');
cre02d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d302B0a.jpg');
cre02d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d302B0b.jpg');
cre02d302B0 = imfuse(cre02d302B0a, cre02d302B0b, 'blend');
cre02d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d303H0.jpg');
cre02d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d303F0.jpg');
cre02d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d303B0a.jpg');
cre02d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre02d303B0b.jpg');
cre02d303B0 = imfuse(cre02d303B0a, cre02d303B0b, 'blend');

cre02d301H = cre02d301H0(:,:,1);
cre02d301F = cre02d301F0(:,:,2);
cre02d301B = cre02d301B0(:,:,3);
cre02d302H = cre02d302H0(:,:,1);
cre02d302F = cre02d302F0(:,:,2);
cre02d302B = cre02d302B0(:,:,3);
cre02d303H = cre02d303H0(:,:,1);
cre02d303F = cre02d303F0(:,:,2);
cre02d303B = cre02d303B0(:,:,3);


%% cre02d301

%cre02d301B (B)
SE50 = strel('square',50);
cre02d301B01 = imtophat(cre02d301B, SE50);
cre02d301Baht = adapthisteq(cre02d301B01);
avg = ones(3,3)/9;
cre02d301Bmed = medfilt2(cre02d301Baht,[3,3]);
cre02d301B02 = imtophat(cre02d301Bmed,SE50);
cre02d301Bcom = imcomplement(cre02d301B02);
cre02d301B03 = medfilt2(cre02d301Bcom,[3,3]);
cre02d301B04 = imcomplement(cre02d301B03); % DAPI(B): pre1

%cre02d301H_Hfos (R)
cre02d301H01 = imtophat(cre02d301H, SE50);
cre02d301Hcom = imcomplement(cre02d301H01);
cre02d301H02 = medfilt2(cre02d301Hcom, [3,3]);
cre02d301H03 = imcomplement(cre02d301H02);
cre02d301H03_T105 = cre02d301H03 > 90; % H1a_fosi % T change <------------
cre02d301B04_T120 = cre02d301B04 > 120; % DAPI(B): pre2a
cre02d301Hfos1 = imfuse(cre02d301H03_T105, cre02d301B04_T120, 'blend');
cre02d301Hfos2 = cre02d301Hfos1 > 140; % H1a_fosi (R): final
cre02d301HB1 = imfuse(cre02d301Hfos2, cre02d301B04,'Colorchannel',[1 0 2]);

%cre02d301F_Ffos (G)
cre02d301F01 = imtophat(cre02d301F, SE50);
cre02d301Fcom = imcomplement(cre02d301F01);
cre02d301F02 = medfilt2(cre02d301Fcom, [3,3]);
cre02d301F03 = imcomplement(cre02d301F02);
cre02d301F03_T105 = cre02d301F03 > 85; % Fos_fosi % T change <------------
cre02d301B04_T120 = cre02d301B04 > 120; % DAPI(B): pre2a
cre02d301Ffos1 = imfuse(cre02d301F03_T105, cre02d301B04_T120, 'blend');
cre02d301Ffos2 = cre02d301Ffos1 > 140; % Fos_fosi (G): final
cre02d301HFB2 = imoverlay(cre02d301HB1,cre02d301Ffos2,"green");
imwrite(cre02d301HFB2, 'cre02d301HFB2.tif');



%% cre02d302

%cre02d302B (B)
SE50 = strel('square',50);
cre02d302B01 = imtophat(cre02d302B, SE50);
cre02d302Baht = adapthisteq(cre02d302B01);
%avg = ones(3,3)/9;
cre02d302Bmed = medfilt2(cre02d302Baht,[3,3]);
cre02d302B02 = imtophat(cre02d302Bmed,SE50);
cre02d302Bcom = imcomplement(cre02d302B02);
cre02d302B03 = medfilt2(cre02d302Bcom,[3,3]);
cre02d302B04 = imcomplement(cre02d302B03); % DAPI(B): pre1

%cre02d302H_Hfos (R)
cre02d302H01 = imtophat(cre02d302H, SE50);
cre02d302Hcom = imcomplement(cre02d302H01);
cre02d302H02 = medfilt2(cre02d302Hcom, [3,3]);
cre02d302H03 = imcomplement(cre02d302H02);
cre02d302H03_T105 = cre02d302H03 > 90; % H1a_fosi % T change <------------
cre02d302B04_T120 = cre02d302B04 > 120; % DAPI(B): pre2a
cre02d302Hfos1 = imfuse(cre02d302H03_T105, cre02d302B04_T120, 'blend');
cre02d302Hfos2 = cre02d302Hfos1 > 140; % H1a_fosi (R): final
cre02d302HB1 = imfuse(cre02d302Hfos2, cre02d302B04,'Colorchannel',[1 0 2]);

%cre02d302F_Ffos (G)
cre02d302F01 = imtophat(cre02d302F, SE50);
cre02d302Fcom = imcomplement(cre02d302F01);
cre02d302F02 = medfilt2(cre02d302Fcom, [3,3]);
cre02d302F03 = imcomplement(cre02d302F02);
cre02d302F03_T105 = cre02d302F03 > 85; % Fos_fosi % T change <------------
cre02d302B04_T120 = cre02d302B04 > 120; % DAPI(B): pre2a
cre02d302Ffos1 = imfuse(cre02d302F03_T105, cre02d302B04_T120, 'blend');
cre02d302Ffos2 = cre02d302Ffos1 > 140; % Fos_fosi (G): final
cre02d302HFB2 = imoverlay(cre02d302HB1,cre02d302Ffos2,"green");
imwrite(cre02d302HFB2, 'cre02d302HFB2.tif');



%% cre02d303

%cre02d303B (B)% T105
SE50 = strel('square',50);
cre02d303B01 = imtophat(cre02d303B, SE50);
cre02d303Baht = adapthisteq(cre02d303B01);
%avg = ones(3,3)/9;
cre02d303Bmed = medfilt2(cre02d303Baht,[3,3]);
cre02d303B02 = imtophat(cre02d303Bmed,SE50);
cre02d303Bcom = imcomplement(cre02d303B02);
cre02d303B03 = medfilt2(cre02d303Bcom,[3,3]);
cre02d303B04 = imcomplement(cre02d303B03); % DAPI(B): pre1

%cre02d303H_Hfos (R)
cre02d303H01 = imtophat(cre02d303H, SE50);
cre02d303Hcom = imcomplement(cre02d303H01);
cre02d303H02 = medfilt2(cre02d303Hcom, [3,3]);
cre02d303H03 = imcomplement(cre02d303H02);
cre02d303H03_T105 = cre02d303H03 > 90; % H1a_fosi % T change <------------
cre02d303B04_T120 = cre02d303B04 > 120; % DAPI(B): pre2a
cre02d303Hfos1 = imfuse(cre02d303H03_T105, cre02d303B04_T120, 'blend');
cre02d303Hfos2 = cre02d303Hfos1 > 140; % H1a_fosi (R): final
cre02d303HB1 = imfuse(cre02d303Hfos2, cre02d303B04,'Colorchannel',[1 0 2]);

%cre02d303F_Ffos (G)
cre02d303F01 = imtophat(cre02d303F, SE50);
cre02d303Fcom = imcomplement(cre02d303F01);
cre02d303F02 = medfilt2(cre02d303Fcom, [3,3]);
cre02d303F03 = imcomplement(cre02d303F02);
cre02d303F03_T105 = cre02d303F03 > 85; % Fos_fosi % T change <------------
cre02d303B04_T120 = cre02d303B04 > 120; % DAPI(B): pre2a
cre02d303Ffos1 = imfuse(cre02d303F03_T105, cre02d303B04_T120, 'blend');
cre02d303Ffos2 = cre02d303Ffos1 > 140; % Fos_fosi (G): final
cre02d303HFB2 = imoverlay(cre02d303HB1,cre02d303Ffos2,"green");
imwrite(cre02d303HFB2, 'cre02d303HFB2.tif');



