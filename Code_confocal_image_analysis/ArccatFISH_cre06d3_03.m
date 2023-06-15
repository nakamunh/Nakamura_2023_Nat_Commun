%% Arc catFISH 

cre06d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d301B0.jpg');
cre06d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d301R0.jpg');
cre06d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d302B0.jpg');
cre06d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d302R0.jpg');
cre06d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d303B0.jpg');
cre06d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d303R0.jpg');
cre06d304B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d304B0.jpg');
cre06d304R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre06d304R0.jpg');

cre06d301R = cre06d301R0(:,:,1);
cre06d301B = cre06d301B0(:,:,3);
cre06d302R = cre06d302R0(:,:,1);
cre06d302B = cre06d302B0(:,:,3);
cre06d303R = cre06d303R0(:,:,1);
cre06d303B = cre06d303B0(:,:,3);
cre06d304R = cre06d304R0(:,:,1);
cre06d304B = cre06d304B0(:,:,3);


%% cre06d301

%cre06d301B (B)
SE50 = strel('square',50);
cre06d301B01 = imtophat(cre06d301B, SE50);
cre06d301Baht = adapthisteq(cre06d301B01);
avg = ones(3,3)/9;
cre06d301Bmed = medfilt2(cre06d301Baht,[3,3]);
cre06d301B02 = imtophat(cre06d301Bmed,SE50);
cre06d301Bcom = imcomplement(cre06d301B02);
cre06d301B03 = medfilt2(cre06d301Bcom,[3,3]);
cre06d301B04 = imcomplement(cre06d301B03); % DAPI(B): pre1

%cre06d301R_Afos (R)
cre06d301R01 = imtophat(cre06d301R, SE50);
cre06d301Rcom = imcomplement(cre06d301R01);
cre06d301R02 = medfilt2(cre06d301Rcom, [3,3]);
cre06d301R03 = imcomplement(cre06d301R02);
cre06d301R03_T120 = cre06d301R03 > 105; % Arc_fosi % T105 <------------

cre06d301B04_T120 = cre06d301B04 > 120; % DAPI(B): pre2a
cre06d301Afos1 = imfuse(cre06d301R03_T120, cre06d301B04_T120, 'blend');
cre06d301Afos2 = cre06d301Afos1 > 140; % Arc_fosi(R): final

%cre06d301R_Acyt (R)
cre06d301R03_T100 = cre06d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre06d301Bdil1 = imdilate(cre06d301B04, s);
cre06d301Bdil2 = imfuse(cre06d301Bdil1, cre06d301B04, 'diff'); 
cre06d301Bdil2_T30 = cre06d301Bdil2 > 30; % DAPI(B): pre2b
cre06d301Acyt1 = imfuse(cre06d301R03_T100, cre06d301Bdil2_T30, 'blend');
cre06d301Acyt2 = cre06d301Acyt1 > 140;
cre06d301Acyt3 = bwareaopen(cre06d301Acyt2, 3); % Arc_cytoplasm(R): final
cre06d301Arc1 = imfuse(cre06d301Afos2, cre06d301Acyt3, 'blend');
cre06d301Arc2 = cre06d301Arc1 > 0;
cre06d301Arc3 = imfuse(cre06d301Arc2, cre06d301Afos2, 'blend');
cre06d301Arc4 = imfuse(cre06d301Arc3, cre06d301B04,'Colorchannel',[1 0 2]);
imwrite(cre06d301Arc4, 'cre06d301Arc.tif');




%% cre06d302

%cre06d302B (B)

cre06d302B01 = imtophat(cre06d302B, SE50);
cre06d302Baht = adapthisteq(cre06d302B01);

cre06d302Bmed = medfilt2(cre06d302Baht,[3,3]);
cre06d302B02 = imtophat(cre06d302Bmed,SE50);
cre06d302Bcom = imcomplement(cre06d302B02);
cre06d302B03 = medfilt2(cre06d302Bcom,[3,3]);
cre06d302B04 = imcomplement(cre06d302B03); % DAPI(B): pre1

%cre06d302R_Afos (R)
cre06d302R01 = imtophat(cre06d302R, SE50);
cre06d302Rcom = imcomplement(cre06d302R01);
cre06d302R02 = medfilt2(cre06d302Rcom, [3,3]);
cre06d302R03 = imcomplement(cre06d302R02);
cre06d302R03_T120 = cre06d302R03 > 105; % Arc_fosi % T105 <------------

cre06d302B04_T120 = cre06d302B04 > 120; % DAPI(B): pre2a
cre06d302Afos1 = imfuse(cre06d302R03_T120, cre06d302B04_T120, 'blend');
cre06d302Afos2 = cre06d302Afos1 > 140; % Arc_fosi(R): final

%cre06d302R_Acyt (R)
cre06d302R03_T100 = cre06d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre06d302Bdil1 = imdilate(cre06d302B04, s);
cre06d302Bdil2 = imfuse(cre06d302Bdil1, cre06d302B04, 'diff'); 
cre06d302Bdil2_T30 = cre06d302Bdil2 > 30; % DAPI(B): pre2b
cre06d302Acyt1 = imfuse(cre06d302R03_T100, cre06d302Bdil2_T30, 'blend');
cre06d302Acyt2 = cre06d302Acyt1 > 140;
cre06d302Acyt3 = bwareaopen(cre06d302Acyt2, 3); % Arc_cytoplasm(R): final
cre06d302Arc1 = imfuse(cre06d302Afos2, cre06d302Acyt3, 'blend');
cre06d302Arc2 = cre06d302Arc1 > 0;
cre06d302Arc3 = imfuse(cre06d302Arc2, cre06d302Afos2, 'blend');
cre06d302Arc4 = imfuse(cre06d302Arc3, cre06d302B04,'Colorchannel',[1 0 2]);
imwrite(cre06d302Arc4, 'cre06d302Arc.tif');




