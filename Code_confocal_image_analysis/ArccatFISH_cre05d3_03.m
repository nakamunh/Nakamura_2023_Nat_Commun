%% Arc catFISH 

cre05d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d301B0.jpg');
cre05d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d301R0.jpg');
cre05d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d302B0.jpg');
cre05d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d302R0.jpg');
cre05d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d303B0.jpg');
cre05d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d303R0.jpg');
cre05d304B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d304B0.jpg');
cre05d304R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre05d304R0.jpg');

cre05d301R = cre05d301R0(:,:,1);
cre05d301B = cre05d301B0(:,:,3);
cre05d302R = cre05d302R0(:,:,1);
cre05d302B = cre05d302B0(:,:,3);
cre05d303R = cre05d303R0(:,:,1);
cre05d303B = cre05d303B0(:,:,3);
cre05d304R = cre05d304R0(:,:,1);
cre05d304B = cre05d304B0(:,:,3);

%% cre05d301

%cre05d301B (B)
SE50 = strel('square',50);
cre05d301B01 = imtophat(cre05d301B, SE50);
cre05d301Baht = adapthisteq(cre05d301B01);
avg = ones(3,3)/9;
cre05d301Bmed = medfilt2(cre05d301Baht,[3,3]);
cre05d301B02 = imtophat(cre05d301Bmed,SE50);
cre05d301Bcom = imcomplement(cre05d301B02);
cre05d301B03 = medfilt2(cre05d301Bcom,[3,3]);
cre05d301B04 = imcomplement(cre05d301B03); % DAPI(B): pre1

%cre05d301R_Afos (R)
cre05d301R01 = imtophat(cre05d301R, SE50);
cre05d301Rcom = imcomplement(cre05d301R01);
cre05d301R02 = medfilt2(cre05d301Rcom, [3,3]);
cre05d301R03 = imcomplement(cre05d301R02);
cre05d301R03_T120 = cre05d301R03 > 105; % Arc_fosi % T105 <------------

cre05d301B04_T120 = cre05d301B04 > 120; % DAPI(B): pre2a
cre05d301Afos1 = imfuse(cre05d301R03_T120, cre05d301B04_T120, 'blend');
cre05d301Afos2 = cre05d301Afos1 > 140; % Arc_fosi(R): final

%cre05d301R_Acyt (R)
cre05d301R03_T100 = cre05d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre05d301Bdil1 = imdilate(cre05d301B04, s);
cre05d301Bdil2 = imfuse(cre05d301Bdil1, cre05d301B04, 'diff'); 
cre05d301Bdil2_T30 = cre05d301Bdil2 > 30; % DAPI(B): pre2b
cre05d301Acyt1 = imfuse(cre05d301R03_T100, cre05d301Bdil2_T30, 'blend');
cre05d301Acyt2 = cre05d301Acyt1 > 140;
cre05d301Acyt3 = bwareaopen(cre05d301Acyt2, 3); % Arc_cytoplasm(R): final
cre05d301Arc1 = imfuse(cre05d301Afos2, cre05d301Acyt3, 'blend');
cre05d301Arc2 = cre05d301Arc1 > 0;
cre05d301Arc3 = imfuse(cre05d301Arc2, cre05d301Afos2, 'blend');
cre05d301Arc4 = imfuse(cre05d301Arc3, cre05d301B04,'Colorchannel',[1 0 2]);
imwrite(cre05d301Arc4, 'cre05d301Arc.tif');



%% cre05d302

%cre05d302B (B)

cre05d302B01 = imtophat(cre05d302B, SE50);
cre05d302Baht = adapthisteq(cre05d302B01);

cre05d302Bmed = medfilt2(cre05d302Baht,[3,3]);
cre05d302B02 = imtophat(cre05d302Bmed,SE50);
cre05d302Bcom = imcomplement(cre05d302B02);
cre05d302B03 = medfilt2(cre05d302Bcom,[3,3]);
cre05d302B04 = imcomplement(cre05d302B03); % DAPI(B): pre1

%cre05d302R_Afos (R)
cre05d302R01 = imtophat(cre05d302R, SE50);
cre05d302Rcom = imcomplement(cre05d302R01);
cre05d302R02 = medfilt2(cre05d302Rcom, [3,3]);
cre05d302R03 = imcomplement(cre05d302R02);
cre05d302R03_T120 = cre05d302R03 > 105; % Arc_fosi % T105 <------------

cre05d302B04_T120 = cre05d302B04 > 120; % DAPI(B): pre2a
cre05d302Afos1 = imfuse(cre05d302R03_T120, cre05d302B04_T120, 'blend');
cre05d302Afos2 = cre05d302Afos1 > 140; % Arc_fosi(R): final

%cre05d302R_Acyt (R)
cre05d302R03_T100 = cre05d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre05d302Bdil1 = imdilate(cre05d302B04, s);
cre05d302Bdil2 = imfuse(cre05d302Bdil1, cre05d302B04, 'diff'); 
cre05d302Bdil2_T30 = cre05d302Bdil2 > 30; % DAPI(B): pre2b
cre05d302Acyt1 = imfuse(cre05d302R03_T100, cre05d302Bdil2_T30, 'blend');
cre05d302Acyt2 = cre05d302Acyt1 > 140;
cre05d302Acyt3 = bwareaopen(cre05d302Acyt2, 3); % Arc_cytoplasm(R): final
cre05d302Arc1 = imfuse(cre05d302Afos2, cre05d302Acyt3, 'blend');
cre05d302Arc2 = cre05d302Arc1 > 0;
cre05d302Arc3 = imfuse(cre05d302Arc2, cre05d302Afos2, 'blend');
cre05d302Arc4 = imfuse(cre05d302Arc3, cre05d302B04,'Colorchannel',[1 0 2]);
imwrite(cre05d302Arc4, 'cre05d302Arc.tif');



