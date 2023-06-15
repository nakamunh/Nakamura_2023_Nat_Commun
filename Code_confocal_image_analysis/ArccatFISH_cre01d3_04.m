%% Arc catFISH 

cre01d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d301B0.jpg');
cre01d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d301R0.jpg');
cre01d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d302B0.jpg');
cre01d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d302R0.jpg');
cre01d304B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d304B0.jpg');
cre01d304R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre01d304R0.jpg');

cre01d301R = cre01d301R0(:,:,1);
cre01d301B = cre01d301B0(:,:,3);
cre01d302R = cre01d302R0(:,:,1);
cre01d302B = cre01d302B0(:,:,3);
cre01d304R = cre01d304R0(:,:,1);
cre01d304B = cre01d304B0(:,:,3);


%% cre01d301

%cre01d301B (B)
SE50 = strel('square',50);
cre01d301B01 = imtophat(cre01d301B, SE50);
cre01d301Baht = adapthisteq(cre01d301B01);
avg = ones(3,3)/9;
cre01d301Bmed = medfilt2(cre01d301Baht,[3,3]);
cre01d301B02 = imtophat(cre01d301Bmed,SE50);
cre01d301Bcom = imcomplement(cre01d301B02);
cre01d301B03 = medfilt2(cre01d301Bcom,[3,3]);
cre01d301B04 = imcomplement(cre01d301B03); % DAPI(B): pre1

%cre01d301R_Afos (R)
cre01d301R01 = imtophat(cre01d301R, SE50);
cre01d301Rcom = imcomplement(cre01d301R01);
cre01d301R02 = medfilt2(cre01d301Rcom, [3,3]);
cre01d301R03 = imcomplement(cre01d301R02);
cre01d301R03_T120 = cre01d301R03 > 105; % Arc_fosi % T105 <------------

cre01d301B04_T120 = cre01d301B04 > 120; % DAPI(B): pre2a
cre01d301Afos1 = imfuse(cre01d301R03_T120, cre01d301B04_T120, 'blend');
cre01d301Afos2 = cre01d301Afos1 > 140; % Arc_fosi(R): final

%cre01d301R_Acyt (R)
cre01d301R03_T100 = cre01d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre01d301Bdil1 = imdilate(cre01d301B04, s);
cre01d301Bdil2 = imfuse(cre01d301Bdil1, cre01d301B04, 'diff'); 
cre01d301Bdil2_T30 = cre01d301Bdil2 > 30; % DAPI(B): pre2b
cre01d301Acyt1 = imfuse(cre01d301R03_T100, cre01d301Bdil2_T30, 'blend');
cre01d301Acyt2 = cre01d301Acyt1 > 140;
cre01d301Acyt3 = bwareaopen(cre01d301Acyt2, 3); % Arc_cytoplasm(R): final
cre01d301Arc1 = imfuse(cre01d301Afos2, cre01d301Acyt3, 'blend');
cre01d301Arc2 = cre01d301Arc1 > 0;
cre01d301Arc3 = imfuse(cre01d301Arc2, cre01d301Afos2, 'blend');
cre01d301Arc4 = imfuse(cre01d301Arc3, cre01d301B04,'Colorchannel',[1 0 2]);
imwrite(cre01d301Arc4, 'cre01d301Arc.tif');



%% cre01d302

%cre01d302B (B)

cre01d302B01 = imtophat(cre01d302B, SE50);
cre01d302Baht = adapthisteq(cre01d302B01);

cre01d302Bmed = medfilt2(cre01d302Baht,[3,3]);
cre01d302B02 = imtophat(cre01d302Bmed,SE50);
cre01d302Bcom = imcomplement(cre01d302B02);
cre01d302B03 = medfilt2(cre01d302Bcom,[3,3]);
cre01d302B04 = imcomplement(cre01d302B03); % DAPI(B): pre1

%cre01d302R_Afos (R)
cre01d302R01 = imtophat(cre01d302R, SE50);
cre01d302Rcom = imcomplement(cre01d302R01);
cre01d302R02 = medfilt2(cre01d302Rcom, [3,3]);
cre01d302R03 = imcomplement(cre01d302R02);
cre01d302R03_T120 = cre01d302R03 > 105; % Arc_fosi % T105 <------------

