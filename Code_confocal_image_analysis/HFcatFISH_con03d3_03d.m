%% H1a-Fos catFISH 

con03d301H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d301H0.jpg');
con03d301F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d301F0.jpg');
con03d301B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d301B0a.jpg');
con03d301B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d301B0b.jpg');
con03d301B0 = imfuse(con03d301B0a, con03d301B0b, 'blend');
con03d302H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d302H0.jpg');
con03d302F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d302F0.jpg');
con03d302B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d302B0a.jpg');
con03d302B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d302B0b.jpg');
con03d302B0 = imfuse(con03d302B0a, con03d302B0b, 'blend');
con03d303H0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d303H0.jpg');
con03d303F0 = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d303F0.jpg');
con03d303B0a = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d303B0a.jpg');
con03d303B0b = imread('G:\02.catFISH\03.proc_H1a3d,Fos_catFISH2\03.ana_seco\con03d303B0b.jpg');
con03d303B0 = imfuse(con03d303B0a, con03d303B0b, 'blend');

con03d301H = con03d301H0(:,:,1);
con03d301F = con03d301F0(:,:,2);
con03d301B = con03d301B0(:,:,3);
con03d302H = con03d302H0(:,:,1);
con03d302F = con03d302F0(:,:,2);
con03d302B = con03d302B0(:,:,3);
con03d303H = con03d303H0(:,:,1);
con03d303F = con03d303F0(:,:,2);
con03d303B = con03d303B0(:,:,3);


%% con03d301

%con03d301B (B)
SE50 = strel('square',50);
con03d301B01 = imtophat(con03d301B, SE50);
con03d301Baht = adapthisteq(con03d301B01);
avg = ones(3,3)/9;
con03d301Bmed = medfilt2(con03d301Baht,[3,3]);
con03d301B02 = imtophat(con03d301Bmed,SE50);
con03d301Bcom = imcomplement(con03d301B02);
con03d301B03 = medfilt2(con03d301Bcom,[3,3]);
con03d301B04 = imcomplement(con03d301B03); % DAPI(B): pre1

%con03d301H_Hfos (R)
con03d301H01 = imtophat(con03d301H, SE50);
con03d301Hcom = imcomplement(con03d301H01);
con03d301H02 = medfilt2(con03d301Hcom, [3,3]);
con03d301H03 = imcomplement(con03d301H02);
con03d301H03_T105 = con03d301H03 > 90; % H1a_fosi % T change <------------
con03d301B04_T120 = con03d301B04 > 120; % DAPI(B): pre2a
con03d301Hfos1 = imfuse(con03d301H03_T105, con03d301B04_T120, 'blend');
con03d301Hfos2 = con03d301Hfos1 > 140; % H1a_fosi (R): final
con03d301HB1 = imfuse(con03d301Hfos2, con03d301B04,'Colorchannel',[1 0 2]);

%con03d301F_Ffos (G)
con03d301F01 = imtophat(con03d301F, SE50);
con03d301Fcom = imcomplement(con03d301F01);
con03d301F02 = medfilt2(con03d301Fcom, [3,3]);
con03d301F03 = imcomplement(con03d301F02);
con03d301F03_T105 = con03d301F03 > 85; % Fos_fosi % T change <------------
con03d301B04_T120 = con03d301B04 > 120; % DAPI(B): pre2a
con03d301Ffos1 = imfuse(con03d301F03_T105, con03d301B04_T120, 'blend');
con03d301Ffos2 = con03d301Ffos1 > 140; % Fos_fosi (G): final
con03d301HFB2 = imoverlay(con03d301HB1,con03d301Ffos2,"green");
imwrite(con03d301HFB2, 'con03d301HFB2.tif');



%% con03d302

%con03d302B (B)
SE50 = strel('square',50);
con03d302B01 = imtophat(con03d302B, SE50);
con03d302Baht = adapthisteq(con03d302B01);
%avg = ones(3,3)/9;
con03d302Bmed = medfilt2(con03d302Baht,[3,3]);
con03d302B02 = imtophat(con03d302Bmed,SE50);
con03d302Bcom = imcomplement(con03d302B02);
con03d302B03 = medfilt2(con03d302Bcom,[3,3]);
con03d302B04 = imcomplement(con03d302B03); % DAPI(B): pre1

