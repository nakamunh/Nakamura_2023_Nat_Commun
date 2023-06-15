%% H1a-Fos catFISH 

cre06d301eH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301eH0.jpg');
cre06d301eF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301eF0.jpg');
cre06d301eB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301eB0a.jpg');
cre06d301eB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301eB0b.jpg');
cre06d301eB0 = imfuse(cre06d301eB0a, cre06d301eB0b, 'blend');
cre06d301fH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301fH0.jpg');
cre06d301fF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301fF0.jpg');
cre06d301fB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301fB0a.jpg');
cre06d301fB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d301fB0b.jpg');
cre06d301fB0 = imfuse(cre06d301fB0a, cre06d301fB0b, 'blend');
cre06d302eH0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302eH0.jpg');
cre06d302eF0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302eF0.jpg');
cre06d302eB0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302eB0a.jpg');
cre06d302eB0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\cre06d302eB0b.jpg');
cre06d302eB0 = imfuse(cre06d302eB0a, cre06d302eB0b, 'blend');

cre06d301eH = cre06d301eH0(:,:,1);
cre06d301eF = cre06d301eF0(:,:,2);
cre06d301eB = cre06d301eB0(:,:,3);
cre06d301fH = cre06d301fH0(:,:,1);
cre06d301fF = cre06d301fF0(:,:,2);
cre06d301fB = cre06d301fB0(:,:,3);
cre06d302eH = cre06d302eH0(:,:,1);
cre06d302eF = cre06d302eF0(:,:,2);
cre06d302eB = cre06d302eB0(:,:,3);


%% cre06d301e

%cre06d301eB (B)
SE50 = strel('square',50);
cre06d301eB01 = imtophat(cre06d301eB, SE50);
cre06d301eBaht = adapthisteq(cre06d301eB01);
avg = ones(3,3)/9;
cre06d301eBmed = medfilt2(cre06d301eBaht,[3,3]);
cre06d301eB02 = imtophat(cre06d301eBmed,SE50);
cre06d301eBcom = imcomplement(cre06d301eB02);
cre06d301eB03 = medfilt2(cre06d301eBcom,[3,3]);
cre06d301eB04 = imcomplement(cre06d301eB03); % DAPI(B): pre1

%cre06d301eH_Hfos (R)
cre06d301eH01 = imtophat(cre06d301eH, SE50);
cre06d301eHcom = imcomplement(cre06d301eH01);
cre06d301eH02 = medfilt2(cre06d301eHcom, [3,3]);
cre06d301eH03 = imcomplement(cre06d301eH02);
cre06d301eH03_T105 = cre06d301eH03 > 90; % H1a_fosi % T change <------------
cre06d301eB04_T120 = cre06d301eB04 > 120; % DAPI(B): pre2a
cre06d301eHfos1 = imfuse(cre06d301eH03_T105, cre06d301eB04_T120, 'blend');
cre06d301eHfos2 = cre06d301eHfos1 > 140; % H1a_fosi (R): final
cre06d301eHB1 = imfuse(cre06d301eHfos2, cre06d301eB04,'Colorchannel',[1 0 2]);

%cre06d301eF_Ffos (G)
cre06d301eF01 = imtophat(cre06d301eF, SE50);
cre06d301eFcom = imcomplement(cre06d301eF01);
cre06d301eF02 = medfilt2(cre06d301eFcom, [3,3]);
cre06d301eF03 = imcomplement(cre06d301eF02);
cre06d301eF03_T105 = cre06d301eF03 > 85; % Fos_fosi % T change <------------
cre06d301eB04_T120 = cre06d301eB04 > 120; % DAPI(B): pre2a
cre06d301eFfos1 = imfuse(cre06d301eF03_T105, cre06d301eB04_T120, 'blend');
cre06d301eFfos2 = cre06d301eFfos1 > 140; % Fos_fosi (G): final
cre06d301eHFB2 = imoverlay(cre06d301eHB1,cre06d301eFfos2,"green");
imwrite(cre06d301eHFB2, 'cre06d301eHFB2.tif');



%% cre06d301f

%cre06d301fB (B)
SE50 = strel('square',50);
cre06d301fB01 = imtophat(cre06d301fB, SE50);
cre06d301fBaht = adapthisteq(cre06d301fB01);
%avg = ones(3,3)/9;
cre06d301fBmed = medfilt2(cre06d301fBaht,[3,3]);
cre06d301fB02 = imtophat(cre06d301fBmed,SE50);
cre06d301fBcom = imcomplement(cre06d301fB02);
cre06d301fB03 = medfilt2(cre06d301fBcom,[3,3]);
cre06d301fB04 = imcomplement(cre06d301fB03); % DAPI(B): pre1

