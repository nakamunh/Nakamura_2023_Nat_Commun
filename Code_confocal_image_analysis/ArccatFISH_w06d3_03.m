%% Arc catFISH 

w06d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d301B0.jpg');
w06d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d301R0.jpg');
w06d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d302B0.jpg');
w06d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d302R0.jpg');
w06d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d303B0.jpg');
w06d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d303R0.jpg');
w06d308B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d308B0.jpg');
w06d308R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w06d308R0.jpg');

w06d301R = w06d301R0(:,:,1);
w06d301B = w06d301B0(:,:,3);
w06d302R = w06d302R0(:,:,1);
w06d302B = w06d302B0(:,:,3);
w06d303R = w06d303R0(:,:,1);
w06d303B = w06d303B0(:,:,3);
w06d308R = w06d308R0(:,:,1);
w06d308B = w06d308B0(:,:,3);


%% w06d301

%w06d301B (B)
SE50 = strel('square',50);
w06d301B01 = imtophat(w06d301B, SE50);
w06d301Baht = adapthisteq(w06d301B01);
avg = ones(3,3)/9;
w06d301Bmed = medfilt2(w06d301Baht,[3,3]);
w06d301B02 = imtophat(w06d301Bmed,SE50);
w06d301Bcom = imcomplement(w06d301B02);
w06d301B03 = medfilt2(w06d301Bcom,[3,3]);
w06d301B04 = imcomplement(w06d301B03); % DAPI(B): pre1

%w06d301R_Afos (R)
w06d301R01 = imtophat(w06d301R, SE50);
w06d301Rcom = imcomplement(w06d301R01);
w06d301R02 = medfilt2(w06d301Rcom, [3,3]);
w06d301R03 = imcomplement(w06d301R02);
w06d301R03_T120 = w06d301R03 > 105; % Arc_fosi % T105 <------------

w06d301B04_T120 = w06d301B04 > 120; % DAPI(B): pre2a
w06d301Afos1 = imfuse(w06d301R03_T120, w06d301B04_T120, 'blend');
w06d301Afos2 = w06d301Afos1 > 140; % Arc_fosi(R): final

%w06d301R_Acyt (R)
w06d301R03_T100 = w06d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w06d301Bdil1 = imdilate(w06d301B04, s);
w06d301Bdil2 = imfuse(w06d301Bdil1, w06d301B04, 'diff'); 
w06d301Bdil2_T30 = w06d301Bdil2 > 30; % DAPI(B): pre2b
w06d301Acyt1 = imfuse(w06d301R03_T100, w06d301Bdil2_T30, 'blend');
w06d301Acyt2 = w06d301Acyt1 > 140;
w06d301Acyt3 = bwareaopen(w06d301Acyt2, 3); % Arc_cytoplasm(R): final
w06d301Arc1 = imfuse(w06d301Afos2, w06d301Acyt3, 'blend');
w06d301Arc2 = w06d301Arc1 > 0;
w06d301Arc3 = imfuse(w06d301Arc2, w06d301Afos2, 'blend');
w06d301Arc4 = imfuse(w06d301Arc3, w06d301B04,'Colorchannel',[1 0 2]);
imwrite(w06d301Arc4, 'w06d301Arc.tif');



%% w06d302

%w06d302B (B)

w06d302B01 = imtophat(w06d302B, SE50);
w06d302Baht = adapthisteq(w06d302B01);

w06d302Bmed = medfilt2(w06d302Baht,[3,3]);
w06d302B02 = imtophat(w06d302Bmed,SE50);
w06d302Bcom = imcomplement(w06d302B02);
w06d302B03 = medfilt2(w06d302Bcom,[3,3]);
w06d302B04 = imcomplement(w06d302B03); % DAPI(B): pre1

%w06d302R_Afos (R)
w06d302R01 = imtophat(w06d302R, SE50);
w06d302Rcom = imcomplement(w06d302R01);
w06d302R02 = medfilt2(w06d302Rcom, [3,3]);
w06d302R03 = imcomplement(w06d302R02);
w06d302R03_T120 = w06d302R03 > 105; % Arc_fosi % T105 <------------

w06d302B04_T120 = w06d302B04 > 120; % DAPI(B): pre2a
w06d302Afos1 = imfuse(w06d302R03_T120, w06d302B04_T120, 'blend');
w06d302Afos2 = w06d302Afos1 > 140; % Arc_fosi(R): final

%w06d302R_Acyt (R)
w06d302R03_T100 = w06d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w06d302Bdil1 = imdilate(w06d302B04, s);
w06d302Bdil2 = imfuse(w06d302Bdil1, w06d302B04, 'diff'); 
w06d302Bdil2_T30 = w06d302Bdil2 > 30; % DAPI(B): pre2b
w06d302Acyt1 = imfuse(w06d302R03_T100, w06d302Bdil2_T30, 'blend');
w06d302Acyt2 = w06d302Acyt1 > 140;
w06d302Acyt3 = bwareaopen(w06d302Acyt2, 3); % Arc_cytoplasm(R): final
w06d302Arc1 = imfuse(w06d302Afos2, w06d302Acyt3, 'blend');
w06d302Arc2 = w06d302Arc1 > 0;
w06d302Arc3 = imfuse(w06d302Arc2, w06d302Afos2, 'blend');
w06d302Arc4 = imfuse(w06d302Arc3, w06d302B04,'Colorchannel',[1 0 2]);
imwrite(w06d302Arc4, 'w06d302Arc.tif');



