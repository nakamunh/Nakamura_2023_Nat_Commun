%% H1a-Fos catFISH 

cre03d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d301H0.jpg');
cre03d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d301F0.jpg');
cre03d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d301B0a.jpg');
cre03d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d301B0b.jpg');
cre03d301B0 = imfuse(cre03d301B0a, cre03d301B0b, 'blend');
cre03d302aH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302aH0.jpg');
cre03d302aF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302aF0.jpg');
cre03d302aB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302aB0a.jpg');
cre03d302aB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302aB0b.jpg');
cre03d302aB0 = imfuse(cre03d302aB0a, cre03d302aB0b, 'blend');
cre03d302bH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302bH0.jpg');
cre03d302bF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302bF0.jpg');
cre03d302bB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302bB0a.jpg');
cre03d302bB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d302bB0b.jpg');
cre03d302bB0 = imfuse(cre03d302bB0a, cre03d302bB0b, 'blend');
cre03d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d303H0.jpg');
cre03d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d303F0.jpg');
cre03d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d303B0a.jpg');
cre03d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre03d303B0b.jpg');
cre03d303B0 = imfuse(cre03d303B0a, cre03d303B0b, 'blend');

cre03d301H = cre03d301H0(:,:,1);
cre03d301F = cre03d301F0(:,:,2);
cre03d301B = cre03d301B0(:,:,3);
cre03d302aH = cre03d302aH0(:,:,1);
cre03d302aF = cre03d302aF0(:,:,2);
cre03d302aB = cre03d302aB0(:,:,3);
cre03d302bH = cre03d302bH0(:,:,1);
cre03d302bF = cre03d302bF0(:,:,2);
cre03d302bB = cre03d302bB0(:,:,3);
cre03d303H = cre03d303H0(:,:,1);
cre03d303F = cre03d303F0(:,:,2);
cre03d303B = cre03d303B0(:,:,3);


%% cre03d301

%cre03d301B (B)
SE50 = strel('square',50);
cre03d301B01 = imtophat(cre03d301B, SE50);
cre03d301Baht = adapthisteq(cre03d301B01);
avg = ones(3,3)/9;
cre03d301Bmed = medfilt2(cre03d301Baht,[3,3]);
cre03d301B02 = imtophat(cre03d301Bmed,SE50);
cre03d301Bcom = imcomplement(cre03d301B02);
cre03d301B03 = medfilt2(cre03d301Bcom,[3,3]);
cre03d301B04 = imcomplement(cre03d301B03); % DAPI(B): pre1

%cre03d301H_Hfos (R)
cre03d301H01 = imtophat(cre03d301H, SE50);
cre03d301Hcom = imcomplement(cre03d301H01);
cre03d301H02 = medfilt2(cre03d301Hcom, [3,3]);
cre03d301H03 = imcomplement(cre03d301H02);
cre03d301H03_T105 = cre03d301H03 > 90; % H1a_fosi % T change <------------
cre03d301B04_T120 = cre03d301B04 > 120; % DAPI(B): pre2a
cre03d301Hfos1 = imfuse(cre03d301H03_T105, cre03d301B04_T120, 'blend');
cre03d301Hfos2 = cre03d301Hfos1 > 140; % H1a_fosi (R): final
cre03d301HB1 = imfuse(cre03d301Hfos2, cre03d301B04,'Colorchannel',[1 0 2]);

%cre03d301F_Ffos (G)
cre03d301F01 = imtophat(cre03d301F, SE50);
cre03d301Fcom = imcomplement(cre03d301F01);
cre03d301F02 = medfilt2(cre03d301Fcom, [3,3]);
cre03d301F03 = imcomplement(cre03d301F02);
cre03d301F03_T105 = cre03d301F03 > 85; % Fos_fosi % T change <------------
cre03d301B04_T120 = cre03d301B04 > 120; % DAPI(B): pre2a
cre03d301Ffos1 = imfuse(cre03d301F03_T105, cre03d301B04_T120, 'blend');
cre03d301Ffos2 = cre03d301Ffos1 > 140; % Fos_fosi (G): final
cre03d301HFB2 = imoverlay(cre03d301HB1,cre03d301Ffos2,"green");
imwrite(cre03d301HFB2, 'cre03d301HFB2.tif');



%% cre03d302a

%cre03d302aB (B)
SE50 = strel('square',50);
cre03d302aB01 = imtophat(cre03d302aB, SE50);
cre03d302aBaht = adapthisteq(cre03d302aB01);
%avg = ones(3,3)/9;
cre03d302aBmed = medfilt2(cre03d302aBaht,[3,3]);
cre03d302aB02 = imtophat(cre03d302aBmed,SE50);
cre03d302aBcom = imcomplement(cre03d302aB02);
cre03d302aB03 = medfilt2(cre03d302aBcom,[3,3]);
cre03d302aB04 = imcomplement(cre03d302aB03); % DAPI(B): pre1

%cre03d302aH_Hfos (R)
cre03d302aH01 = imtophat(cre03d302aH, SE50);
cre03d302aHcom = imcomplement(cre03d302aH01);
cre03d302aH02 = medfilt2(cre03d302aHcom, [3,3]);
cre03d302aH03 = imcomplement(cre03d302aH02);
cre03d302aH03_T105 = cre03d302aH03 > 90; % H1a_fosi % T change <------------
cre03d302aB04_T120 = cre03d302aB04 > 120; % DAPI(B): pre2a
cre03d302aHfos1 = imfuse(cre03d302aH03_T105, cre03d302aB04_T120, 'blend');
cre03d302aHfos2 = cre03d302aHfos1 > 140; % H1a_fosi (R): final
cre03d302aHB1 = imfuse(cre03d302aHfos2, cre03d302aB04,'Colorchannel',[1 0 2]);

