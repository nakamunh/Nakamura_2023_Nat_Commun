%% Arc catFISH 

cre04d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d301B0.jpg');
cre04d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d301R0.jpg');
cre04d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d302B0.jpg');
cre04d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d302R0.jpg');
cre04d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d303B0.jpg');
cre04d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d303R0.jpg');
cre04d308B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d308B0.jpg');
cre04d308R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre04d308R0.jpg');

cre04d301R = cre04d301R0(:,:,1);
cre04d301B = cre04d301B0(:,:,3);
cre04d302R = cre04d302R0(:,:,1);
cre04d302B = cre04d302B0(:,:,3);
cre04d303R = cre04d303R0(:,:,1);
cre04d303B = cre04d303B0(:,:,3);
cre04d308R = cre04d308R0(:,:,1);
cre04d308B = cre04d308B0(:,:,3);


%% cre04d301

%cre04d301B (B)
SE50 = strel('square',50);
cre04d301B01 = imtophat(cre04d301B, SE50);
cre04d301Baht = adapthisteq(cre04d301B01);
avg = ones(3,3)/9;
cre04d301Bmed = medfilt2(cre04d301Baht,[3,3]);
cre04d301B02 = imtophat(cre04d301Bmed,SE50);
cre04d301Bcom = imcomplement(cre04d301B02);
cre04d301B03 = medfilt2(cre04d301Bcom,[3,3]);
cre04d301B04 = imcomplement(cre04d301B03); % DAPI(B): pre1

%cre04d301R_Afos (R)
cre04d301R01 = imtophat(cre04d301R, SE50);
cre04d301Rcom = imcomplement(cre04d301R01);
cre04d301R02 = medfilt2(cre04d301Rcom, [3,3]);
cre04d301R03 = imcomplement(cre04d301R02);
cre04d301R03_T120 = cre04d301R03 > 105; % Arc_fosi % T105 <------------

cre04d301B04_T120 = cre04d301B04 > 120; % DAPI(B): pre2a
cre04d301Afos1 = imfuse(cre04d301R03_T120, cre04d301B04_T120, 'blend');
cre04d301Afos2 = cre04d301Afos1 > 140; % Arc_fosi(R): final

%cre04d301R_Acyt (R)
cre04d301R03_T100 = cre04d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre04d301Bdil1 = imdilate(cre04d301B04, s);
cre04d301Bdil2 = imfuse(cre04d301Bdil1, cre04d301B04, 'diff'); 
cre04d301Bdil2_T30 = cre04d301Bdil2 > 30; % DAPI(B): pre2b
cre04d301Acyt1 = imfuse(cre04d301R03_T100, cre04d301Bdil2_T30, 'blend');
cre04d301Acyt2 = cre04d301Acyt1 > 140;
cre04d301Acyt3 = bwareaopen(cre04d301Acyt2, 3); % Arc_cytoplasm(R): final
cre04d301Arc1 = imfuse(cre04d301Afos2, cre04d301Acyt3, 'blend');
cre04d301Arc2 = cre04d301Arc1 > 0;
cre04d301Arc3 = imfuse(cre04d301Arc2, cre04d301Afos2, 'blend');
cre04d301Arc4 = imfuse(cre04d301Arc3, cre04d301B04,'Colorchannel',[1 0 2]);
imwrite(cre04d301Arc4, 'cre04d301Arc.tif');


%% cre04d302

%cre04d302B (B)

cre04d302B01 = imtophat(cre04d302B, SE50);
cre04d302Baht = adapthisteq(cre04d302B01);

cre04d302Bmed = medfilt2(cre04d302Baht,[3,3]);
cre04d302B02 = imtophat(cre04d302Bmed,SE50);
cre04d302Bcom = imcomplement(cre04d302B02);
cre04d302B03 = medfilt2(cre04d302Bcom,[3,3]);
cre04d302B04 = imcomplement(cre04d302B03); % DAPI(B): pre1

%cre04d302R_Afos (R)
cre04d302R01 = imtophat(cre04d302R, SE50);
cre04d302Rcom = imcomplement(cre04d302R01);
cre04d302R02 = medfilt2(cre04d302Rcom, [3,3]);
cre04d302R03 = imcomplement(cre04d302R02);
cre04d302R03_T120 = cre04d302R03 > 105; % Arc_fosi % T105 <------------

cre04d302B04_T120 = cre04d302B04 > 120; % DAPI(B): pre2a
cre04d302Afos1 = imfuse(cre04d302R03_T120, cre04d302B04_T120, 'blend');
cre04d302Afos2 = cre04d302Afos1 > 140; % Arc_fosi(R): final

%cre04d302R_Acyt (R)
cre04d302R03_T100 = cre04d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre04d302Bdil1 = imdilate(cre04d302B04, s);
cre04d302Bdil2 = imfuse(cre04d302Bdil1, cre04d302B04, 'diff'); 
cre04d302Bdil2_T30 = cre04d302Bdil2 > 30; % DAPI(B): pre2b
cre04d302Acyt1 = imfuse(cre04d302R03_T100, cre04d302Bdil2_T30, 'blend');
cre04d302Acyt2 = cre04d302Acyt1 > 140;
cre04d302Acyt3 = bwareaopen(cre04d302Acyt2, 3); % Arc_cytoplasm(R): final
cre04d302Arc1 = imfuse(cre04d302Afos2, cre04d302Acyt3, 'blend');
cre04d302Arc2 = cre04d302Arc1 > 0;
cre04d302Arc3 = imfuse(cre04d302Arc2, cre04d302Afos2, 'blend');
cre04d302Arc4 = imfuse(cre04d302Arc3, cre04d302B04,'Colorchannel',[1 0 2]);
imwrite(cre04d302Arc4, 'cre04d302Arc.tif');


