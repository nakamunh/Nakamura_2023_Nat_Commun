%% Arc catFISH 

w04d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d301B0.jpg');
w04d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d301R0.jpg');
w04d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d302B0.jpg');
w04d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d302R0.jpg');
w04d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d303B0.jpg');
w04d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d303R0.jpg');
w04d308B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d308B0.jpg');
w04d308R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w04d308R0.jpg');

w04d301R = w04d301R0(:,:,1);
w04d301B = w04d301B0(:,:,3);
w04d302R = w04d302R0(:,:,1);
w04d302B = w04d302B0(:,:,3);
w04d303R = w04d303R0(:,:,1);
w04d303B = w04d303B0(:,:,3);
w04d308R = w04d308R0(:,:,1);
w04d308B = w04d308B0(:,:,3);

%% w04d301

%w04d301B (B)
SE50 = strel('square',50);
w04d301B01 = imtophat(w04d301B, SE50);
w04d301Baht = adapthisteq(w04d301B01);
avg = ones(3,3)/9;
w04d301Bmed = medfilt2(w04d301Baht,[3,3]);
w04d301B02 = imtophat(w04d301Bmed,SE50);
w04d301Bcom = imcomplement(w04d301B02);
w04d301B03 = medfilt2(w04d301Bcom,[3,3]);
w04d301B04 = imcomplement(w04d301B03); % DAPI(B): pre1

%w04d301R_Afos (R)
w04d301R01 = imtophat(w04d301R, SE50);
w04d301Rcom = imcomplement(w04d301R01);
w04d301R02 = medfilt2(w04d301Rcom, [3,3]);
w04d301R03 = imcomplement(w04d301R02);
w04d301R03_T120 = w04d301R03 > 105; % Arc_fosi % T105 <------------

w04d301B04_T120 = w04d301B04 > 120; % DAPI(B): pre2a
w04d301Afos1 = imfuse(w04d301R03_T120, w04d301B04_T120, 'blend');
w04d301Afos2 = w04d301Afos1 > 140; % Arc_fosi(R): final

%w04d301R_Acyt (R)
w04d301R03_T100 = w04d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w04d301Bdil1 = imdilate(w04d301B04, s);
w04d301Bdil2 = imfuse(w04d301Bdil1, w04d301B04, 'diff'); 
w04d301Bdil2_T30 = w04d301Bdil2 > 30; % DAPI(B): pre2b
w04d301Acyt1 = imfuse(w04d301R03_T100, w04d301Bdil2_T30, 'blend');
w04d301Acyt2 = w04d301Acyt1 > 140;
w04d301Acyt3 = bwareaopen(w04d301Acyt2, 3); % Arc_cytoplasm(R): final
w04d301Arc1 = imfuse(w04d301Afos2, w04d301Acyt3, 'blend');
w04d301Arc2 = w04d301Arc1 > 0;
w04d301Arc3 = imfuse(w04d301Arc2, w04d301Afos2, 'blend');
w04d301Arc4 = imfuse(w04d301Arc3, w04d301B04,'Colorchannel',[1 0 2]);
imwrite(w04d301Arc4, 'w04d301Arc.tif');



%% w04d302

%w04d302B (B)

w04d302B01 = imtophat(w04d302B, SE50);
w04d302Baht = adapthisteq(w04d302B01);

w04d302Bmed = medfilt2(w04d302Baht,[3,3]);
w04d302B02 = imtophat(w04d302Bmed,SE50);
w04d302Bcom = imcomplement(w04d302B02);
w04d302B03 = medfilt2(w04d302Bcom,[3,3]);
w04d302B04 = imcomplement(w04d302B03); % DAPI(B): pre1

%w04d302R_Afos (R)
w04d302R01 = imtophat(w04d302R, SE50);
w04d302Rcom = imcomplement(w04d302R01);
w04d302R02 = medfilt2(w04d302Rcom, [3,3]);
w04d302R03 = imcomplement(w04d302R02);
w04d302R03_T120 = w04d302R03 > 105; % Arc_fosi % T105 <------------

w04d302B04_T120 = w04d302B04 > 120; % DAPI(B): pre2a
w04d302Afos1 = imfuse(w04d302R03_T120, w04d302B04_T120, 'blend');
w04d302Afos2 = w04d302Afos1 > 140; % Arc_fosi(R): final

%w04d302R_Acyt (R)
w04d302R03_T100 = w04d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w04d302Bdil1 = imdilate(w04d302B04, s);
w04d302Bdil2 = imfuse(w04d302Bdil1, w04d302B04, 'diff'); 
w04d302Bdil2_T30 = w04d302Bdil2 > 30; % DAPI(B): pre2b
w04d302Acyt1 = imfuse(w04d302R03_T100, w04d302Bdil2_T30, 'blend');
w04d302Acyt2 = w04d302Acyt1 > 140;
w04d302Acyt3 = bwareaopen(w04d302Acyt2, 3); % Arc_cytoplasm(R): final
w04d302Arc1 = imfuse(w04d302Afos2, w04d302Acyt3, 'blend');
w04d302Arc2 = w04d302Arc1 > 0;
w04d302Arc3 = imfuse(w04d302Arc2, w04d302Afos2, 'blend');
w04d302Arc4 = imfuse(w04d302Arc3, w04d302B04,'Colorchannel',[1 0 2]);
imwrite(w04d302Arc4, 'w04d302Arc.tif');



