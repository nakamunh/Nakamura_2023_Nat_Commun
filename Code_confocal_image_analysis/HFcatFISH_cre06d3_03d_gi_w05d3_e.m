%% H1a-Fos catFISH 

cre06d301gH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301gH0.jpg');
cre06d301gF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301gF0.jpg');
cre06d301gB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301gB0a.jpg');
cre06d301gB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301gB0b.jpg');
cre06d301gB0 = imfuse(cre06d301gB0a, cre06d301gB0b, 'blend');
cre06d301iH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301iH0.jpg');
cre06d301iF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301iF0.jpg');
cre06d301iB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301iB0a.jpg');
cre06d301iB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301iB0b.jpg');
cre06d301iB0 = imfuse(cre06d301iB0a, cre06d301iB0b, 'blend');
w05d303eH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303eH0.jpg');
w05d303eF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303eF0.jpg');
w05d303eB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303eB0a.jpg');
w05d303eB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\w05d303eB0b.jpg');
w05d303eB0 = imfuse(w05d303eB0a, w05d303eB0b, 'blend');

cre06d301gH = cre06d301gH0(:,:,1);
cre06d301gF = cre06d301gF0(:,:,2);
cre06d301gB = cre06d301gB0(:,:,3);
cre06d301iH = cre06d301iH0(:,:,1);
cre06d301iF = cre06d301iF0(:,:,2);
cre06d301iB = cre06d301iB0(:,:,3);
w05d303eH = w05d303eH0(:,:,1);
w05d303eF = w05d303eF0(:,:,2);
w05d303eB = w05d303eB0(:,:,3);


%% cre06d301g

%cre06d301gB (B)
SE50 = strel('square',50);
cre06d301gB01 = imtophat(cre06d301gB, SE50);
cre06d301gBaht = adapthisteq(cre06d301gB01);
avg = ones(3,3)/9;
cre06d301gBmed = medfilt2(cre06d301gBaht,[3,3]);
cre06d301gB02 = imtophat(cre06d301gBmed,SE50);
cre06d301gBcom = imcomplement(cre06d301gB02);
cre06d301gB03 = medfilt2(cre06d301gBcom,[3,3]);
cre06d301gB04 = imcomplement(cre06d301gB03); % DAPI(B): pre1

%cre06d301gH_Hfos (R)
cre06d301gH01 = imtophat(cre06d301gH, SE50);
cre06d301gHcom = imcomplement(cre06d301gH01);
cre06d301gH02 = medfilt2(cre06d301gHcom, [3,3]);
cre06d301gH03 = imcomplement(cre06d301gH02);
cre06d301gH03_T105 = cre06d301gH03 > 90; % H1a_fosi % T change <------------
cre06d301gB04_T120 = cre06d301gB04 > 120; % DAPI(B): pre2a
cre06d301gHfos1 = imfuse(cre06d301gH03_T105, cre06d301gB04_T120, 'blend');
cre06d301gHfos2 = cre06d301gHfos1 > 140; % H1a_fosi (R): final
cre06d301gHB1 = imfuse(cre06d301gHfos2, cre06d301gB04,'Colorchannel',[1 0 2]);

%cre06d301gF_Ffos (G)
cre06d301gF01 = imtophat(cre06d301gF, SE50);
cre06d301gFcom = imcomplement(cre06d301gF01);
cre06d301gF02 = medfilt2(cre06d301gFcom, [3,3]);
cre06d301gF03 = imcomplement(cre06d301gF02);
cre06d301gF03_T105 = cre06d301gF03 > 85; % Fos_fosi % T change <------------
cre06d301gB04_T120 = cre06d301gB04 > 120; % DAPI(B): pre2a
cre06d301gFfos1 = imfuse(cre06d301gF03_T105, cre06d301gB04_T120, 'blend');
cre06d301gFfos2 = cre06d301gFfos1 > 140; % Fos_fosi (G): final
cre06d301gHFB2 = imoverlay(cre06d301gHB1,cre06d301gFfos2,"green");
imwrite(cre06d301gHFB2, 'cre06d301gHFB2.tif');



%% cre06d301i

%cre06d301iB (B)
SE50 = strel('square',50);
cre06d301iB01 = imtophat(cre06d301iB, SE50);
cre06d301iBaht = adapthisteq(cre06d301iB01);
%avg = ones(3,3)/9;
cre06d301iBmed = medfilt2(cre06d301iBaht,[3,3]);
cre06d301iB02 = imtophat(cre06d301iBmed,SE50);
cre06d301iBcom = imcomplement(cre06d301iB02);
cre06d301iB03 = medfilt2(cre06d301iBcom,[3,3]);
cre06d301iB04 = imcomplement(cre06d301iB03); % DAPI(B): pre1

