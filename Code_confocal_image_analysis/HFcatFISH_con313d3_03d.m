%% H1a-Fos catFISH 

con313d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d301H0.jpg');
con313d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d301F0.jpg');
con313d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d301B0a.jpg');
con313d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d301B0b.jpg');
con313d301B0 = imfuse(con313d301B0a, con313d301B0b, 'blend');
con313d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d302H0.jpg');
con313d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d302F0.jpg');
con313d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d302B0a.jpg');
con313d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d302B0b.jpg');
con313d302B0 = imfuse(con313d302B0a, con313d302B0b, 'blend');
con313d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d303H0.jpg');
con313d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d303F0.jpg');
con313d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d303B0a.jpg');
con313d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d303B0b.jpg');
con313d303B0 = imfuse(con313d303B0a, con313d303B0b, 'blend');
con313d304H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d304H0.jpg');
con313d304F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d304F0.jpg');
con313d304B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d304B0a.jpg');
con313d304B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d304B0b.jpg');
con313d304B0 = imfuse(con313d304B0a, con313d304B0b, 'blend');
con313d305H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d305H0.jpg');
con313d305F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d305F0.jpg');
con313d305B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d305B0a.jpg');
con313d305B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con313d305B0b.jpg');
con313d305B0 = imfuse(con313d305B0a, con313d305B0b, 'blend');

con313d301H = con313d301H0(:,:,1);
con313d301F = con313d301F0(:,:,2);
con313d301B = con313d301B0(:,:,3);
con313d302H = con313d302H0(:,:,1);
con313d302F = con313d302F0(:,:,2);
con313d302B = con313d302B0(:,:,3);
con313d303H = con313d303H0(:,:,1);
con313d303F = con313d303F0(:,:,2);
con313d303B = con313d303B0(:,:,3);
con313d304H = con313d304H0(:,:,1);
con313d304F = con313d304F0(:,:,2);
con313d304B = con313d304B0(:,:,3);
con313d305H = con313d305H0(:,:,1);
con313d305F = con313d305F0(:,:,2);
con313d305B = con313d305B0(:,:,3);

%% con313d301

%con313d301B (B)
SE50 = strel('square',50);
con313d301B01 = imtophat(con313d301B, SE50);
con313d301Baht = adapthisteq(con313d301B01);
avg = ones(3,3)/9;
con313d301Bmed = medfilt2(con313d301Baht,[3,3]);
con313d301B02 = imtophat(con313d301Bmed,SE50);
con313d301Bcom = imcomplement(con313d301B02);
con313d301B03 = medfilt2(con313d301Bcom,[3,3]);
con313d301B04 = imcomplement(con313d301B03); % DAPI(B): pre1

%con313d301H_Hfos (R)
con313d301H01 = imtophat(con313d301H, SE50);
con313d301Hcom = imcomplement(con313d301H01);
con313d301H02 = medfilt2(con313d301Hcom, [3,3]);
con313d301H03 = imcomplement(con313d301H02);
con313d301H03_T105 = con313d301H03 > 90; % H1a_fosi % T change <------------
con313d301B04_T120 = con313d301B04 > 120; % DAPI(B): pre2a
con313d301Hfos1 = imfuse(con313d301H03_T105, con313d301B04_T120, 'blend');
con313d301Hfos2 = con313d301Hfos1 > 140; % H1a_fosi (R): final
con313d301HB1 = imfuse(con313d301Hfos2, con313d301B04,'Colorchannel',[1 0 2]);

%con313d301F_Ffos (G)
con313d301F01 = imtophat(con313d301F, SE50);
con313d301Fcom = imcomplement(con313d301F01);
con313d301F02 = medfilt2(con313d301Fcom, [3,3]);
con313d301F03 = imcomplement(con313d301F02);
con313d301F03_T105 = con313d301F03 > 85; % Fos_fosi % T change <------------
con313d301B04_T120 = con313d301B04 > 120; % DAPI(B): pre2a
con313d301Ffos1 = imfuse(con313d301F03_T105, con313d301B04_T120, 'blend');
con313d301Ffos2 = con313d301Ffos1 > 140; % Fos_fosi (G): final
con313d301HFB2 = imoverlay(con313d301HB1,con313d301Ffos2,"green");
imwrite(con313d301HFB2, 'con313d301HFB2.tif');



%% con313d302

