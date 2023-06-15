%% Arc catFISH 

con03d301B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d301B0.jpg');
con03d301R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d301R0.jpg');
con03d302B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d302B0.jpg');
con03d302R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d302R0.jpg');
con03d303B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d303B0.jpg');
con03d303R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d303R0.jpg');
con03d308B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d308B0.jpg');
con03d308R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con03d308R0.jpg');


con03d301R = con03d301R0(:,:,1);
con03d301B = con03d301B0(:,:,3);
con03d302R = con03d302R0(:,:,1);
con03d302B = con03d302B0(:,:,3);
con03d303R = con03d303R0(:,:,1);
con03d303B = con03d303B0(:,:,3);
con03d308R = con03d308R0(:,:,1);
con03d308B = con03d308B0(:,:,3);


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

%con03d301R_Afos (R)
con03d301R01 = imtophat(con03d301R, SE50);
con03d301Rcom = imcomplement(con03d301R01);
con03d301R02 = medfilt2(con03d301Rcom, [3,3]);
con03d301R03 = imcomplement(con03d301R02);
con03d301R03_T120 = con03d301R03 > 105; % Arc_fosi % T105 <------------

con03d301B04_T120 = con03d301B04 > 120; % DAPI(B): pre2a
con03d301Afos1 = imfuse(con03d301R03_T120, con03d301B04_T120, 'blend');
con03d301Afos2 = con03d301Afos1 > 140; % Arc_fosi(R): final

%con03d301R_Acyt (R)
con03d301R03_T100 = con03d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con03d301Bdil1 = imdilate(con03d301B04, s);
con03d301Bdil2 = imfuse(con03d301Bdil1, con03d301B04, 'diff'); 
con03d301Bdil2_T30 = con03d301Bdil2 > 30; % DAPI(B): pre2b
con03d301Acyt1 = imfuse(con03d301R03_T100, con03d301Bdil2_T30, 'blend');
con03d301Acyt2 = con03d301Acyt1 > 140;
con03d301Acyt3 = bwareaopen(con03d301Acyt2, 3); % Arc_cytoplasm(R): final
con03d301Arc1 = imfuse(con03d301Afos2, con03d301Acyt3, 'blend');
con03d301Arc2 = con03d301Arc1 > 0;
con03d301Arc3 = imfuse(con03d301Arc2, con03d301Afos2, 'blend');
con03d301Arc4 = imfuse(con03d301Arc3, con03d301B04,'Colorchannel',[1 0 2]);
imwrite(con03d301Arc4, 'con03d301Arc.tif');





%% con03d302

%con03d302B (B)

con03d302B01 = imtophat(con03d302B, SE50);
con03d302Baht = adapthisteq(con03d302B01);

con03d302Bmed = medfilt2(con03d302Baht,[3,3]);
con03d302B02 = imtophat(con03d302Bmed,SE50);
con03d302Bcom = imcomplement(con03d302B02);
con03d302B03 = medfilt2(con03d302Bcom,[3,3]);
con03d302B04 = imcomplement(con03d302B03); % DAPI(B): pre1

%con03d302R_Afos (R)
con03d302R01 = imtophat(con03d302R, SE50);
con03d302Rcom = imcomplement(con03d302R01);
con03d302R02 = medfilt2(con03d302Rcom, [3,3]);
con03d302R03 = imcomplement(con03d302R02);
con03d302R03_T120 = con03d302R03 > 105; % Arc_fosi % T105 <------------

con03d302B04_T120 = con03d302B04 > 120; % DAPI(B): pre2a
con03d302Afos1 = imfuse(con03d302R03_T120, con03d302B04_T120, 'blend');
con03d302Afos2 = con03d302Afos1 > 140; % Arc_fosi(R): final

%con03d302R_Acyt (R)
con03d302R03_T100 = con03d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con03d302Bdil1 = imdilate(con03d302B04, s);
con03d302Bdil2 = imfuse(con03d302Bdil1, con03d302B04, 'diff'); 
con03d302Bdil2_T30 = con03d302Bdil2 > 30; % DAPI(B): pre2b
con03d302Acyt1 = imfuse(con03d302R03_T100, con03d302Bdil2_T30, 'blend');
con03d302Acyt2 = con03d302Acyt1 > 140;
con03d302Acyt3 = bwareaopen(con03d302Acyt2, 3); % Arc_cytoplasm(R): final
con03d302Arc1 = imfuse(con03d302Afos2, con03d302Acyt3, 'blend');
con03d302Arc2 = con03d302Arc1 > 0;
con03d302Arc3 = imfuse(con03d302Arc2, con03d302Afos2, 'blend');
con03d302Arc4 = imfuse(con03d302Arc3, con03d302B04,'Colorchannel',[1 0 2]);
imwrite(con03d302Arc4, 'con03d302Arc.tif');