%cre06d301iH_Hfos (R)
cre06d301iH01 = imtophat(cre06d301iH, SE50);
cre06d301iHcom = imcomplement(cre06d301iH01);
cre06d301iH02 = medfilt2(cre06d301iHcom, [3,3]);
cre06d301iH03 = imcomplement(cre06d301iH02);
cre06d301iH03_T105 = cre06d301iH03 > 90; % H1a_fosi % T change <------------
cre06d301iB04_T120 = cre06d301iB04 > 120; % DAPI(B): pre2a
cre06d301iHfos1 = imfuse(cre06d301iH03_T105, cre06d301iB04_T120, 'blend');
cre06d301iHfos2 = cre06d301iHfos1 > 140; % H1a_fosi (R): final
cre06d301iHB1 = imfuse(cre06d301iHfos2, cre06d301iB04,'Colorchannel',[1 0 2]);

%cre06d301iF_Ffos (G)
cre06d301iF01 = imtophat(cre06d301iF, SE50);
cre06d301iFcom = imcomplement(cre06d301iF01);
cre06d301iF02 = medfilt2(cre06d301iFcom, [3,3]);
cre06d301iF03 = imcomplement(cre06d301iF02);
cre06d301iF03_T105 = cre06d301iF03 > 85; % Fos_fosi % T change <------------
cre06d301iB04_T120 = cre06d301iB04 > 120; % DAPI(B): pre2a
cre06d301iFfos1 = imfuse(cre06d301iF03_T105, cre06d301iB04_T120, 'blend');
cre06d301iFfos2 = cre06d301iFfos1 > 140; % Fos_fosi (G): final
cre06d301iHFB2 = imoverlay(cre06d301iHB1,cre06d301iFfos2,"green");
imwrite(cre06d301iHFB2, 'cre06d301iHFB2.tif');



%% w05d303e

%w05d303eB (B)
SE50 = strel('square',50);
w05d303eB01 = imtophat(w05d303eB, SE50);
w05d303eBaht = adapthisteq(w05d303eB01);
%avg = ones(3,3)/9;
w05d303eBmed = medfilt2(w05d303eBaht,[3,3]);
w05d303eB02 = imtophat(w05d303eBmed,SE50);
w05d303eBcom = imcomplement(w05d303eB02);
w05d303eB03 = medfilt2(w05d303eBcom,[3,3]);
w05d303eB04 = imcomplement(w05d303eB03); % DAPI(B): pre1

%w05d303eH_Hfos (R)
w05d303eH01 = imtophat(w05d303eH, SE50);
w05d303eHcom = imcomplement(w05d303eH01);
w05d303eH02 = medfilt2(w05d303eHcom, [3,3]);
w05d303eH03 = imcomplement(w05d303eH02);
w05d303eH03_T105 = w05d303eH03 > 90; % H1a_fosi % T change <------------
w05d303eB04_T120 = w05d303eB04 > 120; % DAPI(B): pre2a
w05d303eHfos1 = imfuse(w05d303eH03_T105, w05d303eB04_T120, 'blend');
w05d303eHfos2 = w05d303eHfos1 > 140; % H1a_fosi (R): final
w05d303eHB1 = imfuse(w05d303eHfos2, w05d303eB04,'Colorchannel',[1 0 2]);

%w05d303eF_Ffos (G)
w05d303eF01 = imtophat(w05d303eF, SE50);
w05d303eFcom = imcomplement(w05d303eF01);
w05d303eF02 = medfilt2(w05d303eFcom, [3,3]);
w05d303eF03 = imcomplement(w05d303eF02);
w05d303eF03_T105 = w05d303eF03 > 85; % Fos_fosi % T change <------------
w05d303eB04_T120 = w05d303eB04 > 120; % DAPI(B): pre2a
w05d303eFfos1 = imfuse(w05d303eF03_T105, w05d303eB04_T120, 'blend');
w05d303eFfos2 = w05d303eFfos1 > 140; % Fos_fosi (G): final
w05d303eHFB2 = imoverlay(w05d303eHB1,w05d303eFfos2,"green");
imwrite(w05d303eHFB2, 'w05d303eHFB2.tif');