%cre03d302aF_Ffos (G)
cre03d302aF01 = imtophat(cre03d302aF, SE50);
cre03d302aFcom = imcomplement(cre03d302aF01);
cre03d302aF02 = medfilt2(cre03d302aFcom, [3,3]);
cre03d302aF03 = imcomplement(cre03d302aF02);
cre03d302aF03_T105 = cre03d302aF03 > 85; % Fos_fosi % T change <------------
cre03d302aB04_T120 = cre03d302aB04 > 120; % DAPI(B): pre2a
cre03d302aFfos1 = imfuse(cre03d302aF03_T105, cre03d302aB04_T120, 'blend');
cre03d302aFfos2 = cre03d302aFfos1 > 140; % Fos_fosi (G): final
cre03d302aHFB2 = imoverlay(cre03d302aHB1,cre03d302aFfos2,"green");
imwrite(cre03d302aHFB2, 'cre03d302aHFB2.tif');



%% cre03d302b

%cre03d302bB (B)
SE50 = strel('square',50);
cre03d302bB01 = imtophat(cre03d302bB, SE50);
cre03d302bBaht = adapthisteq(cre03d302bB01);
%avg = ones(3,3)/9;
cre03d302bBmed = medfilt2(cre03d302bBaht,[3,3]);
cre03d302bB02 = imtophat(cre03d302bBmed,SE50);
cre03d302bBcom = imcomplement(cre03d302bB02);
cre03d302bB03 = medfilt2(cre03d302bBcom,[3,3]);
cre03d302bB04 = imcomplement(cre03d302bB03); % DAPI(B): pre1

%cre03d302bH_Hfos (R)
cre03d302bH01 = imtophat(cre03d302bH, SE50);
cre03d302bHcom = imcomplement(cre03d302bH01);
cre03d302bH02 = medfilt2(cre03d302bHcom, [3,3]);
cre03d302bH03 = imcomplement(cre03d302bH02);
cre03d302bH03_T105 = cre03d302bH03 > 90; % H1a_fosi % T change <------------
cre03d302bB04_T120 = cre03d302bB04 > 120; % DAPI(B): pre2a
cre03d302bHfos1 = imfuse(cre03d302bH03_T105, cre03d302bB04_T120, 'blend');
cre03d302bHfos2 = cre03d302bHfos1 > 140; % H1a_fosi (R): final
cre03d302bHB1 = imfuse(cre03d302bHfos2, cre03d302bB04,'Colorchannel',[1 0 2]);

%cre03d302bF_Ffos (G)
cre03d302bF01 = imtophat(cre03d302bF, SE50);
cre03d302bFcom = imcomplement(cre03d302bF01);
cre03d302bF02 = medfilt2(cre03d302bFcom, [3,3]);
cre03d302bF03 = imcomplement(cre03d302bF02);
cre03d302bF03_T105 = cre03d302bF03 > 85; % Fos_fosi % T change <------------
cre03d302bB04_T120 = cre03d302bB04 > 120; % DAPI(B): pre2a
cre03d302bFfos1 = imfuse(cre03d302bF03_T105, cre03d302bB04_T120, 'blend');
cre03d302bFfos2 = cre03d302bFfos1 > 140; % Fos_fosi (G): final
cre03d302bHFB2 = imoverlay(cre03d302bHB1,cre03d302bFfos2,"green");
imwrite(cre03d302bHFB2, 'cre03d302bHFB2.tif');





%% cre03d303

%cre03d303B (B)
SE50 = strel('square',50);
cre03d303B01 = imtophat(cre03d303B, SE50);
cre03d303Baht = adapthisteq(cre03d303B01);
%avg = ones(3,3)/9;
cre03d303Bmed = medfilt2(cre03d303Baht,[3,3]);
cre03d303B02 = imtophat(cre03d303Bmed,SE50);
cre03d303Bcom = imcomplement(cre03d303B02);
cre03d303B03 = medfilt2(cre03d303Bcom,[3,3]);
cre03d303B04 = imcomplement(cre03d303B03); % DAPI(B): pre1

%cre03d303H_Hfos (R)
cre03d303H01 = imtophat(cre03d303H, SE50);
cre03d303Hcom = imcomplement(cre03d303H01);
cre03d303H02 = medfilt2(cre03d303Hcom, [3,3]);
cre03d303H03 = imcomplement(cre03d303H02);
cre03d303H03_T105 = cre03d303H03 > 90; % H1a_fosi % T change <------------
cre03d303B04_T120 = cre03d303B04 > 120; % DAPI(B): pre2a
cre03d303Hfos1 = imfuse(cre03d303H03_T105, cre03d303B04_T120, 'blend');
cre03d303Hfos2 = cre03d303Hfos1 > 140; % H1a_fosi (R): final
cre03d303HB1 = imfuse(cre03d303Hfos2, cre03d303B04,'Colorchannel',[1 0 2]);

%cre03d303F_Ffos (G)
cre03d303F01 = imtophat(cre03d303F, SE50);
cre03d303Fcom = imcomplement(cre03d303F01);
cre03d303F02 = medfilt2(cre03d303Fcom, [3,3]);
cre03d303F03 = imcomplement(cre03d303F02);
cre03d303F03_T105 = cre03d303F03 > 85; % Fos_fosi % T change <------------
cre03d303B04_T120 = cre03d303B04 > 120; % DAPI(B): pre2a
cre03d303Ffos1 = imfuse(cre03d303F03_T105, cre03d303B04_T120, 'blend');
cre03d303Ffos2 = cre03d303Ffos1 > 140; % Fos_fosi (G): final
cre03d303HFB2 = imoverlay(cre03d303HB1,cre03d303Ffos2,"green");
imwrite(cre03d303HFB2, 'cre03d303HFB2.tif');



