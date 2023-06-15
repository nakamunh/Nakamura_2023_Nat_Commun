%% H1a-Fos catFISH 

con04d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d301H0.jpg');
con04d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d301F0.jpg');
con04d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d301B0a.jpg');
con04d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d301B0b.jpg');
con04d301B0 = imfuse(con04d301B0a, con04d301B0b, 'blend');
con04d302aH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302aH0.jpg');
con04d302aF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302aF0.jpg');
con04d302aB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302aB0a.jpg');
con04d302aB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302aB0b.jpg');
con04d302aB0 = imfuse(con04d302aB0a, con04d302aB0b, 'blend');
con04d302bH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302bH0.jpg');
con04d302bF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302bF0.jpg');
con04d302bB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302bB0a.jpg');
con04d302bB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d302bB0b.jpg');
con04d302bB0 = imfuse(con04d302bB0a, con04d302bB0b, 'blend');
con04d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d303H0.jpg');
con04d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d303F0.jpg');
con04d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d303B0a.jpg');
con04d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con04d303B0b.jpg');
con04d303B0 = imfuse(con04d303B0a, con04d303B0b, 'blend');

con04d301H = con04d301H0(:,:,1);
con04d301F = con04d301F0(:,:,2);
con04d301B = con04d301B0(:,:,3);
con04d302aH = con04d302aH0(:,:,1);
con04d302aF = con04d302aF0(:,:,2);
con04d302aB = con04d302aB0(:,:,3);
con04d302bH = con04d302bH0(:,:,1);
con04d302bF = con04d302bF0(:,:,2);
con04d302bB = con04d302bB0(:,:,3);
con04d303H = con04d303H0(:,:,1);
con04d303F = con04d303F0(:,:,2);
con04d303B = con04d303B0(:,:,3);


%% con04d301

%con04d301B (B)
SE50 = strel('square',50);
con04d301B01 = imtophat(con04d301B, SE50);
con04d301Baht = adapthisteq(con04d301B01);
avg = ones(3,3)/9;
con04d301Bmed = medfilt2(con04d301Baht,[3,3]);
con04d301B02 = imtophat(con04d301Bmed,SE50);
con04d301Bcom = imcomplement(con04d301B02);
con04d301B03 = medfilt2(con04d301Bcom,[3,3]);
con04d301B04 = imcomplement(con04d301B03); % DAPI(B): pre1

%con04d301H_Hfos (R)
con04d301H01 = imtophat(con04d301H, SE50);
con04d301Hcom = imcomplement(con04d301H01);
con04d301H02 = medfilt2(con04d301Hcom, [3,3]);
con04d301H03 = imcomplement(con04d301H02);
con04d301H03_T105 = con04d301H03 > 90; % H1a_fosi % T change <------------
con04d301B04_T120 = con04d301B04 > 120; % DAPI(B): pre2a
con04d301Hfos1 = imfuse(con04d301H03_T105, con04d301B04_T120, 'blend');
con04d301Hfos2 = con04d301Hfos1 > 140; % H1a_fosi (R): final
con04d301HB1 = imfuse(con04d301Hfos2, con04d301B04,'Colorchannel',[1 0 2]);

%con04d301F_Ffos (G)
con04d301F01 = imtophat(con04d301F, SE50);
con04d301Fcom = imcomplement(con04d301F01);
con04d301F02 = medfilt2(con04d301Fcom, [3,3]);
con04d301F03 = imcomplement(con04d301F02);
con04d301F03_T105 = con04d301F03 > 85; % Fos_fosi % T change <------------
con04d301B04_T120 = con04d301B04 > 120; % DAPI(B): pre2a
con04d301Ffos1 = imfuse(con04d301F03_T105, con04d301B04_T120, 'blend');
con04d301Ffos2 = con04d301Ffos1 > 140; % Fos_fosi (G): final
con04d301HFB2 = imoverlay(con04d301HB1,con04d301Ffos2,"green");
imwrite(con04d301HFB2, 'con04d301HFB2.tif');



%% con04d302a

%con04d302aB (B)
SE50 = strel('square',50);
con04d302aB01 = imtophat(con04d302aB, SE50);
con04d302aBaht = adapthisteq(con04d302aB01);
%avg = ones(3,3)/9;
con04d302aBmed = medfilt2(con04d302aBaht,[3,3]);
con04d302aB02 = imtophat(con04d302aBmed,SE50);
con04d302aBcom = imcomplement(con04d302aB02);
con04d302aB03 = medfilt2(con04d302aBcom,[3,3]);
con04d302aB04 = imcomplement(con04d302aB03); % DAPI(B): pre1

%con04d302aH_Hfos (R)
con04d302aH01 = imtophat(con04d302aH, SE50);
con04d302aHcom = imcomplement(con04d302aH01);
con04d302aH02 = medfilt2(con04d302aHcom, [3,3]);
con04d302aH03 = imcomplement(con04d302aH02);
con04d302aH03_T105 = con04d302aH03 > 90; % H1a_fosi % T change <------------
con04d302aB04_T120 = con04d302aB04 > 120; % DAPI(B): pre2a
con04d302aHfos1 = imfuse(con04d302aH03_T105, con04d302aB04_T120, 'blend');
con04d302aHfos2 = con04d302aHfos1 > 140; % H1a_fosi (R): final
con04d302aHB1 = imfuse(con04d302aHfos2, con04d302aB04,'Colorchannel',[1 0 2]);