%% cre04d303

%cre04d303B (B)

cre04d303B01 = imtophat(cre04d303B, SE50);
cre04d303Baht = adapthisteq(cre04d303B01);

cre04d303Bmed = medfilt2(cre04d303Baht,[3,3]);
cre04d303B02 = imtophat(cre04d303Bmed,SE50);
cre04d303Bcom = imcomplement(cre04d303B02);
cre04d303B03 = medfilt2(cre04d303Bcom,[3,3]);
cre04d303B04 = imcomplement(cre04d303B03); % DAPI(B): pre1

%cre04d303R_Afos (R)
cre04d303R01 = imtophat(cre04d303R, SE50);
cre04d303Rcom = imcomplement(cre04d303R01);
cre04d303R02 = medfilt2(cre04d303Rcom, [3,3]);
cre04d303R03 = imcomplement(cre04d303R02);
cre04d303R03_T120 = cre04d303R03 > 105; % Arc_fosi % T105 <------------

cre04d303B04_T120 = cre04d303B04 > 120; % DAPI(B): pre2a
cre04d303Afos1 = imfuse(cre04d303R03_T120, cre04d303B04_T120, 'blend');
cre04d303Afos2 = cre04d303Afos1 > 140; % Arc_fosi(R): final

%cre04d303R_Acyt (R)
cre04d303R03_T100 = cre04d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre04d303Bdil1 = imdilate(cre04d303B04, s);
cre04d303Bdil2 = imfuse(cre04d303Bdil1, cre04d303B04, 'diff'); 
cre04d303Bdil2_T30 = cre04d303Bdil2 > 30; % DAPI(B): pre2b
cre04d303Acyt1 = imfuse(cre04d303R03_T100, cre04d303Bdil2_T30, 'blend');
cre04d303Acyt2 = cre04d303Acyt1 > 140;
cre04d303Acyt3 = bwareaopen(cre04d303Acyt2, 3); % Arc_cytoplasm(R): final
cre04d303Arc1 = imfuse(cre04d303Afos2, cre04d303Acyt3, 'blend');
cre04d303Arc2 = cre04d303Arc1 > 0;
cre04d303Arc3 = imfuse(cre04d303Arc2, cre04d303Afos2, 'blend');
cre04d303Arc4 = imfuse(cre04d303Arc3, cre04d303B04,'Colorchannel',[1 0 2]);
imwrite(cre04d303Arc4, 'cre04d303Arc.tif');




%% cre04d308

%cre04d308B (B)

cre04d308B01 = imtophat(cre04d308B, SE50);
cre04d308Baht = adapthisteq(cre04d308B01);

cre04d308Bmed = medfilt2(cre04d308Baht,[3,3]);
cre04d308B02 = imtophat(cre04d308Bmed,SE50);
cre04d308Bcom = imcomplement(cre04d308B02);
cre04d308B03 = medfilt2(cre04d308Bcom,[3,3]);
cre04d308B04 = imcomplement(cre04d308B03); % DAPI(B): pre1

%cre04d308R_Afos (R)
cre04d308R01 = imtophat(cre04d308R, SE50);
cre04d308Rcom = imcomplement(cre04d308R01);
cre04d308R02 = medfilt2(cre04d308Rcom, [3,3]);
cre04d308R03 = imcomplement(cre04d308R02);
cre04d308R03_T120 = cre04d308R03 > 105; % Arc_fosi % T105 <------------

cre04d308B04_T120 = cre04d308B04 > 120; % DAPI(B): pre2a
cre04d308Afos1 = imfuse(cre04d308R03_T120, cre04d308B04_T120, 'blend');
cre04d308Afos2 = cre04d308Afos1 > 140; % Arc_fosi(R): final

%cre04d308R_Acyt (R)
cre04d308R03_T100 = cre04d308R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre04d308Bdil1 = imdilate(cre04d308B04, s);
cre04d308Bdil2 = imfuse(cre04d308Bdil1, cre04d308B04, 'diff'); 
cre04d308Bdil2_T30 = cre04d308Bdil2 > 30; % DAPI(B): pre2b
cre04d308Acyt1 = imfuse(cre04d308R03_T100, cre04d308Bdil2_T30, 'blend');
cre04d308Acyt2 = cre04d308Acyt1 > 140;
cre04d308Acyt3 = bwareaopen(cre04d308Acyt2, 3); % Arc_cytoplasm(R): final
cre04d308Arc1 = imfuse(cre04d308Afos2, cre04d308Acyt3, 'blend');
cre04d308Arc2 = cre04d308Arc1 > 0;
cre04d308Arc3 = imfuse(cre04d308Arc2, cre04d308Afos2, 'blend');
cre04d308Arc4 = imfuse(cre04d308Arc3, cre04d308B04,'Colorchannel',[1 0 2]);
imwrite(cre04d308Arc4, 'cre04d308Arc.tif');


