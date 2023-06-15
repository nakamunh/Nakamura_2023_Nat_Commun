%% Arc catFISH 

w01d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d301B0.jpg');
w01d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d301R0.jpg');
w01d302B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d302B0.jpg');
w01d302R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d302R0.jpg');
w01d304B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d304B0.jpg');
w01d304R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d304R0.jpg');
w01d305B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d305B0.jpg');
w01d305R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w01d305R0.jpg');

w01d301R = w01d301R0(:,:,1);
w01d301B = w01d301B0(:,:,3);
w01d302R = w01d302R0(:,:,1);
w01d302B = w01d302B0(:,:,3);
w01d304R = w01d304R0(:,:,1);
w01d304B = w01d304B0(:,:,3);
w01d305R = w01d305R0(:,:,1);
w01d305B = w01d305B0(:,:,3);


%% w01d301

%w01d301B (B)
SE50 = strel('square',50);
w01d301B01 = imtophat(w01d301B, SE50);
w01d301Baht = adapthisteq(w01d301B01);
avg = ones(3,3)/9;
w01d301Bmed = medfilt2(w01d301Baht,[3,3]);
w01d301B02 = imtophat(w01d301Bmed,SE50);
w01d301Bcom = imcomplement(w01d301B02);
w01d301B03 = medfilt2(w01d301Bcom,[3,3]);
w01d301B04 = imcomplement(w01d301B03); % DAPI(B): pre1

%w01d301R_Afos (R)
w01d301R01 = imtophat(w01d301R, SE50);
w01d301Rcom = imcomplement(w01d301R01);
w01d301R02 = medfilt2(w01d301Rcom, [3,3]);
w01d301R03 = imcomplement(w01d301R02);
w01d301R03_T120 = w01d301R03 > 105; % Arc_fosi % T105 <------------

w01d301B04_T120 = w01d301B04 > 120; % DAPI(B): pre2a
w01d301Afos1 = imfuse(w01d301R03_T120, w01d301B04_T120, 'blend');
w01d301Afos2 = w01d301Afos1 > 140; % Arc_fosi(R): final

%w01d301R_Acyt (R)
w01d301R03_T100 = w01d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w01d301Bdil1 = imdilate(w01d301B04, s);
w01d301Bdil2 = imfuse(w01d301Bdil1, w01d301B04, 'diff'); 
w01d301Bdil2_T30 = w01d301Bdil2 > 30; % DAPI(B): pre2b
w01d301Acyt1 = imfuse(w01d301R03_T100, w01d301Bdil2_T30, 'blend');
w01d301Acyt2 = w01d301Acyt1 > 140;
w01d301Acyt3 = bwareaopen(w01d301Acyt2, 3); % Arc_cytoplasm(R): final
w01d301Arc1 = imfuse(w01d301Afos2, w01d301Acyt3, 'blend');
w01d301Arc2 = w01d301Arc1 > 0;
w01d301Arc3 = imfuse(w01d301Arc2, w01d301Afos2, 'blend');
w01d301Arc4 = imfuse(w01d301Arc3, w01d301B04,'Colorchannel',[1 0 2]);
imwrite(w01d301Arc4, 'w01d301Arc.tif');



%% w01d302

%w01d302B (B)

w01d302B01 = imtophat(w01d302B, SE50);
w01d302Baht = adapthisteq(w01d302B01);

w01d302Bmed = medfilt2(w01d302Baht,[3,3]);
w01d302B02 = imtophat(w01d302Bmed,SE50);
w01d302Bcom = imcomplement(w01d302B02);
w01d302B03 = medfilt2(w01d302Bcom,[3,3]);
w01d302B04 = imcomplement(w01d302B03); % DAPI(B): pre1

%w01d302R_Afos (R)
w01d302R01 = imtophat(w01d302R, SE50);
w01d302Rcom = imcomplement(w01d302R01);
w01d302R02 = medfilt2(w01d302Rcom, [3,3]);
w01d302R03 = imcomplement(w01d302R02);
w01d302R03_T120 = w01d302R03 > 105; % Arc_fosi % T105 <------------

w01d302B04_T120 = w01d302B04 > 120; % DAPI(B): pre2a
w01d302Afos1 = imfuse(w01d302R03_T120, w01d302B04_T120, 'blend');
w01d302Afos2 = w01d302Afos1 > 140; % Arc_fosi(R): final

%w01d302R_Acyt (R)
w01d302R03_T100 = w01d302R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w01d302Bdil1 = imdilate(w01d302B04, s);
w01d302Bdil2 = imfuse(w01d302Bdil1, w01d302B04, 'diff'); 
w01d302Bdil2_T30 = w01d302Bdil2 > 30; % DAPI(B): pre2b
w01d302Acyt1 = imfuse(w01d302R03_T100, w01d302Bdil2_T30, 'blend');
w01d302Acyt2 = w01d302Acyt1 > 140;
w01d302Acyt3 = bwareaopen(w01d302Acyt2, 3); % Arc_cytoplasm(R): final
w01d302Arc1 = imfuse(w01d302Afos2, w01d302Acyt3, 'blend');
w01d302Arc2 = w01d302Arc1 > 0;
w01d302Arc3 = imfuse(w01d302Arc2, w01d302Afos2, 'blend');
w01d302Arc4 = imfuse(w01d302Arc3, w01d302B04,'Colorchannel',[1 0 2]);
imwrite(w01d302Arc4, 'w01d302Arc.tif');