%% w04d303

%w04d303B (B)

w04d303B01 = imtophat(w04d303B, SE50);
w04d303Baht = adapthisteq(w04d303B01);

w04d303Bmed = medfilt2(w04d303Baht,[3,3]);
w04d303B02 = imtophat(w04d303Bmed,SE50);
w04d303Bcom = imcomplement(w04d303B02);
w04d303B03 = medfilt2(w04d303Bcom,[3,3]);
w04d303B04 = imcomplement(w04d303B03); % DAPI(B): pre1

%w04d303R_Afos (R)
w04d303R01 = imtophat(w04d303R, SE50);
w04d303Rcom = imcomplement(w04d303R01);
w04d303R02 = medfilt2(w04d303Rcom, [3,3]);
w04d303R03 = imcomplement(w04d303R02);
w04d303R03_T120 = w04d303R03 > 105; % Arc_fosi % T105 <------------

w04d303B04_T120 = w04d303B04 > 120; % DAPI(B): pre2a
w04d303Afos1 = imfuse(w04d303R03_T120, w04d303B04_T120, 'blend');
w04d303Afos2 = w04d303Afos1 > 140; % Arc_fosi(R): final

%w04d303R_Acyt (R)
w04d303R03_T100 = w04d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w04d303Bdil1 = imdilate(w04d303B04, s);
w04d303Bdil2 = imfuse(w04d303Bdil1, w04d303B04, 'diff'); 
w04d303Bdil2_T30 = w04d303Bdil2 > 30; % DAPI(B): pre2b
w04d303Acyt1 = imfuse(w04d303R03_T100, w04d303Bdil2_T30, 'blend');
w04d303Acyt2 = w04d303Acyt1 > 140;
w04d303Acyt3 = bwareaopen(w04d303Acyt2, 3); % Arc_cytoplasm(R): final
w04d303Arc1 = imfuse(w04d303Afos2, w04d303Acyt3, 'blend');
w04d303Arc2 = w04d303Arc1 > 0;
w04d303Arc3 = imfuse(w04d303Arc2, w04d303Afos2, 'blend');
w04d303Arc4 = imfuse(w04d303Arc3, w04d303B04,'Colorchannel',[1 0 2]);
imwrite(w04d303Arc4, 'w04d303Arc.tif');


%% w04d308

%w04d308B (B)

w04d308B01 = imtophat(w04d308B, SE50);
w04d308Baht = adapthisteq(w04d308B01);

w04d308Bmed = medfilt2(w04d308Baht,[3,3]);
w04d308B02 = imtophat(w04d308Bmed,SE50);
w04d308Bcom = imcomplement(w04d308B02);
w04d308B03 = medfilt2(w04d308Bcom,[3,3]);
w04d308B04 = imcomplement(w04d308B03); % DAPI(B): pre1

%w04d308R_Afos (R)
w04d308R01 = imtophat(w04d308R, SE50);
w04d308Rcom = imcomplement(w04d308R01);
w04d308R02 = medfilt2(w04d308Rcom, [3,3]);
w04d308R03 = imcomplement(w04d308R02);
w04d308R03_T120 = w04d308R03 > 105; % Arc_fosi % T105 <------------

w04d308B04_T120 = w04d308B04 > 120; % DAPI(B): pre2a
w04d308Afos1 = imfuse(w04d308R03_T120, w04d308B04_T120, 'blend');
w04d308Afos2 = w04d308Afos1 > 140; % Arc_fosi(R): final

%w04d308R_Acyt (R)
w04d308R03_T100 = w04d308R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w04d308Bdil1 = imdilate(w04d308B04, s);
w04d308Bdil2 = imfuse(w04d308Bdil1, w04d308B04, 'diff'); 
w04d308Bdil2_T30 = w04d308Bdil2 > 30; % DAPI(B): pre2b
w04d308Acyt1 = imfuse(w04d308R03_T100, w04d308Bdil2_T30, 'blend');
w04d308Acyt2 = w04d308Acyt1 > 140;
w04d308Acyt3 = bwareaopen(w04d308Acyt2, 3); % Arc_cytoplasm(R): final
w04d308Arc1 = imfuse(w04d308Afos2, w04d308Acyt3, 'blend');
w04d308Arc2 = w04d308Arc1 > 0;
w04d308Arc3 = imfuse(w04d308Arc2, w04d308Afos2, 'blend');
w04d308Arc4 = imfuse(w04d308Arc3, w04d308B04,'Colorchannel',[1 0 2]);
imwrite(w04d308Arc4, 'w04d308Arc.tif');


