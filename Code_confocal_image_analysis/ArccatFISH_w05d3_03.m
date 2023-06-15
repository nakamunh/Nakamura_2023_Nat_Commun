%% Arc catFISH 

w05d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d301B0.jpg');
w05d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d301R0.jpg');
w05d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d302B0.jpg');
w05d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d302R0.jpg');
w05d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d303B0.jpg');
w05d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w05d303R0.jpg');

w05d301R = w05d301R0(:,:,1);
w05d301B = w05d301B0(:,:,3);
w05d302R = w05d302R0(:,:,1);
w05d302B = w05d302B0(:,:,3);
w05d303R = w05d303R0(:,:,1);
w05d303B = w05d303B0(:,:,3);


%% w05d301

%w05d301B (B)
SE50 = strel('square',50);
w05d301B01 = imtophat(w05d301B, SE50);
w05d301Baht = adapthisteq(w05d301B01);
avg = ones(3,3)/9;
w05d301Bmed = medfilt2(w05d301Baht,[3,3]);
w05d301B02 = imtophat(w05d301Bmed,SE50);
w05d301Bcom = imcomplement(w05d301B02);
w05d301B03 = medfilt2(w05d301Bcom,[3,3]);
w05d301B04 = imcomplement(w05d301B03); % DAPI(B): pre1

%w05d301R_Afos (R)
w05d301R01 = imtophat(w05d301R, SE50);
w05d301Rcom = imcomplement(w05d301R01);
w05d301R02 = medfilt2(w05d301Rcom, [3,3]);
w05d301R03 = imcomplement(w05d301R02);
w05d301R03_T120 = w05d301R03 > 105; % Arc_fosi % T105 <------------

w05d301B04_T120 = w05d301B04 > 120; % DAPI(B): pre2a
w05d301Afos1 = imfuse(w05d301R03_T120, w05d301B04_T120, 'blend');
w05d301Afos2 = w05d301Afos1 > 140; % Arc_fosi(R): final

%w05d301R_Acyt (R)
w05d301R03_T100 = w05d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w05d301Bdil1 = imdilate(w05d301B04, s);
w05d301Bdil2 = imfuse(w05d301Bdil1, w05d301B04, 'diff'); 
w05d301Bdil2_T30 = w05d301Bdil2 > 30; % DAPI(B): pre2b
w05d301Acyt1 = imfuse(w05d301R03_T100, w05d301Bdil2_T30, 'blend');
w05d301Acyt2 = w05d301Acyt1 > 140;
w05d301Acyt3 = bwareaopen(w05d301Acyt2, 3); % Arc_cytoplasm(R): final
w05d301Arc1 = imfuse(w05d301Afos2, w05d301Acyt3, 'blend');
w05d301Arc2 = w05d301Arc1 > 0;
w05d301Arc3 = imfuse(w05d301Arc2, w05d301Afos2, 'blend');
w05d301Arc4 = imfuse(w05d301Arc3, w05d301B04,'Colorchannel',[1 0 2]);
imwrite(w05d301Arc4, 'w05d301Arc.tif');


%% w05d302

%w05d302B (B)

w05d302B01 = imtophat(w05d302B, SE50);
w05d302Baht = adapthisteq(w05d302B01);

w05d302Bmed = medfilt2(w05d302Baht,[3,3]);
w05d302B02 = imtophat(w05d302Bmed,SE50);
w05d302Bcom = imcomplement(w05d302B02);
w05d302B03 = medfilt2(w05d302Bcom,[3,3]);
w05d302B04 = imcomplement(w05d302B03); % DAPI(B): pre1

%w05d302R_Afos (R)
w05d302R01 = imtophat(w05d302R, SE50);
w05d302Rcom = imcomplement(w05d302R01);
w05d302R02 = medfilt2(w05d302Rcom, [3,3]);
w05d302R03 = imcomplement(w05d302R02);
w05d302R03_T120 = w05d302R03 > 105; % Arc_fosi % T105 <------------

w05d302B04_T120 = w05d302B04 > 120; % DAPI(B): pre2a
w05d302Afos1 = imfuse(w05d302R03_T120, w05d302B04_T120, 'blend');
w05d302Afos2 = w05d302Afos1 > 140; % Arc_fosi(R): final

%w05d302R_Acyt (R)
w05d302R03_T100 = w05d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w05d302Bdil1 = imdilate(w05d302B04, s);
w05d302Bdil2 = imfuse(w05d302Bdil1, w05d302B04, 'diff'); 
w05d302Bdil2_T30 = w05d302Bdil2 > 30; % DAPI(B): pre2b
w05d302Acyt1 = imfuse(w05d302R03_T100, w05d302Bdil2_T30, 'blend');
w05d302Acyt2 = w05d302Acyt1 > 140;
w05d302Acyt3 = bwareaopen(w05d302Acyt2, 3); % Arc_cytoplasm(R): final
w05d302Arc1 = imfuse(w05d302Afos2, w05d302Acyt3, 'blend');
w05d302Arc2 = w05d302Arc1 > 0;
w05d302Arc3 = imfuse(w05d302Arc2, w05d302Afos2, 'blend');
w05d302Arc4 = imfuse(w05d302Arc3, w05d302B04,'Colorchannel',[1 0 2]);
imwrite(w05d302Arc4, 'w05d302Arc.tif');


%% w05d303

%w05d303B (B)

w05d303B01 = imtophat(w05d303B, SE50);
w05d303Baht = adapthisteq(w05d303B01);

w05d303Bmed = medfilt2(w05d303Baht,[3,3]);
w05d303B02 = imtophat(w05d303Bmed,SE50);
w05d303Bcom = imcomplement(w05d303B02);
w05d303B03 = medfilt2(w05d303Bcom,[3,3]);
w05d303B04 = imcomplement(w05d303B03); % DAPI(B): pre1

%w05d303R_Afos (R)
w05d303R01 = imtophat(w05d303R, SE50);
w05d303Rcom = imcomplement(w05d303R01);
w05d303R02 = medfilt2(w05d303Rcom, [3,3]);
w05d303R03 = imcomplement(w05d303R02);
w05d303R03_T120 = w05d303R03 > 105; % Arc_fosi % T105 <------------

w05d303B04_T120 = w05d303B04 > 120; % DAPI(B): pre2a
w05d303Afos1 = imfuse(w05d303R03_T120, w05d303B04_T120, 'blend');
w05d303Afos2 = w05d303Afos1 > 140; % Arc_fosi(R): final

%w05d303R_Acyt (R)
w05d303R03_T100 = w05d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w05d303Bdil1 = imdilate(w05d303B04, s);
w05d303Bdil2 = imfuse(w05d303Bdil1, w05d303B04, 'diff'); 
w05d303Bdil2_T30 = w05d303Bdil2 > 30; % DAPI(B): pre2b
w05d303Acyt1 = imfuse(w05d303R03_T100, w05d303Bdil2_T30, 'blend');
w05d303Acyt2 = w05d303Acyt1 > 140;
w05d303Acyt3 = bwareaopen(w05d303Acyt2, 3); % Arc_cytoplasm(R): final
w05d303Arc1 = imfuse(w05d303Afos2, w05d303Acyt3, 'blend');
w05d303Arc2 = w05d303Arc1 > 0;
w05d303Arc3 = imfuse(w05d303Arc2, w05d303Afos2, 'blend');
w05d303Arc4 = imfuse(w05d303Arc3, w05d303B04,'Colorchannel',[1 0 2]);
imwrite(w05d303Arc4, 'w05d303Arc.tif');


