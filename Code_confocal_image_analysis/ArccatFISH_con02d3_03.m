%% Arc catFISH 

con02d301B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d301B0.jpg');
con02d301R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d301R0.jpg');
con02d302B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d302B0.jpg');
con02d302R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d302R0.jpg');
con02d303B0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d303B0.jpg');
con02d303R0 = imread('G:\02.catFISH\02.proc_catFISH\01.Arc1\05.con_dCA3\con02d303R0.jpg');


con02d301R = con02d301R0(:,:,1);
con02d301B = con02d301B0(:,:,3);
con02d302R = con02d302R0(:,:,1);
con02d302B = con02d302B0(:,:,3);
con02d303R = con02d303R0(:,:,1);
con02d303B = con02d303B0(:,:,3);



%% con02d301

%con02d301B (B)
SE50 = strel('square',50);
con02d301B01 = imtophat(con02d301B, SE50);
con02d301Baht = adapthisteq(con02d301B01);
avg = ones(3,3)/9;
con02d301Bmed = medfilt2(con02d301Baht,[3,3]);
con02d301B02 = imtophat(con02d301Bmed,SE50);
con02d301Bcom = imcomplement(con02d301B02);
con02d301B03 = medfilt2(con02d301Bcom,[3,3]);
con02d301B04 = imcomplement(con02d301B03); % DAPI(B): pre1

%con02d301R_Afos (R)
con02d301R01 = imtophat(con02d301R, SE50);
con02d301Rcom = imcomplement(con02d301R01);
con02d301R02 = medfilt2(con02d301Rcom, [3,3]);
con02d301R03 = imcomplement(con02d301R02);
con02d301R03_T120 = con02d301R03 > 105; % Arc_fosi % T105 <------------

con02d301B04_T120 = con02d301B04 > 120; % DAPI(B): pre2a
con02d301Afos1 = imfuse(con02d301R03_T120, con02d301B04_T120, 'blend');
con02d301Afos2 = con02d301Afos1 > 140; % Arc_fosi(R): final

%con02d301R_Acyt (R)
con02d301R03_T100 = con02d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con02d301Bdil1 = imdilate(con02d301B04, s);
con02d301Bdil2 = imfuse(con02d301Bdil1, con02d301B04, 'diff'); 
con02d301Bdil2_T30 = con02d301Bdil2 > 30; % DAPI(B): pre2b
con02d301Acyt1 = imfuse(con02d301R03_T100, con02d301Bdil2_T30, 'blend');
con02d301Acyt2 = con02d301Acyt1 > 140;
con02d301Acyt3 = bwareaopen(con02d301Acyt2, 3); % Arc_cytoplasm(R): final
con02d301Arc1 = imfuse(con02d301Afos2, con02d301Acyt3, 'blend');
con02d301Arc2 = con02d301Arc1 > 0;
con02d301Arc3 = imfuse(con02d301Arc2, con02d301Afos2, 'blend');
con02d301Arc4 = imfuse(con02d301Arc3, con02d301B04,'Colorchannel',[1 0 2]);
imwrite(con02d301Arc4, 'con02d301Arc.tif');





%% con02d302

%con02d302B (B)

con02d302B01 = imtophat(con02d302B, SE50);
con02d302Baht = adapthisteq(con02d302B01);

con02d302Bmed = medfilt2(con02d302Baht,[3,3]);
con02d302B02 = imtophat(con02d302Bmed,SE50);
con02d302Bcom = imcomplement(con02d302B02);
con02d302B03 = medfilt2(con02d302Bcom,[3,3]);
con02d302B04 = imcomplement(con02d302B03); % DAPI(B): pre1

%con02d302R_Afos (R)
con02d302R01 = imtophat(con02d302R, SE50);
con02d302Rcom = imcomplement(con02d302R01);
con02d302R02 = medfilt2(con02d302Rcom, [3,3]);
con02d302R03 = imcomplement(con02d302R02);
con02d302R03_T120 = con02d302R03 > 105; % Arc_fosi % T105 <------------

con02d302B04_T120 = con02d302B04 > 120; % DAPI(B): pre2a
con02d302Afos1 = imfuse(con02d302R03_T120, con02d302B04_T120, 'blend');
con02d302Afos2 = con02d302Afos1 > 140; % Arc_fosi(R): final

%con02d302R_Acyt (R)
con02d302R03_T100 = con02d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con02d302Bdil1 = imdilate(con02d302B04, s);
con02d302Bdil2 = imfuse(con02d302Bdil1, con02d302B04, 'diff'); 
con02d302Bdil2_T30 = con02d302Bdil2 > 30; % DAPI(B): pre2b
con02d302Acyt1 = imfuse(con02d302R03_T100, con02d302Bdil2_T30, 'blend');
con02d302Acyt2 = con02d302Acyt1 > 140;
con02d302Acyt3 = bwareaopen(con02d302Acyt2, 3); % Arc_cytoplasm(R): final
con02d302Arc1 = imfuse(con02d302Afos2, con02d302Acyt3, 'blend');
con02d302Arc2 = con02d302Arc1 > 0;
con02d302Arc3 = imfuse(con02d302Arc2, con02d302Afos2, 'blend');
con02d302Arc4 = imfuse(con02d302Arc3, con02d302B04,'Colorchannel',[1 0 2]);
imwrite(con02d302Arc4, 'con02d302Arc.tif');




%% con02d303

%con02d303B (B)

con02d303B01 = imtophat(con02d303B, SE50);
con02d303Baht = adapthisteq(con02d303B01);

con02d303Bmed = medfilt2(con02d303Baht,[3,3]);
con02d303B02 = imtophat(con02d303Bmed,SE50);
con02d303Bcom = imcomplement(con02d303B02);
con02d303B03 = medfilt2(con02d303Bcom,[3,3]);
con02d303B04 = imcomplement(con02d303B03); % DAPI(B): pre1

%con02d303R_Afos (R)
con02d303R01 = imtophat(con02d303R, SE50);
con02d303Rcom = imcomplement(con02d303R01);
con02d303R02 = medfilt2(con02d303Rcom, [3,3]);
con02d303R03 = imcomplement(con02d303R02);
con02d303R03_T120 = con02d303R03 > 105; % Arc_fosi % T105 <------------

con02d303B04_T120 = con02d303B04 > 120; % DAPI(B): pre2a
con02d303Afos1 = imfuse(con02d303R03_T120, con02d303B04_T120, 'blend');
con02d303Afos2 = con02d303Afos1 > 140; % Arc_fosi(R): final

%con02d303R_Acyt (R)
con02d303R03_T100 = con02d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
con02d303Bdil1 = imdilate(con02d303B04, s);
con02d303Bdil2 = imfuse(con02d303Bdil1, con02d303B04, 'diff'); 
con02d303Bdil2_T30 = con02d303Bdil2 > 30; % DAPI(B): pre2b
con02d303Acyt1 = imfuse(con02d303R03_T100, con02d303Bdil2_T30, 'blend');
con02d303Acyt2 = con02d303Acyt1 > 140;
con02d303Acyt3 = bwareaopen(con02d303Acyt2, 3); % Arc_cytoplasm(R): final
con02d303Arc1 = imfuse(con02d303Afos2, con02d303Acyt3, 'blend');
con02d303Arc2 = con02d303Arc1 > 0;
con02d303Arc3 = imfuse(con02d303Arc2, con02d303Afos2, 'blend');
con02d303Arc4 = imfuse(con02d303Arc3, con02d303B04,'Colorchannel',[1 0 2]);
imwrite(con02d303Arc4, 'con02d303Arc.tif');



