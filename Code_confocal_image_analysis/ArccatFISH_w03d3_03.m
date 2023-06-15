%% Arc catFISH 

w03d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d301B0.jpg');
w03d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d301R0.jpg');
w03d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d302B0.jpg');
w03d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d302R0.jpg');
w03d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d303B0.jpg');
w03d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w03d303R0.jpg');

w03d301R = w03d301R0(:,:,1);
w03d301B = w03d301B0(:,:,3);
w03d302R = w03d302R0(:,:,1);
w03d302B = w03d302B0(:,:,3);
w03d303R = w03d303R0(:,:,1);
w03d303B = w03d303B0(:,:,3);

%% w03d301

%w03d301B (B)
SE50 = strel('square',50);
w03d301B01 = imtophat(w03d301B, SE50);
w03d301Baht = adapthisteq(w03d301B01);
avg = ones(3,3)/9;
w03d301Bmed = medfilt2(w03d301Baht,[3,3]);
w03d301B02 = imtophat(w03d301Bmed,SE50);
w03d301Bcom = imcomplement(w03d301B02);
w03d301B03 = medfilt2(w03d301Bcom,[3,3]);
w03d301B04 = imcomplement(w03d301B03); % DAPI(B): pre1

%w03d301R_Afos (R)
w03d301R01 = imtophat(w03d301R, SE50);
w03d301Rcom = imcomplement(w03d301R01);
w03d301R02 = medfilt2(w03d301Rcom, [3,3]);
w03d301R03 = imcomplement(w03d301R02);
w03d301R03_T120 = w03d301R03 > 105; % Arc_fosi % T105 <------------

w03d301B04_T120 = w03d301B04 > 120; % DAPI(B): pre2a
w03d301Afos1 = imfuse(w03d301R03_T120, w03d301B04_T120, 'blend');
w03d301Afos2 = w03d301Afos1 > 140; % Arc_fosi(R): final

%w03d301R_Acyt (R)
w03d301R03_T100 = w03d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w03d301Bdil1 = imdilate(w03d301B04, s);
w03d301Bdil2 = imfuse(w03d301Bdil1, w03d301B04, 'diff'); 
w03d301Bdil2_T30 = w03d301Bdil2 > 30; % DAPI(B): pre2b
w03d301Acyt1 = imfuse(w03d301R03_T100, w03d301Bdil2_T30, 'blend');
w03d301Acyt2 = w03d301Acyt1 > 140;
w03d301Acyt3 = bwareaopen(w03d301Acyt2, 3); % Arc_cytoplasm(R): final
w03d301Arc1 = imfuse(w03d301Afos2, w03d301Acyt3, 'blend');
w03d301Arc2 = w03d301Arc1 > 0;
w03d301Arc3 = imfuse(w03d301Arc2, w03d301Afos2, 'blend');
w03d301Arc4 = imfuse(w03d301Arc3, w03d301B04,'Colorchannel',[1 0 2]);
imwrite(w03d301Arc4, 'w03d301Arc.tif');



%% w03d302

%w03d302B (B)

w03d302B01 = imtophat(w03d302B, SE50);
w03d302Baht = adapthisteq(w03d302B01);

w03d302Bmed = medfilt2(w03d302Baht,[3,3]);
w03d302B02 = imtophat(w03d302Bmed,SE50);
w03d302Bcom = imcomplement(w03d302B02);
w03d302B03 = medfilt2(w03d302Bcom,[3,3]);
w03d302B04 = imcomplement(w03d302B03); % DAPI(B): pre1

%w03d302R_Afos (R)
w03d302R01 = imtophat(w03d302R, SE50);
w03d302Rcom = imcomplement(w03d302R01);
w03d302R02 = medfilt2(w03d302Rcom, [3,3]);
w03d302R03 = imcomplement(w03d302R02);
w03d302R03_T120 = w03d302R03 > 105; % Arc_fosi % T105 <------------

w03d302B04_T120 = w03d302B04 > 120; % DAPI(B): pre2a
w03d302Afos1 = imfuse(w03d302R03_T120, w03d302B04_T120, 'blend');
w03d302Afos2 = w03d302Afos1 > 140; % Arc_fosi(R): final

%w03d302R_Acyt (R)
w03d302R03_T100 = w03d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w03d302Bdil1 = imdilate(w03d302B04, s);
w03d302Bdil2 = imfuse(w03d302Bdil1, w03d302B04, 'diff'); 
w03d302Bdil2_T30 = w03d302Bdil2 > 30; % DAPI(B): pre2b
w03d302Acyt1 = imfuse(w03d302R03_T100, w03d302Bdil2_T30, 'blend');
w03d302Acyt2 = w03d302Acyt1 > 140;
w03d302Acyt3 = bwareaopen(w03d302Acyt2, 3); % Arc_cytoplasm(R): final
w03d302Arc1 = imfuse(w03d302Afos2, w03d302Acyt3, 'blend');
w03d302Arc2 = w03d302Arc1 > 0;
w03d302Arc3 = imfuse(w03d302Arc2, w03d302Afos2, 'blend');
w03d302Arc4 = imfuse(w03d302Arc3, w03d302B04,'Colorchannel',[1 0 2]);
imwrite(w03d302Arc4, 'w03d302Arc.tif');



%% w03d303

%w03d303B (B)

w03d303B01 = imtophat(w03d303B, SE50);
w03d303Baht = adapthisteq(w03d303B01);

w03d303Bmed = medfilt2(w03d303Baht,[3,3]);
w03d303B02 = imtophat(w03d303Bmed,SE50);
w03d303Bcom = imcomplement(w03d303B02);
w03d303B03 = medfilt2(w03d303Bcom,[3,3]);
w03d303B04 = imcomplement(w03d303B03); % DAPI(B): pre1

%w03d303R_Afos (R)
w03d303R01 = imtophat(w03d303R, SE50);
w03d303Rcom = imcomplement(w03d303R01);
w03d303R02 = medfilt2(w03d303Rcom, [3,3]);
w03d303R03 = imcomplement(w03d303R02);
w03d303R03_T120 = w03d303R03 > 105; % Arc_fosi % T105 <------------

w03d303B04_T120 = w03d303B04 > 120; % DAPI(B): pre2a
w03d303Afos1 = imfuse(w03d303R03_T120, w03d303B04_T120, 'blend');
w03d303Afos2 = w03d303Afos1 > 140; % Arc_fosi(R): final

%w03d303R_Acyt (R)
w03d303R03_T100 = w03d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w03d303Bdil1 = imdilate(w03d303B04, s);
w03d303Bdil2 = imfuse(w03d303Bdil1, w03d303B04, 'diff'); 
w03d303Bdil2_T30 = w03d303Bdil2 > 30; % DAPI(B): pre2b
w03d303Acyt1 = imfuse(w03d303R03_T100, w03d303Bdil2_T30, 'blend');
w03d303Acyt2 = w03d303Acyt1 > 140;
w03d303Acyt3 = bwareaopen(w03d303Acyt2, 3); % Arc_cytoplasm(R): final
w03d303Arc1 = imfuse(w03d303Afos2, w03d303Acyt3, 'blend');
w03d303Arc2 = w03d303Arc1 > 0;
w03d303Arc3 = imfuse(w03d303Arc2, w03d303Afos2, 'blend');
w03d303Arc4 = imfuse(w03d303Arc3, w03d303B04,'Colorchannel',[1 0 2]);
imwrite(w03d303Arc4, 'w03d303Arc.tif');


