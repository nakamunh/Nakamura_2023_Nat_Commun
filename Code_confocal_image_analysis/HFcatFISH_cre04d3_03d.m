%% H1a-Fos catFISH 

cre04d301aH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301aH0.jpg');
cre04d301aF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301aF0.jpg');
cre04d301aB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301aB0a.jpg');
cre04d301aB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301aB0b.jpg');
cre04d301aB0 = imfuse(cre04d301aB0a, cre04d301aB0b, 'blend');
cre04d301bH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301bH0.jpg');
cre04d301bF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301bF0.jpg');
cre04d301bB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301bB0a.jpg');
cre04d301bB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d301bB0b.jpg');
cre04d301bB0 = imfuse(cre04d301bB0a, cre04d301bB0b, 'blend');
cre04d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d302H0.jpg');
cre04d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d302F0.jpg');
cre04d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d302B0a.jpg');
cre04d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d302B0b.jpg');
cre04d302B0 = imfuse(cre04d302B0a, cre04d302B0b, 'blend');
cre04d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d303H0.jpg');
cre04d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d303F0.jpg');
cre04d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d303B0a.jpg');
cre04d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre04d303B0b.jpg');
cre04d303B0 = imfuse(cre04d303B0a, cre04d303B0b, 'blend');

cre04d301aH = cre04d301aH0(:,:,1);
cre04d301aF = cre04d301aF0(:,:,2);
cre04d301aB = cre04d301aB0(:,:,3);
cre04d301bH = cre04d301bH0(:,:,1);
cre04d301bF = cre04d301bF0(:,:,2);
cre04d301bB = cre04d301bB0(:,:,3);
cre04d302H = cre04d302H0(:,:,1);
cre04d302F = cre04d302F0(:,:,2);
cre04d302B = cre04d302B0(:,:,3);
cre04d303H = cre04d303H0(:,:,1);
cre04d303F = cre04d303F0(:,:,2);
cre04d303B = cre04d303B0(:,:,3);


%% cre04d301a

%cre04d301aB (B)
SE50 = strel('square',50);
cre04d301aB01 = imtophat(cre04d301aB, SE50);
cre04d301aBaht = adapthisteq(cre04d301aB01);
avg = ones(3,3)/9;
cre04d301aBmed = medfilt2(cre04d301aBaht,[3,3]);
cre04d301aB02 = imtophat(cre04d301aBmed,SE50);
cre04d301aBcom = imcomplement(cre04d301aB02);
cre04d301aB03 = medfilt2(cre04d301aBcom,[3,3]);
cre04d301aB04 = imcomplement(cre04d301aB03); % DAPI(B): pre1

%cre04d301aH_Hfos (R)
cre04d301aH01 = imtophat(cre04d301aH, SE50);
cre04d301aHcom = imcomplement(cre04d301aH01);
cre04d301aH02 = medfilt2(cre04d301aHcom, [3,3]);
cre04d301aH03 = imcomplement(cre04d301aH02);
cre04d301aH03_T105 = cre04d301aH03 > 90; % H1a_fosi % T change <------------
cre04d301aB04_T120 = cre04d301aB04 > 120; % DAPI(B): pre2a
cre04d301aHfos1 = imfuse(cre04d301aH03_T105, cre04d301aB04_T120, 'blend');
cre04d301aHfos2 = cre04d301aHfos1 > 140; % H1a_fosi (R): final
cre04d301aHB1 = imfuse(cre04d301aHfos2, cre04d301aB04,'Colorchannel',[1 0 2]);

