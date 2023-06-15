%% Arc catFISH 

cre03d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d301B0.jpg');
cre03d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d301R0.jpg');
cre03d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d302B0.jpg');
cre03d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d302R0.jpg');
cre03d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d303B0.jpg');
cre03d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre03d303R0.jpg');

cre03d301R = cre03d301R0(:,:,1);
cre03d301B = cre03d301B0(:,:,3);
cre03d302R = cre03d302R0(:,:,1);
cre03d302B = cre03d302B0(:,:,3);
cre03d303R = cre03d303R0(:,:,1);
cre03d303B = cre03d303B0(:,:,3);


%% cre03d301

%cre03d301B (B)
SE50 = strel('square',50);
cre03d301B01 = imtophat(cre03d301B, SE50);
cre03d301Baht = adapthisteq(cre03d301B01);
avg = ones(3,3)/9;
cre03d301Bmed = medfilt2(cre03d301Baht,[3,3]);
cre03d301B02 = imtophat(cre03d301Bmed,SE50);
cre03d301Bcom = imcomplement(cre03d301B02);
cre03d301B03 = medfilt2(cre03d301Bcom,[3,3]);
cre03d301B04 = imcomplement(cre03d301B03); % DAPI(B): pre1

%cre03d301R_Afos (R)
cre03d301R01 = imtophat(cre03d301R, SE50);
cre03d301Rcom = imcomplement(cre03d301R01);
cre03d301R02 = medfilt2(cre03d301Rcom, [3,3]);
cre03d301R03 = imcomplement(cre03d301R02);
cre03d301R03_T120 = cre03d301R03 > 105; % Arc_fosi % T105 <------------

cre03d301B04_T120 = cre03d301B04 > 120; % DAPI(B): pre2a
cre03d301Afos1 = imfuse(cre03d301R03_T120, cre03d301B04_T120, 'blend');
cre03d301Afos2 = cre03d301Afos1 > 140;          

%cre03d301R_Acyt (R)
cre03d301R03_T100 = cre03d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre03d301Bdil1 = imdilate(cre03d301B04, s);
cre03d301Bdil2 = imfuse(cre03d301Bdil1, cre03d301B04, 'diff'); 
cre03d301Bdil2_T30 = cre03d301Bdil2 > 30; % DAPI(B): pre2b
cre03d301Acyt1 = imfuse(cre03d301R03_T100, cre03d301Bdil2_T30, 'blend');
cre03d301Acyt2 = cre03d301Acyt1 > 140;           
cre03d301Acyt3 = bwareaopen(cre03d301Acyt2, 3); % Arc_cytoplasm(R): final
cre03d301Arc1 = imfuse(cre03d301Afos2, cre03d301Acyt3, 'blend');
cre03d301Arc2 = cre03d301Arc1 > 0;
cre03d301Arc3 = imfuse(cre03d301Arc2, cre03d301Afos2, 'blend');
cre03d301Arc4 = imfuse(cre03d301Arc3, cre03d301B04,'Colorchannel',[1 0 2]);
imwrite(cre03d301Arc4, 'cre03d301Arc.tif');


%% cre03d302

%cre03d302B (B)

cre03d302B01 = imtophat(cre03d302B, SE50);
cre03d302Baht = adapthisteq(cre03d302B01);

cre03d302Bmed = medfilt2(cre03d302Baht,[3,3]);
cre03d302B02 = imtophat(cre03d302Bmed,SE50);
cre03d302Bcom = imcomplement(cre03d302B02);
cre03d302B03 = medfilt2(cre03d302Bcom,[3,3]);
cre03d302B04 = imcomplement(cre03d302B03); % DAPI(B): pre1

%cre03d302R_Afos (R)
cre03d302R01 = imtophat(cre03d302R, SE50);
cre03d302Rcom = imcomplement(cre03d302R01);
cre03d302R02 = medfilt2(cre03d302Rcom, [3,3]);
cre03d302R03 = imcomplement(cre03d302R02);
cre03d302R03_T120 = cre03d302R03 > 105; % Arc_fosi % T105 <------------