cre01d302B04_T120 = cre01d302B04 > 120; % DAPI(B): pre2a
cre01d302Afos1 = imfuse(cre01d302R03_T120, cre01d302B04_T120, 'blend');
cre01d302Afos2 = cre01d302Afos1 > 140; % Arc_fosi(R): final

%cre01d302R_Acyt (R)
cre01d302R03_T100 = cre01d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre01d302Bdil1 = imdilate(cre01d302B04, s);
cre01d302Bdil2 = imfuse(cre01d302Bdil1, cre01d302B04, 'diff'); 
cre01d302Bdil2_T30 = cre01d302Bdil2 > 30; % DAPI(B): pre2b
cre01d302Acyt1 = imfuse(cre01d302R03_T100, cre01d302Bdil2_T30, 'blend');
cre01d302Acyt2 = cre01d302Acyt1 > 140;
cre01d302Acyt3 = bwareaopen(cre01d302Acyt2, 3); % Arc_cytoplasm(R): final
cre01d302Arc1 = imfuse(cre01d302Afos2, cre01d302Acyt3, 'blend');
cre01d302Arc2 = cre01d302Arc1 > 0;
cre01d302Arc3 = imfuse(cre01d302Arc2, cre01d302Afos2, 'blend');
cre01d302Arc4 = imfuse(cre01d302Arc3, cre01d302B04,'Colorchannel',[1 0 2]);
imwrite(cre01d302Arc4, 'cre01d302Arc.tif');


%% cre01d304

%cre01d304B (B)

cre01d304B01 = imtophat(cre01d304B, SE50);
cre01d304Baht = adapthisteq(cre01d304B01);

cre01d304Bmed = medfilt2(cre01d304Baht,[3,3]);
cre01d304B02 = imtophat(cre01d304Bmed,SE50);
cre01d304Bcom = imcomplement(cre01d304B02);
cre01d304B03 = medfilt2(cre01d304Bcom,[3,3]);
cre01d304B04 = imcomplement(cre01d304B03); % DAPI(B): pre1

%cre01d304R_Afos (R)
cre01d304R01 = imtophat(cre01d304R, SE50);
cre01d304Rcom = imcomplement(cre01d304R01);
cre01d304R02 = medfilt2(cre01d304Rcom, [3,3]);
cre01d304R03 = imcomplement(cre01d304R02);
cre01d304R03_T120 = cre01d304R03 > 105; % Arc_fosi % T105 <------------

cre01d304B04_T120 = cre01d304B04 > 120; % DAPI(B): pre2a
cre01d304Afos1 = imfuse(cre01d304R03_T120, cre01d304B04_T120, 'blend');
cre01d304Afos2 = cre01d304Afos1 > 140; % Arc_fosi(R): final

%cre01d304R_Acyt (R)
cre01d304R03_T100 = cre01d304R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre01d304Bdil1 = imdilate(cre01d304B04, s);
cre01d304Bdil2 = imfuse(cre01d304Bdil1, cre01d304B04, 'diff'); 
cre01d304Bdil2_T30 = cre01d304Bdil2 > 30; % DAPI(B): pre2b
cre01d304Acyt1 = imfuse(cre01d304R03_T100, cre01d304Bdil2_T30, 'blend');
cre01d304Acyt2 = cre01d304Acyt1 > 140;
cre01d304Acyt3 = bwareaopen(cre01d304Acyt2, 3); % Arc_cytoplasm(R): final
cre01d304Arc1 = imfuse(cre01d304Afos2, cre01d304Acyt3, 'blend');
cre01d304Arc2 = cre01d304Arc1 > 0;
cre01d304Arc3 = imfuse(cre01d304Arc2, cre01d304Afos2, 'blend');
cre01d304Arc4 = imfuse(cre01d304Arc3, cre01d304B04,'Colorchannel',[1 0 2]);
imwrite(cre01d304Arc4, 'cre01d304Arc.tif');