%cre04d301aF_Ffos (G)
cre04d301aF01 = imtophat(cre04d301aF, SE50);
cre04d301aFcom = imcomplement(cre04d301aF01);
cre04d301aF02 = medfilt2(cre04d301aFcom, [3,3]);
cre04d301aF03 = imcomplement(cre04d301aF02);
cre04d301aF03_T105 = cre04d301aF03 > 85; % Fos_fosi % T change <------------
cre04d301aB04_T120 = cre04d301aB04 > 120; % DAPI(B): pre2a
cre04d301aFfos1 = imfuse(cre04d301aF03_T105, cre04d301aB04_T120, 'blend');
cre04d301aFfos2 = cre04d301aFfos1 > 140; % Fos_fosi (G): final
cre04d301aHFB2 = imoverlay(cre04d301aHB1,cre04d301aFfos2,"green");
imwrite(cre04d301aHFB2, 'cre04d301aHFB2.tif');



%% cre04d301b

%cre04d301bB (B)
SE50 = strel('square',50);
cre04d301bB01 = imtophat(cre04d301bB, SE50);
cre04d301bBaht = adapthisteq(cre04d301bB01);
%avg = ones(3,3)/9;
cre04d301bBmed = medfilt2(cre04d301bBaht,[3,3]);
cre04d301bB02 = imtophat(cre04d301bBmed,SE50);
cre04d301bBcom = imcomplement(cre04d301bB02);
cre04d301bB03 = medfilt2(cre04d301bBcom,[3,3]);
cre04d301bB04 = imcomplement(cre04d301bB03); % DAPI(B): pre1

%cre04d301bH_Hfos (R)
cre04d301bH01 = imtophat(cre04d301bH, SE50);
cre04d301bHcom = imcomplement(cre04d301bH01);
cre04d301bH02 = medfilt2(cre04d301bHcom, [3,3]);
cre04d301bH03 = imcomplement(cre04d301bH02);
cre04d301bH03_T105 = cre04d301bH03 > 90; % H1a_fosi % T change <------------
cre04d301bB04_T120 = cre04d301bB04 > 120; % DAPI(B): pre2a
cre04d301bHfos1 = imfuse(cre04d301bH03_T105, cre04d301bB04_T120, 'blend');
cre04d301bHfos2 = cre04d301bHfos1 > 140; % H1a_fosi (R): final
cre04d301bHB1 = imfuse(cre04d301bHfos2, cre04d301bB04,'Colorchannel',[1 0 2]);

%cre04d301bF_Ffos (G)
cre04d301bF01 = imtophat(cre04d301bF, SE50);
cre04d301bFcom = imcomplement(cre04d301bF01);
cre04d301bF02 = medfilt2(cre04d301bFcom, [3,3]);
cre04d301bF03 = imcomplement(cre04d301bF02);
cre04d301bF03_T105 = cre04d301bF03 > 85; % Fos_fosi % T change <------------
cre04d301bB04_T120 = cre04d301bB04 > 120; % DAPI(B): pre2a
cre04d301bFfos1 = imfuse(cre04d301bF03_T105, cre04d301bB04_T120, 'blend');
cre04d301bFfos2 = cre04d301bFfos1 > 140; % Fos_fosi (G): final
cre04d301bHFB2 = imoverlay(cre04d301bHB1,cre04d301bFfos2,"green");
imwrite(cre04d301bHFB2, 'cre04d301bHFB2.tif');


%% cre04d302

%cre04d302B (B)
SE50 = strel('square',50);
cre04d302B01 = imtophat(cre04d302B, SE50);
cre04d302Baht = adapthisteq(cre04d302B01);
%avg = ones(3,3)/9;
cre04d302Bmed = medfilt2(cre04d302Baht,[3,3]);
cre04d302B02 = imtophat(cre04d302Bmed,SE50);
cre04d302Bcom = imcomplement(cre04d302B02);
cre04d302B03 = medfilt2(cre04d302Bcom,[3,3]);
cre04d302B04 = imcomplement(cre04d302B03); % DAPI(B): pre1

