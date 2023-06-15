%% H1a-Fos catFISH 

cre05d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d301H0.jpg');
cre05d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d301F0.jpg');
cre05d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d301B0a.jpg');
cre05d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d301B0b.jpg');
cre05d301B0 = imfuse(cre05d301B0a, cre05d301B0b, 'blend');
cre05d302aH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302aH0.jpg');
cre05d302aF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302aF0.jpg');
cre05d302aB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302aB0a.jpg');
cre05d302aB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302aB0b.jpg');
cre05d302aB0 = imfuse(cre05d302aB0a, cre05d302aB0b, 'blend');
cre05d302bH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302bH0.jpg');
cre05d302bF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302bF0.jpg');
cre05d302bB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302bB0a.jpg');
cre05d302bB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d302bB0b.jpg');
cre05d302bB0 = imfuse(cre05d302bB0a, cre05d302bB0b, 'blend');
cre05d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d303H0.jpg');
cre05d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d303F0.jpg');
cre05d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d303B0a.jpg');
cre05d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre05d303B0b.jpg');
cre05d303B0 = imfuse(cre05d303B0a, cre05d303B0b, 'blend');

cre05d301H = cre05d301H0(:,:,1);
cre05d301F = cre05d301F0(:,:,2);
cre05d301B = cre05d301B0(:,:,3);
cre05d302aH = cre05d302aH0(:,:,1);
cre05d302aF = cre05d302aF0(:,:,2);
cre05d302aB = cre05d302aB0(:,:,3);
cre05d302bH = cre05d302bH0(:,:,1);
cre05d302bF = cre05d302bF0(:,:,2);
cre05d302bB = cre05d302bB0(:,:,3);
cre05d303H = cre05d303H0(:,:,1);
cre05d303F = cre05d303F0(:,:,2);
cre05d303B = cre05d303B0(:,:,3);


%% cre05d301

%cre05d301B (B)
SE50 = strel('square',50);
cre05d301B01 = imtophat(cre05d301B, SE50);
cre05d301Baht = adapthisteq(cre05d301B01);
avg = ones(3,3)/9;
cre05d301Bmed = medfilt2(cre05d301Baht,[3,3]);
cre05d301B02 = imtophat(cre05d301Bmed,SE50);
cre05d301Bcom = imcomplement(cre05d301B02);
cre05d301B03 = medfilt2(cre05d301Bcom,[3,3]);
cre05d301B04 = imcomplement(cre05d301B03); % DAPI(B): pre1

%cre05d301H_Hfos (R)
cre05d301H01 = imtophat(cre05d301H, SE50);
cre05d301Hcom = imcomplement(cre05d301H01);
cre05d301H02 = medfilt2(cre05d301Hcom, [3,3]);
cre05d301H03 = imcomplement(cre05d301H02);
cre05d301H03_T105 = cre05d301H03 > 90; % H1a_fosi % T change <------------
cre05d301B04_T120 = cre05d301B04 > 120; % DAPI(B): pre2a
cre05d301Hfos1 = imfuse(cre05d301H03_T105, cre05d301B04_T120, 'blend');
cre05d301Hfos2 = cre05d301Hfos1 > 140; % H1a_fosi (R): final
cre05d301HB1 = imfuse(cre05d301Hfos2, cre05d301B04,'Colorchannel',[1 0 2]);

%cre05d301F_Ffos (G)
cre05d301F01 = imtophat(cre05d301F, SE50);
cre05d301Fcom = imcomplement(cre05d301F01);
cre05d301F02 = medfilt2(cre05d301Fcom, [3,3]);
cre05d301F03 = imcomplement(cre05d301F02);
cre05d301F03_T105 = cre05d301F03 > 85; % Fos_fosi % T change <------------
cre05d301B04_T120 = cre05d301B04 > 120; % DAPI(B): pre2a
cre05d301Ffos1 = imfuse(cre05d301F03_T105, cre05d301B04_T120, 'blend');
cre05d301Ffos2 = cre05d301Ffos1 > 140; % Fos_fosi (G): final
cre05d301HFB2 = imoverlay(cre05d301HB1,cre05d301Ffos2,"green");
imwrite(cre05d301HFB2, 'cre05d301HFB2.tif');



%% cre05d302a

%cre05d302aB (B)
SE50 = strel('square',50);
cre05d302aB01 = imtophat(cre05d302aB, SE50);
cre05d302aBaht = adapthisteq(cre05d302aB01);
%avg = ones(3,3)/9;
cre05d302aBmed = medfilt2(cre05d302aBaht,[3,3]);
cre05d302aB02 = imtophat(cre05d302aBmed,SE50);
cre05d302aBcom = imcomplement(cre05d302aB02);
cre05d302aB03 = medfilt2(cre05d302aBcom,[3,3]);
cre05d302aB04 = imcomplement(cre05d302aB03); % DAPI(B): pre1

%cre05d302aH_Hfos (R)
cre05d302aH01 = imtophat(cre05d302aH, SE50);
cre05d302aHcom = imcomplement(cre05d302aH01);
cre05d302aH02 = medfilt2(cre05d302aHcom, [3,3]);
cre05d302aH03 = imcomplement(cre05d302aH02);
cre05d302aH03_T105 = cre05d302aH03 > 90; % H1a_fosi % T change <------------
cre05d302aB04_T120 = cre05d302aB04 > 120; % DAPI(B): pre2a
cre05d302aHfos1 = imfuse(cre05d302aH03_T105, cre05d302aB04_T120, 'blend');
cre05d302aHfos2 = cre05d302aHfos1 > 140; % H1a_fosi (R): final
cre05d302aHB1 = imfuse(cre05d302aHfos2, cre05d302aB04,'Colorchannel',[1 0 2]);