%con313d302B (B)
SE50 = strel('square',50);
con313d302B01 = imtophat(con313d302B, SE50);
con313d302Baht = adapthisteq(con313d302B01);
%avg = ones(3,3)/9;
con313d302Bmed = medfilt2(con313d302Baht,[3,3]);
con313d302B02 = imtophat(con313d302Bmed,SE50);
con313d302Bcom = imcomplement(con313d302B02);
con313d302B03 = medfilt2(con313d302Bcom,[3,3]);
con313d302B04 = imcomplement(con313d302B03); % DAPI(B): pre1

%con313d302H_Hfos (R)
con313d302H01 = imtophat(con313d302H, SE50);
con313d302Hcom = imcomplement(con313d302H01);
con313d302H02 = medfilt2(con313d302Hcom, [3,3]);
con313d302H03 = imcomplement(con313d302H02);
con313d302H03_T105 = con313d302H03 > 90; % H1a_fosi % T change <------------
con313d302B04_T120 = con313d302B04 > 120; % DAPI(B): pre2a
con313d302Hfos1 = imfuse(con313d302H03_T105, con313d302B04_T120, 'blend');
con313d302Hfos2 = con313d302Hfos1 > 140; % H1a_fosi (R): final
con313d302HB1 = imfuse(con313d302Hfos2, con313d302B04,'Colorchannel',[1 0 2]);

%con313d302F_Ffos (G)
con313d302F01 = imtophat(con313d302F, SE50);
con313d302Fcom = imcomplement(con313d302F01);
con313d302F02 = medfilt2(con313d302Fcom, [3,3]);
con313d302F03 = imcomplement(con313d302F02);
con313d302F03_T105 = con313d302F03 > 85; % Fos_fosi % T change <------------
con313d302B04_T120 = con313d302B04 > 120; % DAPI(B): pre2a
con313d302Ffos1 = imfuse(con313d302F03_T105, con313d302B04_T120, 'blend');
con313d302Ffos2 = con313d302Ffos1 > 140; % Fos_fosi (G): final
con313d302HFB2 = imoverlay(con313d302HB1,con313d302Ffos2,"green");
imwrite(con313d302HFB2, 'con313d302HFB2.tif');



%% con313d303

%con313d303B (B)
SE50 = strel('square',50);
con313d303B01 = imtophat(con313d303B, SE50);
con313d303Baht = adapthisteq(con313d303B01);
%avg = ones(3,3)/9;
con313d303Bmed = medfilt2(con313d303Baht,[3,3]);
con313d303B02 = imtophat(con313d303Bmed,SE50);
con313d303Bcom = imcomplement(con313d303B02);
con313d303B03 = medfilt2(con313d303Bcom,[3,3]);
con313d303B04 = imcomplement(con313d303B03); % DAPI(B): pre1

%con313d303H_Hfos (R)
con313d303H01 = imtophat(con313d303H, SE50);
con313d303Hcom = imcomplement(con313d303H01);
con313d303H02 = medfilt2(con313d303Hcom, [3,3]);
con313d303H03 = imcomplement(con313d303H02);
con313d303H03_T105 = con313d303H03 > 90; % H1a_fosi % T change <------------
con313d303B04_T120 = con313d303B04 > 120; % DAPI(B): pre2a
con313d303Hfos1 = imfuse(con313d303H03_T105, con313d303B04_T120, 'blend');
con313d303Hfos2 = con313d303Hfos1 > 140; % H1a_fosi (R): final
con313d303HB1 = imfuse(con313d303Hfos2, con313d303B04,'Colorchannel',[1 0 2]);

%con313d303F_Ffos (G)
con313d303F01 = imtophat(con313d303F, SE50);
con313d303Fcom = imcomplement(con313d303F01);
con313d303F02 = medfilt2(con313d303Fcom, [3,3]);
con313d303F03 = imcomplement(con313d303F02);
con313d303F03_T105 = con313d303F03 > 85; % Fos_fosi % T change <------------
con313d303B04_T120 = con313d303B04 > 120; % DAPI(B): pre2a
con313d303Ffos1 = imfuse(con313d303F03_T105, con313d303B04_T120, 'blend');
con313d303Ffos2 = con313d303Ffos1 > 140; % Fos_fosi (G): final
con313d303HFB2 = imoverlay(con313d303HB1,con313d303Ffos2,"green");
imwrite(con313d303HFB2, 'con313d303HFB2.tif');



%% con313d304