cre03d302B04_T120 = cre03d302B04 > 120; % DAPI(B): pre2a
cre03d302Afos1 = imfuse(cre03d302R03_T120, cre03d302B04_T120, 'blend');
cre03d302Afos2 = cre03d302Afos1 > 140;          

%cre03d302R_Acyt (R)
cre03d302R03_T100 = cre03d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre03d302Bdil1 = imdilate(cre03d302B04, s);
cre03d302Bdil2 = imfuse(cre03d302Bdil1, cre03d302B04, 'diff'); 
cre03d302Bdil2_T30 = cre03d302Bdil2 > 30; % DAPI(B): pre2b
cre03d302Acyt1 = imfuse(cre03d302R03_T100, cre03d302Bdil2_T30, 'blend');
cre03d302Acyt2 = cre03d302Acyt1 > 140;           
cre03d302Acyt3 = bwareaopen(cre03d302Acyt2, 3); % Arc_cytoplasm(R): final
cre03d302Arc1 = imfuse(cre03d302Afos2, cre03d302Acyt3, 'blend');
cre03d302Arc2 = cre03d302Arc1 > 0;
cre03d302Arc3 = imfuse(cre03d302Arc2, cre03d302Afos2, 'blend');
cre03d302Arc4 = imfuse(cre03d302Arc3, cre03d302B04,'Colorchannel',[1 0 2]);
imwrite(cre03d302Arc4, 'cre03d302Arc.tif');


%% cre03d303

%cre03d303B (B)

cre03d303B01 = imtophat(cre03d303B, SE50);
cre03d303Baht = adapthisteq(cre03d303B01);

cre03d303Bmed = medfilt2(cre03d303Baht,[3,3]);
cre03d303B02 = imtophat(cre03d303Bmed,SE50);
cre03d303Bcom = imcomplement(cre03d303B02);
cre03d303B03 = medfilt2(cre03d303Bcom,[3,3]);
cre03d303B04 = imcomplement(cre03d303B03); % DAPI(B): pre1

%cre03d303R_Afos (R)
cre03d303R01 = imtophat(cre03d303R, SE50);
cre03d303Rcom = imcomplement(cre03d303R01);
cre03d303R02 = medfilt2(cre03d303Rcom, [3,3]);
cre03d303R03 = imcomplement(cre03d303R02);
cre03d303R03_T120 = cre03d303R03 > 105; % Arc_fosi % T105 <------------

cre03d303B04_T120 = cre03d303B04 > 120; % DAPI(B): pre2a
cre03d303Afos1 = imfuse(cre03d303R03_T120, cre03d303B04_T120, 'blend');
cre03d303Afos2 = cre03d303Afos1 > 140;           

%cre03d303R_Acyt (R)
cre03d303R03_T100 = cre03d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre03d303Bdil1 = imdilate(cre03d303B04, s);
cre03d303Bdil2 = imfuse(cre03d303Bdil1, cre03d303B04, 'diff'); 
cre03d303Bdil2_T30 = cre03d303Bdil2 > 30; % DAPI(B): pre2b
cre03d303Acyt1 = imfuse(cre03d303R03_T100, cre03d303Bdil2_T30, 'blend');
cre03d303Acyt2 = cre03d303Acyt1 > 140;           
cre03d303Acyt3 = bwareaopen(cre03d303Acyt2, 3); % Arc_cytoplasm(R): final
cre03d303Arc1 = imfuse(cre03d303Afos2, cre03d303Acyt3, 'blend');
cre03d303Arc2 = cre03d303Arc1 > 0;
cre03d303Arc3 = imfuse(cre03d303Arc2, cre03d303Afos2, 'blend');
cre03d303Arc4 = imfuse(cre03d303Arc3, cre03d303B04,'Colorchannel',[1 0 2]);
imwrite(cre03d303Arc4, 'cre03d303Arc.tif');