%% cre05d303

%cre05d303B (B)

cre05d303B01 = imtophat(cre05d303B, SE50);
cre05d303Baht = adapthisteq(cre05d303B01);

cre05d303Bmed = medfilt2(cre05d303Baht,[3,3]);
cre05d303B02 = imtophat(cre05d303Bmed,SE50);
cre05d303Bcom = imcomplement(cre05d303B02);
cre05d303B03 = medfilt2(cre05d303Bcom,[3,3]);
cre05d303B04 = imcomplement(cre05d303B03); % DAPI(B): pre1

%cre05d303R_Afos (R)
cre05d303R01 = imtophat(cre05d303R, SE50);
cre05d303Rcom = imcomplement(cre05d303R01);
cre05d303R02 = medfilt2(cre05d303Rcom, [3,3]);
cre05d303R03 = imcomplement(cre05d303R02);
cre05d303R03_T120 = cre05d303R03 > 105; % Arc_fosi % T105 <------------

cre05d303B04_T120 = cre05d303B04 > 120; % DAPI(B): pre2a
cre05d303Afos1 = imfuse(cre05d303R03_T120, cre05d303B04_T120, 'blend');
cre05d303Afos2 = cre05d303Afos1 > 140; % Arc_fosi(R): final

%cre05d303R_Acyt (R)
cre05d303R03_T100 = cre05d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre05d303Bdil1 = imdilate(cre05d303B04, s);
cre05d303Bdil2 = imfuse(cre05d303Bdil1, cre05d303B04, 'diff'); 
cre05d303Bdil2_T30 = cre05d303Bdil2 > 30; % DAPI(B): pre2b
cre05d303Acyt1 = imfuse(cre05d303R03_T100, cre05d303Bdil2_T30, 'blend');
cre05d303Acyt2 = cre05d303Acyt1 > 140;
cre05d303Acyt3 = bwareaopen(cre05d303Acyt2, 3); % Arc_cytoplasm(R): final
cre05d303Arc1 = imfuse(cre05d303Afos2, cre05d303Acyt3, 'blend');
cre05d303Arc2 = cre05d303Arc1 > 0;
cre05d303Arc3 = imfuse(cre05d303Arc2, cre05d303Afos2, 'blend');
cre05d303Arc4 = imfuse(cre05d303Arc3, cre05d303B04,'Colorchannel',[1 0 2]);
imwrite(cre05d303Arc4, 'cre05d303Arc.tif');



%% cre05d304

%cre05d304B (B)

cre05d304B01 = imtophat(cre05d304B, SE50);
cre05d304Baht = adapthisteq(cre05d304B01);

cre05d304Bmed = medfilt2(cre05d304Baht,[3,3]);
cre05d304B02 = imtophat(cre05d304Bmed,SE50);
cre05d304Bcom = imcomplement(cre05d304B02);
cre05d304B03 = medfilt2(cre05d304Bcom,[3,3]);
cre05d304B04 = imcomplement(cre05d304B03); % DAPI(B): pre1

%cre05d304R_Afos (R)
cre05d304R01 = imtophat(cre05d304R, SE50);
cre05d304Rcom = imcomplement(cre05d304R01);
cre05d304R02 = medfilt2(cre05d304Rcom, [3,3]);
cre05d304R03 = imcomplement(cre05d304R02);
cre05d304R03_T120 = cre05d304R03 > 105; % Arc_fosi % T105 <------------

cre05d304B04_T120 = cre05d304B04 > 120; % DAPI(B): pre2a
cre05d304Afos1 = imfuse(cre05d304R03_T120, cre05d304B04_T120, 'blend');
cre05d304Afos2 = cre05d304Afos1 > 140; % Arc_fosi(R): final

%cre05d304R_Acyt (R)
cre05d304R03_T100 = cre05d304R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre05d304Bdil1 = imdilate(cre05d304B04, s);
cre05d304Bdil2 = imfuse(cre05d304Bdil1, cre05d304B04, 'diff'); 
cre05d304Bdil2_T30 = cre05d304Bdil2 > 30; % DAPI(B): pre2b
cre05d304Acyt1 = imfuse(cre05d304R03_T100, cre05d304Bdil2_T30, 'blend');
cre05d304Acyt2 = cre05d304Acyt1 > 140;
cre05d304Acyt3 = bwareaopen(cre05d304Acyt2, 3); % Arc_cytoplasm(R): final
cre05d304Arc1 = imfuse(cre05d304Afos2, cre05d304Acyt3, 'blend');
cre05d304Arc2 = cre05d304Arc1 > 0;
cre05d304Arc3 = imfuse(cre05d304Arc2, cre05d304Afos2, 'blend');
cre05d304Arc4 = imfuse(cre05d304Arc3, cre05d304B04,'Colorchannel',[1 0 2]);
imwrite(cre05d304Arc4, 'cre05d304Arc.tif');