%% w01d304

%w01d304B (B)

w01d304B01 = imtophat(w01d304B, SE50);
w01d304Baht = adapthisteq(w01d304B01);

w01d304Bmed = medfilt2(w01d304Baht,[3,3]);
w01d304B02 = imtophat(w01d304Bmed,SE50);
w01d304Bcom = imcomplement(w01d304B02);
w01d304B03 = medfilt2(w01d304Bcom,[3,3]);
w01d304B04 = imcomplement(w01d304B03); % DAPI(B): pre1

%w01d304R_Afos (R)
w01d304R01 = imtophat(w01d304R, SE50);
w01d304Rcom = imcomplement(w01d304R01);
w01d304R02 = medfilt2(w01d304Rcom, [3,3]);
w01d304R03 = imcomplement(w01d304R02);
w01d304R03_T120 = w01d304R03 > 105; % Arc_fosi % T105 <------------

w01d304B04_T120 = w01d304B04 > 120; % DAPI(B): pre2a
w01d304Afos1 = imfuse(w01d304R03_T120, w01d304B04_T120, 'blend');
w01d304Afos2 = w01d304Afos1 > 140; % Arc_fosi(R): final

%w01d304R_Acyt (R)
w01d304R03_T100 = w01d304R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w01d304Bdil1 = imdilate(w01d304B04, s);
w01d304Bdil2 = imfuse(w01d304Bdil1, w01d304B04, 'diff'); 
w01d304Bdil2_T30 = w01d304Bdil2 > 30; % DAPI(B): pre2b
w01d304Acyt1 = imfuse(w01d304R03_T100, w01d304Bdil2_T30, 'blend');
w01d304Acyt2 = w01d304Acyt1 > 140;
w01d304Acyt3 = bwareaopen(w01d304Acyt2, 3); % Arc_cytoplasm(R): final
w01d304Arc1 = imfuse(w01d304Afos2, w01d304Acyt3, 'blend');
w01d304Arc2 = w01d304Arc1 > 0;
w01d304Arc3 = imfuse(w01d304Arc2, w01d304Afos2, 'blend');
w01d304Arc4 = imfuse(w01d304Arc3, w01d304B04,'Colorchannel',[1 0 2]);
imwrite(w01d304Arc4, 'w01d304Arc.tif');


%% w01d305

%w01d305B (B)

w01d305B01 = imtophat(w01d305B, SE50);
w01d305Baht = adapthisteq(w01d305B01);

w01d305Bmed = medfilt2(w01d305Baht,[3,3]);
w01d305B02 = imtophat(w01d305Bmed,SE50);
w01d305Bcom = imcomplement(w01d305B02);
w01d305B03 = medfilt2(w01d305Bcom,[3,3]);
w01d305B04 = imcomplement(w01d305B03); % DAPI(B): pre1

%w01d305R_Afos (R)
w01d305R01 = imtophat(w01d305R, SE50);
w01d305Rcom = imcomplement(w01d305R01);
w01d305R02 = medfilt2(w01d305Rcom, [3,3]);
w01d305R03 = imcomplement(w01d305R02);
w01d305R03_T120 = w01d305R03 > 105; % Arc_fosi % T105 <------------

w01d305B04_T120 = w01d305B04 > 120; % DAPI(B): pre2a
w01d305Afos1 = imfuse(w01d305R03_T120, w01d305B04_T120, 'blend');
w01d305Afos2 = w01d305Afos1 > 140; % Arc_fosi(R): final

%w01d305R_Acyt (R)
w01d305R03_T100 = w01d305R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w01d305Bdil1 = imdilate(w01d305B04, s);
w01d305Bdil2 = imfuse(w01d305Bdil1, w01d305B04, 'diff'); 
w01d305Bdil2_T30 = w01d305Bdil2 > 30; % DAPI(B): pre2b
w01d305Acyt1 = imfuse(w01d305R03_T100, w01d305Bdil2_T30, 'blend');
w01d305Acyt2 = w01d305Acyt1 > 140;
w01d305Acyt3 = bwareaopen(w01d305Acyt2, 3); % Arc_cytoplasm(R): final
w01d305Arc1 = imfuse(w01d305Afos2, w01d305Acyt3, 'blend');
w01d305Arc2 = w01d305Arc1 > 0;
w01d305Arc3 = imfuse(w01d305Arc2, w01d305Afos2, 'blend');
w01d305Arc4 = imfuse(w01d305Arc3, w01d305B04,'Colorchannel',[1 0 2]);
imwrite(w01d305Arc4, 'w01d305Arc.tif');