%% con03d303

%con03d303B (B)

con03d303B01 = imtophat(con03d303B, SE50);
con03d303Baht = adapthisteq(con03d303B01);

con03d303Bmed = medfilt2(con03d303Baht,[3,3]);
con03d303B02 = imtophat(con03d303Bmed,SE50);
con03d303Bcom = imcomplement(con03d303B02);
con03d303B03 = medfilt2(con03d303Bcom,[3,3]);
con03d303B04 = imcomplement(con03d303B03); % DAPI(B): pre1

%con03d303R_Afos (R)
con03d303R01 = imtophat(con03d303R, SE50);
con03d303Rcom = imcomplement(con03d303R01);
con03d303R02 = medfilt2(con03d303Rcom, [3,3]);
con03d303R03 = imcomplement(con03d303R02);
con03d303R03_T120 = con03d303R03 > 105; % Arc_fosi % T105 <------------

con03d303B04_T120 = con03d303B04 > 120; % DAPI(B): pre2a
con03d303Afos1 = imfuse(con03d303R03_T120, con03d303B04_T120, 'blend');
con03d303Afos2 = con03d303Afos1 > 140; % Arc_fosi(R): final

%con03d303R_Acyt (R)
con03d303R03_T100 = con03d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con03d303Bdil1 = imdilate(con03d303B04, s);
con03d303Bdil2 = imfuse(con03d303Bdil1, con03d303B04, 'diff'); 
con03d303Bdil2_T30 = con03d303Bdil2 > 30; % DAPI(B): pre2b
con03d303Acyt1 = imfuse(con03d303R03_T100, con03d303Bdil2_T30, 'blend');
con03d303Acyt2 = con03d303Acyt1 > 140;
con03d303Acyt3 = bwareaopen(con03d303Acyt2, 3); % Arc_cytoplasm(R): final
con03d303Arc1 = imfuse(con03d303Afos2, con03d303Acyt3, 'blend');
con03d303Arc2 = con03d303Arc1 > 0;
con03d303Arc3 = imfuse(con03d303Arc2, con03d303Afos2, 'blend');
con03d303Arc4 = imfuse(con03d303Arc3, con03d303B04,'Colorchannel',[1 0 2]);
imwrite(con03d303Arc4, 'con03d303Arc.tif');




%% con03d308

%con03d308B (B)

con03d308B01 = imtophat(con03d308B, SE50);
con03d308Baht = adapthisteq(con03d308B01);

con03d308Bmed = medfilt2(con03d308Baht,[3,3]);
con03d308B02 = imtophat(con03d308Bmed,SE50);
con03d308Bcom = imcomplement(con03d308B02);
con03d308B03 = medfilt2(con03d308Bcom,[3,3]);
con03d308B04 = imcomplement(con03d308B03); % DAPI(B): pre1

%con03d308R_Afos (R)
con03d308R01 = imtophat(con03d308R, SE50);
con03d308Rcom = imcomplement(con03d308R01);
con03d308R02 = medfilt2(con03d308Rcom, [3,3]);
con03d308R03 = imcomplement(con03d308R02);
con03d308R03_T120 = con03d308R03 > 105; % Arc_fosi % T105 <------------

con03d308B04_T120 = con03d308B04 > 120; % DAPI(B): pre2a
con03d308Afos1 = imfuse(con03d308R03_T120, con03d308B04_T120, 'blend');
con03d308Afos2 = con03d308Afos1 > 140; % Arc_fosi(R): final

%con03d308R_Acyt (R)
con03d308R03_T100 = con03d308R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con03d308Bdil1 = imdilate(con03d308B04, s);
con03d308Bdil2 = imfuse(con03d308Bdil1, con03d308B04, 'diff'); 
con03d308Bdil2_T30 = con03d308Bdil2 > 30; % DAPI(B): pre2b
con03d308Acyt1 = imfuse(con03d308R03_T100, con03d308Bdil2_T30, 'blend');
con03d308Acyt2 = con03d308Acyt1 > 140;
con03d308Acyt3 = bwareaopen(con03d308Acyt2, 3); % Arc_cytoplasm(R): final
con03d308Arc1 = imfuse(con03d308Afos2, con03d308Acyt3, 'blend');
con03d308Arc2 = con03d308Arc1 > 0;
con03d308Arc3 = imfuse(con03d308Arc2, con03d308Afos2, 'blend');
con03d308Arc4 = imfuse(con03d308Arc3, con03d308B04,'Colorchannel',[1 0 2]);
imwrite(con03d308Arc4, 'con03d308Arc.tif');