%con04d302aF_Ffos (G)
con04d302aF01 = imtophat(con04d302aF, SE50);
con04d302aFcom = imcomplement(con04d302aF01);
con04d302aF02 = medfilt2(con04d302aFcom, [3,3]);
con04d302aF03 = imcomplement(con04d302aF02);
con04d302aF03_T105 = con04d302aF03 > 85; % Fos_fosi % T change <------------
con04d302aB04_T120 = con04d302aB04 > 120; % DAPI(B): pre2a
con04d302aFfos1 = imfuse(con04d302aF03_T105, con04d302aB04_T120, 'blend');
con04d302aFfos2 = con04d302aFfos1 > 140; % Fos_fosi (G): final
con04d302aHFB2 = imoverlay(con04d302aHB1,con04d302aFfos2,"green");
imwrite(con04d302aHFB2, 'con04d302aHFB2.tif');



%% con04d302b

%con04d302bB (B)
SE50 = strel('square',50);
con04d302bB01 = imtophat(con04d302bB, SE50);
con04d302bBaht = adapthisteq(con04d302bB01);
%avg = ones(3,3)/9;
con04d302bBmed = medfilt2(con04d302bBaht,[3,3]);
con04d302bB02 = imtophat(con04d302bBmed,SE50);
con04d302bBcom = imcomplement(con04d302bB02);
con04d302bB03 = medfilt2(con04d302bBcom,[3,3]);
con04d302bB04 = imcomplement(con04d302bB03); % DAPI(B): pre1

%con04d302bH_Hfos (R)
con04d302bH01 = imtophat(con04d302bH, SE50);
con04d302bHcom = imcomplement(con04d302bH01);
con04d302bH02 = medfilt2(con04d302bHcom, [3,3]);
con04d302bH03 = imcomplement(con04d302bH02);
con04d302bH03_T105 = con04d302bH03 > 90; % H1a_fosi % T change <------------
con04d302bB04_T120 = con04d302bB04 > 120; % DAPI(B): pre2a
con04d302bHfos1 = imfuse(con04d302bH03_T105, con04d302bB04_T120, 'blend');
con04d302bHfos2 = con04d302bHfos1 > 140; % H1a_fosi (R): final
con04d302bHB1 = imfuse(con04d302bHfos2, con04d302bB04,'Colorchannel',[1 0 2]);

%con04d302bF_Ffos (G)
con04d302bF01 = imtophat(con04d302bF, SE50);
con04d302bFcom = imcomplement(con04d302bF01);
con04d302bF02 = medfilt2(con04d302bFcom, [3,3]);
con04d302bF03 = imcomplement(con04d302bF02);
con04d302bF03_T105 = con04d302bF03 > 85; % Fos_fosi % T change <------------
con04d302bB04_T120 = con04d302bB04 > 120; % DAPI(B): pre2a
con04d302bFfos1 = imfuse(con04d302bF03_T105, con04d302bB04_T120, 'blend');
con04d302bFfos2 = con04d302bFfos1 > 140; % Fos_fosi (G): final
con04d302bHFB2 = imoverlay(con04d302bHB1,con04d302bFfos2,"green");
imwrite(con04d302bHFB2, 'con04d302bHFB2.tif');





%% con04d303

%con04d303B (B)
SE50 = strel('square',50);
con04d303B01 = imtophat(con04d303B, SE50);
con04d303Baht = adapthisteq(con04d303B01);
%avg = ones(3,3)/9;
con04d303Bmed = medfilt2(con04d303Baht,[3,3]);
con04d303B02 = imtophat(con04d303Bmed,SE50);
con04d303Bcom = imcomplement(con04d303B02);
con04d303B03 = medfilt2(con04d303Bcom,[3,3]);
con04d303B04 = imcomplement(con04d303B03); % DAPI(B): pre1

%con04d303H_Hfos (R)
con04d303H01 = imtophat(con04d303H, SE50);
con04d303Hcom = imcomplement(con04d303H01);
con04d303H02 = medfilt2(con04d303Hcom, [3,3]);
con04d303H03 = imcomplement(con04d303H02);
con04d303H03_T105 = con04d303H03 > 90; % H1a_fosi % T change <------------
con04d303B04_T120 = con04d303B04 > 120; % DAPI(B): pre2a
con04d303Hfos1 = imfuse(con04d303H03_T105, con04d303B04_T120, 'blend');
con04d303Hfos2 = con04d303Hfos1 > 140; % H1a_fosi (R): final
con04d303HB1 = imfuse(con04d303Hfos2, con04d303B04,'Colorchannel',[1 0 2]);

%con04d303F_Ffos (G)
con04d303F01 = imtophat(con04d303F, SE50);
con04d303Fcom = imcomplement(con04d303F01);
con04d303F02 = medfilt2(con04d303Fcom, [3,3]);
con04d303F03 = imcomplement(con04d303F02);
con04d303F03_T105 = con04d303F03 > 85; % Fos_fosi % T change <------------
con04d303B04_T120 = con04d303B04 > 120; % DAPI(B): pre2a
con04d303Ffos1 = imfuse(con04d303F03_T105, con04d303B04_T120, 'blend');
con04d303Ffos2 = con04d303Ffos1 > 140; % Fos_fosi (G): final
con04d303HFB2 = imoverlay(con04d303HB1,con04d303Ffos2,"green");
imwrite(con04d303HFB2, 'con04d303HFB2.tif');