%cre04d302H_Hfos (R)
cre04d302H01 = imtophat(cre04d302H, SE50);
cre04d302Hcom = imcomplement(cre04d302H01);
cre04d302H02 = medfilt2(cre04d302Hcom, [3,3]);
cre04d302H03 = imcomplement(cre04d302H02);
cre04d302H03_T105 = cre04d302H03 > 90; % H1a_fosi % T change <------------
cre04d302B04_T120 = cre04d302B04 > 120; % DAPI(B): pre2a
cre04d302Hfos1 = imfuse(cre04d302H03_T105, cre04d302B04_T120, 'blend');
cre04d302Hfos2 = cre04d302Hfos1 > 140; % H1a_fosi (R): final
cre04d302HB1 = imfuse(cre04d302Hfos2, cre04d302B04,'Colorchannel',[1 0 2]);

%cre04d302F_Ffos (G)
cre04d302F01 = imtophat(cre04d302F, SE50);
cre04d302Fcom = imcomplement(cre04d302F01);
cre04d302F02 = medfilt2(cre04d302Fcom, [3,3]);
cre04d302F03 = imcomplement(cre04d302F02);
cre04d302F03_T105 = cre04d302F03 > 85; % Fos_fosi % T change <------------
cre04d302B04_T120 = cre04d302B04 > 120; % DAPI(B): pre2a
cre04d302Ffos1 = imfuse(cre04d302F03_T105, cre04d302B04_T120, 'blend');
cre04d302Ffos2 = cre04d302Ffos1 > 140; % Fos_fosi (G): final
cre04d302HFB2 = imoverlay(cre04d302HB1,cre04d302Ffos2,"green");
imwrite(cre04d302HFB2, 'cre04d302HFB2.tif');




%% cre04d303

%cre04d303B (B)
SE50 = strel('square',50);
cre04d303B01 = imtophat(cre04d303B, SE50);
cre04d303Baht = adapthisteq(cre04d303B01);
%avg = ones(3,3)/9;
cre04d303Bmed = medfilt2(cre04d303Baht,[3,3]);
cre04d303B02 = imtophat(cre04d303Bmed,SE50);
cre04d303Bcom = imcomplement(cre04d303B02);
cre04d303B03 = medfilt2(cre04d303Bcom,[3,3]);
cre04d303B04 = imcomplement(cre04d303B03); % DAPI(B): pre1

%cre04d303H_Hfos (R)
cre04d303H01 = imtophat(cre04d303H, SE50);
cre04d303Hcom = imcomplement(cre04d303H01);
cre04d303H02 = medfilt2(cre04d303Hcom, [3,3]);
cre04d303H03 = imcomplement(cre04d303H02);
cre04d303H03_T105 = cre04d303H03 > 90; % H1a_fosi % T change <------------
cre04d303B04_T120 = cre04d303B04 > 120; % DAPI(B): pre2a
cre04d303Hfos1 = imfuse(cre04d303H03_T105, cre04d303B04_T120, 'blend');
cre04d303Hfos2 = cre04d303Hfos1 > 140; % H1a_fosi (R): final
cre04d303HB1 = imfuse(cre04d303Hfos2, cre04d303B04,'Colorchannel',[1 0 2]);

%cre04d303F_Ffos (G)
cre04d303F01 = imtophat(cre04d303F, SE50);
cre04d303Fcom = imcomplement(cre04d303F01);
cre04d303F02 = medfilt2(cre04d303Fcom, [3,3]);
cre04d303F03 = imcomplement(cre04d303F02);
cre04d303F03_T105 = cre04d303F03 > 85; % Fos_fosi % T change <------------
cre04d303B04_T120 = cre04d303B04 > 120; % DAPI(B): pre2a
cre04d303Ffos1 = imfuse(cre04d303F03_T105, cre04d303B04_T120, 'blend');
cre04d303Ffos2 = cre04d303Ffos1 > 140; % Fos_fosi (G): final
cre04d303HFB2 = imoverlay(cre04d303HB1,cre04d303Ffos2,"green");
imwrite(cre04d303HFB2, 'cre04d303HFB2.tif');



