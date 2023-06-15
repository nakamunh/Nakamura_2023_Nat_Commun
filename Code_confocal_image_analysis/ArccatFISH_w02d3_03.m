%% Arc catFISH 

w02d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d301B0.jpg');
w02d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d301R0.jpg');
w02d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d303B0.jpg');
w02d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d303R0.jpg');
w02d304B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d304B0.jpg');
w02d304R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\w02d304R0.jpg');

w02d301R = w02d301R0(:,:,1);
w02d301B = w02d301B0(:,:,3);
w02d303R = w02d303R0(:,:,1);
w02d303B = w02d303B0(:,:,3);
w02d304R = w02d304R0(:,:,1);
w02d304B = w02d304B0(:,:,3);


%% w02d301

%w02d301B (B)
SE50 = strel('square',50);
w02d301B01 = imtophat(w02d301B, SE50);
w02d301Baht = adapthisteq(w02d301B01);
avg = ones(3,3)/9;
w02d301Bmed = medfilt2(w02d301Baht,[3,3]);
w02d301B02 = imtophat(w02d301Bmed,SE50);
w02d301Bcom = imcomplement(w02d301B02);
w02d301B03 = medfilt2(w02d301Bcom,[3,3]);
w02d301B04 = imcomplement(w02d301B03); % DAPI(B): pre1

%w02d301R_Afos (R)
w02d301R01 = imtophat(w02d301R, SE50);
w02d301Rcom = imcomplement(w02d301R01);
w02d301R02 = medfilt2(w02d301Rcom, [3,3]);
w02d301R03 = imcomplement(w02d301R02);
w02d301R03_T120 = w02d301R03 > 105; % Arc_fosi % T105 <------------

w02d301B04_T120 = w02d301B04 > 120; % DAPI(B): pre2a
w02d301Afos1 = imfuse(w02d301R03_T120, w02d301B04_T120, 'blend');
w02d301Afos2 = w02d301Afos1 > 140; % Arc_fosi(R): final

%w02d301R_Acyt (R)
w02d301R03_T100 = w02d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w02d301Bdil1 = imdilate(w02d301B04, s);
w02d301Bdil2 = imfuse(w02d301Bdil1, w02d301B04, 'diff'); 
w02d301Bdil2_T30 = w02d301Bdil2 > 30; % DAPI(B): pre2b
w02d301Acyt1 = imfuse(w02d301R03_T100, w02d301Bdil2_T30, 'blend');
w02d301Acyt2 = w02d301Acyt1 > 140;
w02d301Acyt3 = bwareaopen(w02d301Acyt2, 3); % Arc_cytoplasm(R): final
w02d301Arc1 = imfuse(w02d301Afos2, w02d301Acyt3, 'blend');
w02d301Arc2 = w02d301Arc1 > 0;
w02d301Arc3 = imfuse(w02d301Arc2, w02d301Afos2, 'blend');
w02d301Arc4 = imfuse(w02d301Arc3, w02d301B04,'Colorchannel',[1 0 2]);
imwrite(w02d301Arc4, 'w02d301Arc.tif');



%% w02d303

%w02d303B (B)

w02d303B01 = imtophat(w02d303B, SE50);
w02d303Baht = adapthisteq(w02d303B01);

w02d303Bmed = medfilt2(w02d303Baht,[3,3]);
w02d303B02 = imtophat(w02d303Bmed,SE50);
w02d303Bcom = imcomplement(w02d303B02);
w02d303B03 = medfilt2(w02d303Bcom,[3,3]);
w02d303B04 = imcomplement(w02d303B03); % DAPI(B): pre1

%w02d303R_Afos (R)
w02d303R01 = imtophat(w02d303R, SE50);
w02d303Rcom = imcomplement(w02d303R01);
w02d303R02 = medfilt2(w02d303Rcom, [3,3]);
w02d303R03 = imcomplement(w02d303R02);
w02d303R03_T120 = w02d303R03 > 105; % Arc_fosi % T105 <------------

w02d303B04_T120 = w02d303B04 > 120; % DAPI(B): pre2a
w02d303Afos1 = imfuse(w02d303R03_T120, w02d303B04_T120, 'blend');
w02d303Afos2 = w02d303Afos1 > 140; % Arc_fosi(R): final

%w02d303R_Acyt (R)
w02d303R03_T100 = w02d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w02d303Bdil1 = imdilate(w02d303B04, s);
w02d303Bdil2 = imfuse(w02d303Bdil1, w02d303B04, 'diff'); 
w02d303Bdil2_T30 = w02d303Bdil2 > 30; % DAPI(B): pre2b
w02d303Acyt1 = imfuse(w02d303R03_T100, w02d303Bdil2_T30, 'blend');
w02d303Acyt2 = w02d303Acyt1 > 140;
w02d303Acyt3 = bwareaopen(w02d303Acyt2, 3); % Arc_cytoplasm(R): final
w02d303Arc1 = imfuse(w02d303Afos2, w02d303Acyt3, 'blend');
w02d303Arc2 = w02d303Arc1 > 0;
w02d303Arc3 = imfuse(w02d303Arc2, w02d303Afos2, 'blend');
w02d303Arc4 = imfuse(w02d303Arc3, w02d303B04,'Colorchannel',[1 0 2]);
imwrite(w02d303Arc4, 'w02d303Arc.tif');


%% w02d304

%w02d304B (B)

w02d304B01 = imtophat(w02d304B, SE50);
w02d304Baht = adapthisteq(w02d304B01);

w02d304Bmed = medfilt2(w02d304Baht,[3,3]);
w02d304B02 = imtophat(w02d304Bmed,SE50);
w02d304Bcom = imcomplement(w02d304B02);
w02d304B03 = medfilt2(w02d304Bcom,[3,3]);
w02d304B04 = imcomplement(w02d304B03); % DAPI(B): pre1

%w02d304R_Afos (R)
w02d304R01 = imtophat(w02d304R, SE50);
w02d304Rcom = imcomplement(w02d304R01);
w02d304R02 = medfilt2(w02d304Rcom, [3,3]);
w02d304R03 = imcomplement(w02d304R02);
w02d304R03_T120 = w02d304R03 > 105; % Arc_fosi % T105 <------------

w02d304B04_T120 = w02d304B04 > 120; % DAPI(B): pre2a
w02d304Afos1 = imfuse(w02d304R03_T120, w02d304B04_T120, 'blend');
w02d304Afos2 = w02d304Afos1 > 140; % Arc_fosi(R): final

%w02d304R_Acyt (R)
w02d304R03_T100 = w02d304R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
w02d304Bdil1 = imdilate(w02d304B04, s);
w02d304Bdil2 = imfuse(w02d304Bdil1, w02d304B04, 'diff'); 
w02d304Bdil2_T30 = w02d304Bdil2 > 30; % DAPI(B): pre2b
w02d304Acyt1 = imfuse(w02d304R03_T100, w02d304Bdil2_T30, 'blend');
w02d304Acyt2 = w02d304Acyt1 > 140;
w02d304Acyt3 = bwareaopen(w02d304Acyt2, 3); % Arc_cytoplasm(R): final
w02d304Arc1 = imfuse(w02d304Afos2, w02d304Acyt3, 'blend');
w02d304Arc2 = w02d304Arc1 > 0;
w02d304Arc3 = imfuse(w02d304Arc2, w02d304Afos2, 'blend');
w02d304Arc4 = imfuse(w02d304Arc3, w02d304B04,'Colorchannel',[1 0 2]);
imwrite(w02d304Arc4, 'w02d304Arc.tif');


