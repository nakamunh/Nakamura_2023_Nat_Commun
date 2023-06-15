%% H1a-Fos catFISH 

con02d301aH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301aH0.jpg');
con02d301aF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301aF0.jpg');
con02d301aB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301aB0a.jpg');
con02d301aB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301aB0b.jpg');
con02d301aB0 = imfuse(con02d301aB0a, con02d301aB0b, 'blend');
con02d301bH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301bH0.jpg');
con02d301bF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301bF0.jpg');
con02d301bB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301bB0a.jpg');
con02d301bB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d301bB0b.jpg');
con02d301bB0 = imfuse(con02d301bB0a, con02d301bB0b, 'blend');
con02d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d302H0.jpg');
con02d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d302F0.jpg');
con02d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d302B0a.jpg');
con02d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d302B0b.jpg');
con02d302B0 = imfuse(con02d302B0a, con02d302B0b, 'blend');
con02d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d303H0.jpg');
con02d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d303F0.jpg');
con02d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d303B0a.jpg');
con02d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con02d303B0b.jpg');
con02d303B0 = imfuse(con02d303B0a, con02d303B0b, 'blend');

con02d301aH = con02d301aH0(:,:,1);
con02d301aF = con02d301aF0(:,:,2);
con02d301aB = con02d301aB0(:,:,3);
con02d301bH = con02d301bH0(:,:,1);
con02d301bF = con02d301bF0(:,:,2);
con02d301bB = con02d301bB0(:,:,3);
con02d302H = con02d302H0(:,:,1);
con02d302F = con02d302F0(:,:,2);
con02d302B = con02d302B0(:,:,3);
con02d303H = con02d303H0(:,:,1);
con02d303F = con02d303F0(:,:,2);
con02d303B = con02d303B0(:,:,3);


%% con02d301a

%con02d301aB (B)
SE50 = strel('square',50);
con02d301aB01 = imtophat(con02d301aB, SE50);
con02d301aBaht = adapthisteq(con02d301aB01);
avg = ones(3,3)/9;
con02d301aBmed = medfilt2(con02d301aBaht,[3,3]);
con02d301aB02 = imtophat(con02d301aBmed,SE50);
con02d301aBcom = imcomplement(con02d301aB02);
con02d301aB03 = medfilt2(con02d301aBcom,[3,3]);
con02d301aB04 = imcomplement(con02d301aB03); % DAPI(B): pre1

%con02d301aH_Hfos (R)
con02d301aH01 = imtophat(con02d301aH, SE50);
con02d301aHcom = imcomplement(con02d301aH01);
con02d301aH02 = medfilt2(con02d301aHcom, [3,3]);
con02d301aH03 = imcomplement(con02d301aH02);
con02d301aH03_T105 = con02d301aH03 > 90; % H1a_fosi % T change <------------
con02d301aB04_T120 = con02d301aB04 > 120; % DAPI(B): pre2a
con02d301aHfos1 = imfuse(con02d301aH03_T105, con02d301aB04_T120, 'blend');
con02d301aHfos2 = con02d301aHfos1 > 140; % H1a_fosi (R): final
con02d301aHB1 = imfuse(con02d301aHfos2, con02d301aB04,'Colorchannel',[1 0 2]);

%con02d301aF_Ffos (G)
con02d301aF01 = imtophat(con02d301aF, SE50);
con02d301aFcom = imcomplement(con02d301aF01);
con02d301aF02 = medfilt2(con02d301aFcom, [3,3]);
con02d301aF03 = imcomplement(con02d301aF02);
con02d301aF03_T105 = con02d301aF03 > 85; % Fos_fosi % T change <------------
con02d301aB04_T120 = con02d301aB04 > 120; % DAPI(B): pre2a
con02d301aFfos1 = imfuse(con02d301aF03_T105, con02d301aB04_T120, 'blend');
con02d301aFfos2 = con02d301aFfos1 > 140; % Fos_fosi (G): final
con02d301aHFB2 = imoverlay(con02d301aHB1,con02d301aFfos2,"green");
imwrite(con02d301aHFB2, 'con02d301aHFB2.tif');



%% con02d301b

%con02d301bB (B)
SE50 = strel('square',50);
con02d301bB01 = imtophat(con02d301bB, SE50);
con02d301bBaht = adapthisteq(con02d301bB01);
%avg = ones(3,3)/9;
con02d301bBmed = medfilt2(con02d301bBaht,[3,3]);
con02d301bB02 = imtophat(con02d301bBmed,SE50);
con02d301bBcom = imcomplement(con02d301bB02);
con02d301bB03 = medfilt2(con02d301bBcom,[3,3]);
con02d301bB04 = imcomplement(con02d301bB03); % DAPI(B): pre1

%con02d301bH_Hfos (R)
con02d301bH01 = imtophat(con02d301bH, SE50);
con02d301bHcom = imcomplement(con02d301bH01);
con02d301bH02 = medfilt2(con02d301bHcom, [3,3]);
con02d301bH03 = imcomplement(con02d301bH02);
con02d301bH03_T105 = con02d301bH03 > 90; % H1a_fosi % T change <------------
con02d301bB04_T120 = con02d301bB04 > 120; % DAPI(B): pre2a
con02d301bHfos1 = imfuse(con02d301bH03_T105, con02d301bB04_T120, 'blend');
con02d301bHfos2 = con02d301bHfos1 > 140; % H1a_fosi (R): final
con02d301bHB1 = imfuse(con02d301bHfos2, con02d301bB04,'Colorchannel',[1 0 2]);