%con03d302H_Hfos (R)
con03d302H01 = imtophat(con03d302H, SE50);
con03d302Hcom = imcomplement(con03d302H01);
con03d302H02 = medfilt2(con03d302Hcom, [3,3]);
con03d302H03 = imcomplement(con03d302H02);
con03d302H03_T105 = con03d302H03 > 90; % H1a_fosi % T change <------------
con03d302B04_T120 = con03d302B04 > 120; % DAPI(B): pre2a
con03d302Hfos1 = imfuse(con03d302H03_T105, con03d302B04_T120, 'blend');
con03d302Hfos2 = con03d302Hfos1 > 140; % H1a_fosi (R): final
con03d302HB1 = imfuse(con03d302Hfos2, con03d302B04,'Colorchannel',[1 0 2]);

%con03d302F_Ffos (G)
con03d302F01 = imtophat(con03d302F, SE50);
con03d302Fcom = imcomplement(con03d302F01);
con03d302F02 = medfilt2(con03d302Fcom, [3,3]);
con03d302F03 = imcomplement(con03d302F02);
con03d302F03_T105 = con03d302F03 > 85; % Fos_fosi % T change <------------
con03d302B04_T120 = con03d302B04 > 120; % DAPI(B): pre2a
con03d302Ffos1 = imfuse(con03d302F03_T105, con03d302B04_T120, 'blend');
con03d302Ffos2 = con03d302Ffos1 > 140; % Fos_fosi (G): final
con03d302HFB2 = imoverlay(con03d302HB1,con03d302Ffos2,"green");
imwrite(con03d302HFB2, 'con03d302HFB2.tif');



%% con03d303

%con03d303B (B)
SE50 = strel('square',50);
con03d303B01 = imtophat(con03d303B, SE50);
con03d303Baht = adapthisteq(con03d303B01);
%avg = ones(3,3)/9;
con03d303Bmed = medfilt2(con03d303Baht,[3,3]);
con03d303B02 = imtophat(con03d303Bmed,SE50);
con03d303Bcom = imcomplement(con03d303B02);
con03d303B03 = medfilt2(con03d303Bcom,[3,3]);
con03d303B04 = imcomplement(con03d303B03); % DAPI(B): pre1

%con03d303H_Hfos (R)
con03d303H01 = imtophat(con03d303H, SE50);
con03d303Hcom = imcomplement(con03d303H01);
con03d303H02 = medfilt2(con03d303Hcom, [3,3]);
con03d303H03 = imcomplement(con03d303H02);
con03d303H03_T105 = con03d303H03 > 90; % H1a_fosi % T change <------------
con03d303B04_T120 = con03d303B04 > 120; % DAPI(B): pre2a
con03d303Hfos1 = imfuse(con03d303H03_T105, con03d303B04_T120, 'blend');
con03d303Hfos2 = con03d303Hfos1 > 140; % H1a_fosi (R): final
con03d303HB1 = imfuse(con03d303Hfos2, con03d303B04,'Colorchannel',[1 0 2]);

%con03d303F_Ffos (G)
con03d303F01 = imtophat(con03d303F, SE50);
con03d303Fcom = imcomplement(con03d303F01);
con03d303F02 = medfilt2(con03d303Fcom, [3,3]);
con03d303F03 = imcomplement(con03d303F02);
con03d303F03_T105 = con03d303F03 > 85; % Fos_fosi % T change <------------
con03d303B04_T120 = con03d303B04 > 120; % DAPI(B): pre2a
con03d303Ffos1 = imfuse(con03d303F03_T105, con03d303B04_T120, 'blend');
con03d303Ffos2 = con03d303Ffos1 > 140; % Fos_fosi (G): final
con03d303HFB2 = imoverlay(con03d303HB1,con03d303Ffos2,"green");
imwrite(con03d303HFB2, 'con03d303HFB2.tif');