%cre06d301fH_Hfos (R)
cre06d301fH01 = imtophat(cre06d301fH, SE50);
cre06d301fHcom = imcomplement(cre06d301fH01);
cre06d301fH02 = medfilt2(cre06d301fHcom, [3,3]);
cre06d301fH03 = imcomplement(cre06d301fH02);
cre06d301fH03_T105 = cre06d301fH03 > 90; % H1a_fosi % T change <------------
cre06d301fB04_T120 = cre06d301fB04 > 120; % DAPI(B): pre2a
cre06d301fHfos1 = imfuse(cre06d301fH03_T105, cre06d301fB04_T120, 'blend');
cre06d301fHfos2 = cre06d301fHfos1 > 140; % H1a_fosi (R): final
cre06d301fHB1 = imfuse(cre06d301fHfos2, cre06d301fB04,'Colorchannel',[1 0 2]);

%cre06d301fF_Ffos (G)
cre06d301fF01 = imtophat(cre06d301fF, SE50);
cre06d301fFcom = imcomplement(cre06d301fF01);
cre06d301fF02 = medfilt2(cre06d301fFcom, [3,3]);
cre06d301fF03 = imcomplement(cre06d301fF02);
cre06d301fF03_T105 = cre06d301fF03 > 85; % Fos_fosi % T change <------------
cre06d301fB04_T120 = cre06d301fB04 > 120; % DAPI(B): pre2a
cre06d301fFfos1 = imfuse(cre06d301fF03_T105, cre06d301fB04_T120, 'blend');
cre06d301fFfos2 = cre06d301fFfos1 > 140; % Fos_fosi (G): final
cre06d301fHFB2 = imoverlay(cre06d301fHB1,cre06d301fFfos2,"green");
imwrite(cre06d301fHFB2, 'cre06d301fHFB2.tif');



%% cre06d302e

%cre06d302eB (B)
SE50 = strel('square',50);
cre06d302eB01 = imtophat(cre06d302eB, SE50);
cre06d302eBaht = adapthisteq(cre06d302eB01);
%avg = ones(3,3)/9;
cre06d302eBmed = medfilt2(cre06d302eBaht,[3,3]);
cre06d302eB02 = imtophat(cre06d302eBmed,SE50);
cre06d302eBcom = imcomplement(cre06d302eB02);
cre06d302eB03 = medfilt2(cre06d302eBcom,[3,3]);
cre06d302eB04 = imcomplement(cre06d302eB03); % DAPI(B): pre1

%cre06d302eH_Hfos (R)
cre06d302eH01 = imtophat(cre06d302eH, SE50);
cre06d302eHcom = imcomplement(cre06d302eH01);
cre06d302eH02 = medfilt2(cre06d302eHcom, [3,3]);
cre06d302eH03 = imcomplement(cre06d302eH02);
cre06d302eH03_T105 = cre06d302eH03 > 90; % H1a_fosi % T change <------------
cre06d302eB04_T120 = cre06d302eB04 > 120; % DAPI(B): pre2a
cre06d302eHfos1 = imfuse(cre06d302eH03_T105, cre06d302eB04_T120, 'blend');
cre06d302eHfos2 = cre06d302eHfos1 > 140; % H1a_fosi (R): final
cre06d302eHB1 = imfuse(cre06d302eHfos2, cre06d302eB04,'Colorchannel',[1 0 2]);

%cre06d302eF_Ffos (G)
cre06d302eF01 = imtophat(cre06d302eF, SE50);
cre06d302eFcom = imcomplement(cre06d302eF01);
cre06d302eF02 = medfilt2(cre06d302eFcom, [3,3]);
cre06d302eF03 = imcomplement(cre06d302eF02);
cre06d302eF03_T105 = cre06d302eF03 > 85; % Fos_fosi % T change <------------
cre06d302eB04_T120 = cre06d302eB04 > 120; % DAPI(B): pre2a
cre06d302eFfos1 = imfuse(cre06d302eF03_T105, cre06d302eB04_T120, 'blend');
cre06d302eFfos2 = cre06d302eFfos1 > 140; % Fos_fosi (G): final
cre06d302eHFB2 = imoverlay(cre06d302eHB1,cre06d302eFfos2,"green");
imwrite(cre06d302eHFB2, 'cre06d302eHFB2.tif');