%% cre06d303

%cre06d303B (B)

cre06d303B01 = imtophat(cre06d303B, SE50);
cre06d303Baht = adapthisteq(cre06d303B01);

cre06d303Bmed = medfilt2(cre06d303Baht,[3,3]);
cre06d303B02 = imtophat(cre06d303Bmed,SE50);
cre06d303Bcom = imcomplement(cre06d303B02);
cre06d303B03 = medfilt2(cre06d303Bcom,[3,3]);
cre06d303B04 = imcomplement(cre06d303B03); % DAPI(B): pre1

%cre06d303R_Afos (R)
cre06d303R01 = imtophat(cre06d303R, SE50);
cre06d303Rcom = imcomplement(cre06d303R01);
cre06d303R02 = medfilt2(cre06d303Rcom, [3,3]);
cre06d303R03 = imcomplement(cre06d303R02);
cre06d303R03_T120 = cre06d303R03 > 105; % Arc_fosi % T105 <------------

cre06d303B04_T120 = cre06d303B04 > 120; % DAPI(B): pre2a
cre06d303Afos1 = imfuse(cre06d303R03_T120, cre06d303B04_T120, 'blend');
cre06d303Afos2 = cre06d303Afos1 > 140; % Arc_fosi(R): final

%cre06d303R_Acyt (R)
cre06d303R03_T100 = cre06d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre06d303Bdil1 = imdilate(cre06d303B04, s);
cre06d303Bdil2 = imfuse(cre06d303Bdil1, cre06d303B04, 'diff'); 
cre06d303Bdil2_T30 = cre06d303Bdil2 > 30; % DAPI(B): pre2b
cre06d303Acyt1 = imfuse(cre06d303R03_T100, cre06d303Bdil2_T30, 'blend');
cre06d303Acyt2 = cre06d303Acyt1 > 140;
cre06d303Acyt3 = bwareaopen(cre06d303Acyt2, 3); % Arc_cytoplasm(R): final
cre06d303Arc1 = imfuse(cre06d303Afos2, cre06d303Acyt3, 'blend');
cre06d303Arc2 = cre06d303Arc1 > 0;
cre06d303Arc3 = imfuse(cre06d303Arc2, cre06d303Afos2, 'blend');
cre06d303Arc4 = imfuse(cre06d303Arc3, cre06d303B04,'Colorchannel',[1 0 2]);
imwrite(cre06d303Arc4, 'cre06d303Arc.tif');



%% cre06d304

%cre06d304B (B)

cre06d304B01 = imtophat(cre06d304B, SE50);
cre06d304Baht = adapthisteq(cre06d304B01);

cre06d304Bmed = medfilt2(cre06d304Baht,[3,3]);
cre06d304B02 = imtophat(cre06d304Bmed,SE50);
cre06d304Bcom = imcomplement(cre06d304B02);
cre06d304B03 = medfilt2(cre06d304Bcom,[3,3]);
cre06d304B04 = imcomplement(cre06d304B03); % DAPI(B): pre1

%cre06d304R_Afos (R)
cre06d304R01 = imtophat(cre06d304R, SE50);
cre06d304Rcom = imcomplement(cre06d304R01);
cre06d304R02 = medfilt2(cre06d304Rcom, [3,3]);
cre06d304R03 = imcomplement(cre06d304R02);
cre06d304R03_T120 = cre06d304R03 > 105; % Arc_fosi % T105 <------------

cre06d304B04_T120 = cre06d304B04 > 120; % DAPI(B): pre2a
cre06d304Afos1 = imfuse(cre06d304R03_T120, cre06d304B04_T120, 'blend');
cre06d304Afos2 = cre06d304Afos1 > 140; % Arc_fosi(R): final

%cre06d304R_Acyt (R)
cre06d304R03_T100 = cre06d304R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre06d304Bdil1 = imdilate(cre06d304B04, s);
cre06d304Bdil2 = imfuse(cre06d304Bdil1, cre06d304B04, 'diff'); 
cre06d304Bdil2_T30 = cre06d304Bdil2 > 30; % DAPI(B): pre2b
cre06d304Acyt1 = imfuse(cre06d304R03_T100, cre06d304Bdil2_T30, 'blend');
cre06d304Acyt2 = cre06d304Acyt1 > 140;
cre06d304Acyt3 = bwareaopen(cre06d304Acyt2, 3); % Arc_cytoplasm(R): final
cre06d304Arc1 = imfuse(cre06d304Afos2, cre06d304Acyt3, 'blend');
cre06d304Arc2 = cre06d304Arc1 > 0;
cre06d304Arc3 = imfuse(cre06d304Arc2, cre06d304Afos2, 'blend');
cre06d304Arc4 = imfuse(cre06d304Arc3, cre06d304B04,'Colorchannel',[1 0 2]);
imwrite(cre06d304Arc4, 'cre06d304Arc.tif');