%% w06d303

%w06d303B (B)

w06d303B01 = imtophat(w06d303B, SE50);
w06d303Baht = adapthisteq(w06d303B01);

w06d303Bmed = medfilt2(w06d303Baht,[3,3]);
w06d303B02 = imtophat(w06d303Bmed,SE50);
w06d303Bcom = imcomplement(w06d303B02);
w06d303B03 = medfilt2(w06d303Bcom,[3,3]);
w06d303B04 = imcomplement(w06d303B03); % DAPI(B): pre1

%w06d303R_Afos (R)
w06d303R01 = imtophat(w06d303R, SE50);
w06d303Rcom = imcomplement(w06d303R01);
w06d303R02 = medfilt2(w06d303Rcom, [3,3]);
w06d303R03 = imcomplement(w06d303R02);
w06d303R03_T120 = w06d303R03 > 105; % Arc_fosi % T105 <------------

w06d303B04_T120 = w06d303B04 > 120; % DAPI(B): pre2a
w06d303Afos1 = imfuse(w06d303R03_T120, w06d303B04_T120, 'blend');
w06d303Afos2 = w06d303Afos1 > 140; % Arc_fosi(R): final

%w06d303R_Acyt (R)
w06d303R03_T100 = w06d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w06d303Bdil1 = imdilate(w06d303B04, s);
w06d303Bdil2 = imfuse(w06d303Bdil1, w06d303B04, 'diff'); 
w06d303Bdil2_T30 = w06d303Bdil2 > 30; % DAPI(B): pre2b
w06d303Acyt1 = imfuse(w06d303R03_T100, w06d303Bdil2_T30, 'blend');
w06d303Acyt2 = w06d303Acyt1 > 140;
w06d303Acyt3 = bwareaopen(w06d303Acyt2, 3); % Arc_cytoplasm(R): final
w06d303Arc1 = imfuse(w06d303Afos2, w06d303Acyt3, 'blend');
w06d303Arc2 = w06d303Arc1 > 0;
w06d303Arc3 = imfuse(w06d303Arc2, w06d303Afos2, 'blend');
w06d303Arc4 = imfuse(w06d303Arc3, w06d303B04,'Colorchannel',[1 0 2]);
imwrite(w06d303Arc4, 'w06d303Arc.tif');


%% w06d308

%w06d308B (B)

w06d308B01 = imtophat(w06d308B, SE50);
w06d308Baht = adapthisteq(w06d308B01);

w06d308Bmed = medfilt2(w06d308Baht,[3,3]);
w06d308B02 = imtophat(w06d308Bmed,SE50);
w06d308Bcom = imcomplement(w06d308B02);
w06d308B03 = medfilt2(w06d308Bcom,[3,3]);
w06d308B04 = imcomplement(w06d308B03); % DAPI(B): pre1

%w06d308R_Afos (R)
w06d308R01 = imtophat(w06d308R, SE50);
w06d308Rcom = imcomplement(w06d308R01);
w06d308R02 = medfilt2(w06d308Rcom, [3,3]);
w06d308R03 = imcomplement(w06d308R02);
w06d308R03_T120 = w06d308R03 > 105; % Arc_fosi % T105 <------------

w06d308B04_T120 = w06d308B04 > 120; % DAPI(B): pre2a
w06d308Afos1 = imfuse(w06d308R03_T120, w06d308B04_T120, 'blend');
w06d308Afos2 = w06d308Afos1 > 140; % Arc_fosi(R): final

%w06d308R_Acyt (R)
w06d308R03_T100 = w06d308R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w06d308Bdil1 = imdilate(w06d308B04, s);
w06d308Bdil2 = imfuse(w06d308Bdil1, w06d308B04, 'diff'); 
w06d308Bdil2_T30 = w06d308Bdil2 > 30; % DAPI(B): pre2b
w06d308Acyt1 = imfuse(w06d308R03_T100, w06d308Bdil2_T30, 'blend');
w06d308Acyt2 = w06d308Acyt1 > 140;
w06d308Acyt3 = bwareaopen(w06d308Acyt2, 3); % Arc_cytoplasm(R): final
w06d308Arc1 = imfuse(w06d308Afos2, w06d308Acyt3, 'blend');
w06d308Arc2 = w06d308Arc1 > 0;
w06d308Arc3 = imfuse(w06d308Arc2, w06d308Afos2, 'blend');
w06d308Arc4 = imfuse(w06d308Arc3, w06d308B04,'Colorchannel',[1 0 2]);
imwrite(w06d308Arc4, 'w06d308Arc.tif');