%cre05d302aF_Ffos (G)
cre05d302aF01 = imtophat(cre05d302aF, SE50);
cre05d302aFcom = imcomplement(cre05d302aF01);
cre05d302aF02 = medfilt2(cre05d302aFcom, [3,3]);
cre05d302aF03 = imcomplement(cre05d302aF02);
cre05d302aF03_T105 = cre05d302aF03 > 85; % Fos_fosi % T change <------------
cre05d302aB04_T120 = cre05d302aB04 > 120; % DAPI(B): pre2a
cre05d302aFfos1 = imfuse(cre05d302aF03_T105, cre05d302aB04_T120, 'blend');
cre05d302aFfos2 = cre05d302aFfos1 > 140; % Fos_fosi (G): final
cre05d302aHFB2 = imoverlay(cre05d302aHB1,cre05d302aFfos2,"green");
imwrite(cre05d302aHFB2, 'cre05d302aHFB2.tif');



%% cre05d302b

%cre05d302bB (B)
SE50 = strel('square',50);
cre05d302bB01 = imtophat(cre05d302bB, SE50);
cre05d302bBaht = adapthisteq(cre05d302bB01);
%avg = ones(3,3)/9;
cre05d302bBmed = medfilt2(cre05d302bBaht,[3,3]);
cre05d302bB02 = imtophat(cre05d302bBmed,SE50);
cre05d302bBcom = imcomplement(cre05d302bB02);
cre05d302bB03 = medfilt2(cre05d302bBcom,[3,3]);
cre05d302bB04 = imcomplement(cre05d302bB03); % DAPI(B): pre1

%cre05d302bH_Hfos (R)
cre05d302bH01 = imtophat(cre05d302bH, SE50);
cre05d302bHcom = imcomplement(cre05d302bH01);
cre05d302bH02 = medfilt2(cre05d302bHcom, [3,3]);
cre05d302bH03 = imcomplement(cre05d302bH02);
cre05d302bH03_T105 = cre05d302bH03 > 90; % H1a_fosi % T change <------------
cre05d302bB04_T120 = cre05d302bB04 > 120; % DAPI(B): pre2a
cre05d302bHfos1 = imfuse(cre05d302bH03_T105, cre05d302bB04_T120, 'blend');
cre05d302bHfos2 = cre05d302bHfos1 > 140; % H1a_fosi (R): final
cre05d302bHB1 = imfuse(cre05d302bHfos2, cre05d302bB04,'Colorchannel',[1 0 2]);

%cre05d302bF_Ffos (G)
cre05d302bF01 = imtophat(cre05d302bF, SE50);
cre05d302bFcom = imcomplement(cre05d302bF01);
cre05d302bF02 = medfilt2(cre05d302bFcom, [3,3]);
cre05d302bF03 = imcomplement(cre05d302bF02);
cre05d302bF03_T105 = cre05d302bF03 > 85; % Fos_fosi % T change <------------
cre05d302bB04_T120 = cre05d302bB04 > 120; % DAPI(B): pre2a
cre05d302bFfos1 = imfuse(cre05d302bF03_T105, cre05d302bB04_T120, 'blend');
cre05d302bFfos2 = cre05d302bFfos1 > 140; % Fos_fosi (G): final
cre05d302bHFB2 = imoverlay(cre05d302bHB1,cre05d302bFfos2,"green");
imwrite(cre05d302bHFB2, 'cre05d302bHFB2.tif');





%% cre05d303

%cre05d303B (B)
SE50 = strel('square',50);
cre05d303B01 = imtophat(cre05d303B, SE50);
cre05d303Baht = adapthisteq(cre05d303B01);
%avg = ones(3,3)/9;
cre05d303Bmed = medfilt2(cre05d303Baht,[3,3]);
cre05d303B02 = imtophat(cre05d303Bmed,SE50);
cre05d303Bcom = imcomplement(cre05d303B02);
cre05d303B03 = medfilt2(cre05d303Bcom,[3,3]);
cre05d303B04 = imcomplement(cre05d303B03); % DAPI(B): pre1

%cre05d303H_Hfos (R)
cre05d303H01 = imtophat(cre05d303H, SE50);
cre05d303Hcom = imcomplement(cre05d303H01);
cre05d303H02 = medfilt2(cre05d303Hcom, [3,3]);
cre05d303H03 = imcomplement(cre05d303H02);
cre05d303H03_T105 = cre05d303H03 > 90; % H1a_fosi % T change <------------
cre05d303B04_T120 = cre05d303B04 > 120; % DAPI(B): pre2a
cre05d303Hfos1 = imfuse(cre05d303H03_T105, cre05d303B04_T120, 'blend');
cre05d303Hfos2 = cre05d303Hfos1 > 140; % H1a_fosi (R): final
cre05d303HB1 = imfuse(cre05d303Hfos2, cre05d303B04,'Colorchannel',[1 0 2]);

%cre05d303F_Ffos (G)
cre05d303F01 = imtophat(cre05d303F, SE50);
cre05d303Fcom = imcomplement(cre05d303F01);
cre05d303F02 = medfilt2(cre05d303Fcom, [3,3]);
cre05d303F03 = imcomplement(cre05d303F02);
cre05d303F03_T105 = cre05d303F03 > 85; % Fos_fosi % T change <------------
cre05d303B04_T120 = cre05d303B04 > 120; % DAPI(B): pre2a
cre05d303Ffos1 = imfuse(cre05d303F03_T105, cre05d303B04_T120, 'blend');
cre05d303Ffos2 = cre05d303Ffos1 > 140; % Fos_fosi (G): final
cre05d303HFB2 = imoverlay(cre05d303HB1,cre05d303Ffos2,"green");
imwrite(cre05d303HFB2, 'cre05d303HFB2.tif');