%con313d304B (B)
SE50 = strel('square',50);
con313d304B01 = imtophat(con313d304B, SE50);
con313d304Baht = adapthisteq(con313d304B01);
%avg = ones(3,3)/9;
con313d304Bmed = medfilt2(con313d304Baht,[3,3]);
con313d304B02 = imtophat(con313d304Bmed,SE50);
con313d304Bcom = imcomplement(con313d304B02);
con313d304B03 = medfilt2(con313d304Bcom,[3,3]);
con313d304B04 = imcomplement(con313d304B03); % DAPI(B): pre1

%con313d304H_Hfos (R)
con313d304H01 = imtophat(con313d304H, SE50);
con313d304Hcom = imcomplement(con313d304H01);
con313d304H02 = medfilt2(con313d304Hcom, [3,3]);
con313d304H03 = imcomplement(con313d304H02);
con313d304H03_T105 = con313d304H03 > 90; % H1a_fosi % T change <------------
con313d304B04_T120 = con313d304B04 > 120; % DAPI(B): pre2a
con313d304Hfos1 = imfuse(con313d304H03_T105, con313d304B04_T120, 'blend');
con313d304Hfos2 = con313d304Hfos1 > 140; % H1a_fosi (R): final
con313d304HB1 = imfuse(con313d304Hfos2, con313d304B04,'Colorchannel',[1 0 2]);

%con313d304F_Ffos (G)
con313d304F01 = imtophat(con313d304F, SE50);
con313d304Fcom = imcomplement(con313d304F01);
con313d304F02 = medfilt2(con313d304Fcom, [3,3]);
con313d304F03 = imcomplement(con313d304F02);
con313d304F03_T105 = con313d304F03 > 85; % Fos_fosi % T change <------------
con313d304B04_T120 = con313d304B04 > 120; % DAPI(B): pre2a
con313d304Ffos1 = imfuse(con313d304F03_T105, con313d304B04_T120, 'blend');
con313d304Ffos2 = con313d304Ffos1 > 140; % Fos_fosi (G): final
con313d304HFB2 = imoverlay(con313d304HB1,con313d304Ffos2,"green");
imwrite(con313d304HFB2, 'con313d304HFB2.tif');




%% con313d305

%con313d305B (B)
SE50 = strel('square',50);
con313d305B01 = imtophat(con313d305B, SE50);
con313d305Baht = adapthisteq(con313d305B01);
%avg = ones(3,3)/9;
con313d305Bmed = medfilt2(con313d305Baht,[3,3]);
con313d305B02 = imtophat(con313d305Bmed,SE50);
con313d305Bcom = imcomplement(con313d305B02);
con313d305B03 = medfilt2(con313d305Bcom,[3,3]);
con313d305B04 = imcomplement(con313d305B03); % DAPI(B): pre1

%con313d305H_Hfos (R)
con313d305H01 = imtophat(con313d305H, SE50);
con313d305Hcom = imcomplement(con313d305H01);
con313d305H02 = medfilt2(con313d305Hcom, [3,3]);
con313d305H03 = imcomplement(con313d305H02);
con313d305H03_T105 = con313d305H03 > 90; % H1a_fosi % T change <------------
con313d305B04_T120 = con313d305B04 > 120; % DAPI(B): pre2a
con313d305Hfos1 = imfuse(con313d305H03_T105, con313d305B04_T120, 'blend');
con313d305Hfos2 = con313d305Hfos1 > 140; % H1a_fosi (R): final
con313d305HB1 = imfuse(con313d305Hfos2, con313d305B04,'Colorchannel',[1 0 2]);

%con313d305F_Ffos (G)
con313d305F01 = imtophat(con313d305F, SE50);
con313d305Fcom = imcomplement(con313d305F01);
con313d305F02 = medfilt2(con313d305Fcom, [3,3]);
con313d305F03 = imcomplement(con313d305F02);
con313d305F03_T105 = con313d305F03 > 85; % Fos_fosi % T change <------------
con313d305B04_T120 = con313d305B04 > 120; % DAPI(B): pre2a
con313d305Ffos1 = imfuse(con313d305F03_T105, con313d305B04_T120, 'blend');
con313d305Ffos2 = con313d305Ffos1 > 140; % Fos_fosi (G): final
con313d305HFB2 = imoverlay(con313d305HB1,con313d305Ffos2,"green");
imwrite(con313d305HFB2, 'con313d305HFB2.tif');

