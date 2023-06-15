%% Arc catFISH 

con01d301B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d301B0.jpg');
con01d301R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d301R0.jpg');
con01d302B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d302B0.jpg');
con01d302R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d302R0.jpg');
con01d303B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d303B0.jpg');
con01d303R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con01d303R0.jpg');


con01d301R = con01d301R0(:,:,1);
con01d301B = con01d301B0(:,:,3);
con01d302R = con01d302R0(:,:,1);
con01d302B = con01d302B0(:,:,3);
con01d303R = con01d303R0(:,:,1);
con01d303B = con01d303B0(:,:,3);



%% con01d301

%con01d301B (B)
SE50 = strel('square',50);
con01d301B01 = imtophat(con01d301B, SE50);
con01d301Baht = adapthisteq(con01d301B01);
avg = ones(3,3)/9;
con01d301Bmed = medfilt2(con01d301Baht,[3,3]);
con01d301B02 = imtophat(con01d301Bmed,SE50);
con01d301Bcom = imcomplement(con01d301B02);
con01d301B03 = medfilt2(con01d301Bcom,[3,3]);
con01d301B04 = imcomplement(con01d301B03); % DAPI(B): pre1

%con01d301R_Afos (R)
con01d301R01 = imtophat(con01d301R, SE50);
con01d301Rcom = imcomplement(con01d301R01);
con01d301R02 = medfilt2(con01d301Rcom, [3,3]);
con01d301R03 = imcomplement(con01d301R02);
con01d301R03_T120 = con01d301R03 > 105; % Arc_fosi % T105 <------------

con01d301B04_T120 = con01d301B04 > 120; % DAPI(B): pre2a
con01d301Afos1 = imfuse(con01d301R03_T120, con01d301B04_T120, 'blend');
con01d301Afos2 = con01d301Afos1 > 140; % Arc_fosi(R): final

%con01d301R_Acyt (R)
con01d301R03_T100 = con01d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con01d301Bdil1 = imdilate(con01d301B04, s);
con01d301Bdil2 = imfuse(con01d301Bdil1, con01d301B04, 'diff'); 
con01d301Bdil2_T30 = con01d301Bdil2 > 30; % DAPI(B): pre2b
con01d301Acyt1 = imfuse(con01d301R03_T100, con01d301Bdil2_T30, 'blend');
con01d301Acyt2 = con01d301Acyt1 > 140;
con01d301Acyt3 = bwareaopen(con01d301Acyt2, 3); % Arc_cytoplasm(R): final
con01d301Arc1 = imfuse(con01d301Afos2, con01d301Acyt3, 'blend');
con01d301Arc2 = con01d301Arc1 > 0;
con01d301Arc3 = imfuse(con01d301Arc2, con01d301Afos2, 'blend');
con01d301Arc4 = imfuse(con01d301Arc3, con01d301B04,'Colorchannel',[1 0 2]);
imwrite(con01d301Arc4, 'con01d301Arc.tif');





%% con01d302

%con01d302B (B)

con01d302B01 = imtophat(con01d302B, SE50);
con01d302Baht = adapthisteq(con01d302B01);

con01d302Bmed = medfilt2(con01d302Baht,[3,3]);
con01d302B02 = imtophat(con01d302Bmed,SE50);
con01d302Bcom = imcomplement(con01d302B02);
con01d302B03 = medfilt2(con01d302Bcom,[3,3]);
con01d302B04 = imcomplement(con01d302B03); % DAPI(B): pre1

%con01d302R_Afos (R)
con01d302R01 = imtophat(con01d302R, SE50);
con01d302Rcom = imcomplement(con01d302R01);
con01d302R02 = medfilt2(con01d302Rcom, [3,3]);
con01d302R03 = imcomplement(con01d302R02);
con01d302R03_T120 = con01d302R03 > 105; % Arc_fosi % T105 <------------

con01d302B04_T120 = con01d302B04 > 120; % DAPI(B): pre2a
con01d302Afos1 = imfuse(con01d302R03_T120, con01d302B04_T120, 'blend');
con01d302Afos2 = con01d302Afos1 > 140; % Arc_fosi(R): final

%con01d302R_Acyt (R)
con01d302R03_T100 = con01d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con01d302Bdil1 = imdilate(con01d302B04, s);
con01d302Bdil2 = imfuse(con01d302Bdil1, con01d302B04, 'diff'); 
con01d302Bdil2_T30 = con01d302Bdil2 > 30; % DAPI(B): pre2b
con01d302Acyt1 = imfuse(con01d302R03_T100, con01d302Bdil2_T30, 'blend');
con01d302Acyt2 = con01d302Acyt1 > 140;
con01d302Acyt3 = bwareaopen(con01d302Acyt2, 3); % Arc_cytoplasm(R): final
con01d302Arc1 = imfuse(con01d302Afos2, con01d302Acyt3, 'blend');
con01d302Arc2 = con01d302Arc1 > 0;
con01d302Arc3 = imfuse(con01d302Arc2, con01d302Afos2, 'blend');
con01d302Arc4 = imfuse(con01d302Arc3, con01d302B04,'Colorchannel',[1 0 2]);
imwrite(con01d302Arc4, 'con01d302Arc.tif');




%% con01d303

%con01d303B (B)

con01d303B01 = imtophat(con01d303B, SE50);
con01d303Baht = adapthisteq(con01d303B01);

con01d303Bmed = medfilt2(con01d303Baht,[3,3]);
con01d303B02 = imtophat(con01d303Bmed,SE50);
con01d303Bcom = imcomplement(con01d303B02);
con01d303B03 = medfilt2(con01d303Bcom,[3,3]);
con01d303B04 = imcomplement(con01d303B03); % DAPI(B): pre1

%con01d303R_Afos (R)
con01d303R01 = imtophat(con01d303R, SE50);
con01d303Rcom = imcomplement(con01d303R01);
con01d303R02 = medfilt2(con01d303Rcom, [3,3]);
con01d303R03 = imcomplement(con01d303R02);
con01d303R03_T120 = con01d303R03 > 105; % Arc_fosi % T105 <------------

con01d303B04_T120 = con01d303B04 > 120; % DAPI(B): pre2a
con01d303Afos1 = imfuse(con01d303R03_T120, con01d303B04_T120, 'blend');
con01d303Afos2 = con01d303Afos1 > 140; % Arc_fosi(R): final

%con01d303R_Acyt (R)
con01d303R03_T100 = con01d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con01d303Bdil1 = imdilate(con01d303B04, s);
con01d303Bdil2 = imfuse(con01d303Bdil1, con01d303B04, 'diff'); 
con01d303Bdil2_T30 = con01d303Bdil2 > 30; % DAPI(B): pre2b
con01d303Acyt1 = imfuse(con01d303R03_T100, con01d303Bdil2_T30, 'blend');
con01d303Acyt2 = con01d303Acyt1 > 140;
con01d303Acyt3 = bwareaopen(con01d303Acyt2, 3); % Arc_cytoplasm(R): final
con01d303Arc1 = imfuse(con01d303Afos2, con01d303Acyt3, 'blend');
con01d303Arc2 = con01d303Arc1 > 0;
con01d303Arc3 = imfuse(con01d303Arc2, con01d303Afos2, 'blend');
con01d303Arc4 = imfuse(con01d303Arc3, con01d303B04,'Colorchannel',[1 0 2]);
imwrite(con01d303Arc4, 'con01d303Arc.tif');