%con02d301bF_Ffos (G)
con02d301bF01 = imtophat(con02d301bF, SE50);
con02d301bFcom = imcomplement(con02d301bF01);
con02d301bF02 = medfilt2(con02d301bFcom, [3,3]);
con02d301bF03 = imcomplement(con02d301bF02);
con02d301bF03_T105 = con02d301bF03 > 85; % Fos_fosi % T change <------------
con02d301bB04_T120 = con02d301bB04 > 120; % DAPI(B): pre2a
con02d301bFfos1 = imfuse(con02d301bF03_T105, con02d301bB04_T120, 'blend');
con02d301bFfos2 = con02d301bFfos1 > 140; % Fos_fosi (G): final
con02d301bHFB2 = imoverlay(con02d301bHB1,con02d301bFfos2,"green");
imwrite(con02d301bHFB2, 'con02d301bHFB2.tif');


%% con02d302

%con02d302B (B)
SE50 = strel('square',50);
con02d302B01 = imtophat(con02d302B, SE50);
con02d302Baht = adapthisteq(con02d302B01);
%avg = ones(3,3)/9;
con02d302Bmed = medfilt2(con02d302Baht,[3,3]);
con02d302B02 = imtophat(con02d302Bmed,SE50);
con02d302Bcom = imcomplement(con02d302B02);
con02d302B03 = medfilt2(con02d302Bcom,[3,3]);
con02d302B04 = imcomplement(con02d302B03); % DAPI(B): pre1

%con02d302H_Hfos (R)
con02d302H01 = imtophat(con02d302H, SE50);
con02d302Hcom = imcomplement(con02d302H01);
con02d302H02 = medfilt2(con02d302Hcom, [3,3]);
con02d302H03 = imcomplement(con02d302H02);
con02d302H03_T105 = con02d302H03 > 90; % H1a_fosi % T change <------------
con02d302B04_T120 = con02d302B04 > 120; % DAPI(B): pre2a
con02d302Hfos1 = imfuse(con02d302H03_T105, con02d302B04_T120, 'blend');
con02d302Hfos2 = con02d302Hfos1 > 140; % H1a_fosi (R): final
con02d302HB1 = imfuse(con02d302Hfos2, con02d302B04,'Colorchannel',[1 0 2]);

%con02d302F_Ffos (G)
con02d302F01 = imtophat(con02d302F, SE50);
con02d302Fcom = imcomplement(con02d302F01);
con02d302F02 = medfilt2(con02d302Fcom, [3,3]);
con02d302F03 = imcomplement(con02d302F02);
con02d302F03_T105 = con02d302F03 > 85; % Fos_fosi % T change <------------
con02d302B04_T120 = con02d302B04 > 120; % DAPI(B): pre2a
con02d302Ffos1 = imfuse(con02d302F03_T105, con02d302B04_T120, 'blend');
con02d302Ffos2 = con02d302Ffos1 > 140; % Fos_fosi (G): final
con02d302HFB2 = imoverlay(con02d302HB1,con02d302Ffos2,"green");
imwrite(con02d302HFB2, 'con02d302HFB2.tif');




%% con02d303

%con02d303B (B)
SE50 = strel('square',50);
con02d303B01 = imtophat(con02d303B, SE50);
con02d303Baht = adapthisteq(con02d303B01);
%avg = ones(3,3)/9;
con02d303Bmed = medfilt2(con02d303Baht,[3,3]);
con02d303B02 = imtophat(con02d303Bmed,SE50);
con02d303Bcom = imcomplement(con02d303B02);
con02d303B03 = medfilt2(con02d303Bcom,[3,3]);
con02d303B04 = imcomplement(con02d303B03); % DAPI(B): pre1

%con02d303H_Hfos (R)
con02d303H01 = imtophat(con02d303H, SE50);
con02d303Hcom = imcomplement(con02d303H01);
con02d303H02 = medfilt2(con02d303Hcom, [3,3]);
con02d303H03 = imcomplement(con02d303H02);
con02d303H03_T105 = con02d303H03 > 90; % H1a_fosi % T change <------------
con02d303B04_T120 = con02d303B04 > 120; % DAPI(B): pre2a
con02d303Hfos1 = imfuse(con02d303H03_T105, con02d303B04_T120, 'blend');
con02d303Hfos2 = con02d303Hfos1 > 140; % H1a_fosi (R): final
con02d303HB1 = imfuse(con02d303Hfos2, con02d303B04,'Colorchannel',[1 0 2]);

%con02d303F_Ffos (G)
con02d303F01 = imtophat(con02d303F, SE50);
con02d303Fcom = imcomplement(con02d303F01);
con02d303F02 = medfilt2(con02d303Fcom, [3,3]);
con02d303F03 = imcomplement(con02d303F02);
con02d303F03_T105 = con02d303F03 > 85; % Fos_fosi % T change <------------
con02d303B04_T120 = con02d303B04 > 120; % DAPI(B): pre2a
con02d303Ffos1 = imfuse(con02d303F03_T105, con02d303B04_T120, 'blend');
con02d303Ffos2 = con02d303Ffos1 > 140; % Fos_fosi (G): final
con02d303HFB2 = imoverlay(con02d303HB1,con02d303Ffos2,"green");
imwrite(con02d303HFB2, 'con02d303HFB2.tif');



