%% Arc catFISH 

cre02d301B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d301B0.jpg');
cre02d301R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d301R0.jpg');
cre02d303B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d303B0.jpg');
cre02d303R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d303R0.jpg');
cre02d306B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d306B0.jpg');
cre02d306R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d306R0.jpg');
cre02d308B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d308B0.jpg');
cre02d308R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d308R0.jpg');
cre02d309B0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d309B0.jpg');
cre02d309R0 = imread('F:\02.catFISH\02.proc_catFISH\01.Arc1\01.dCA3\cre02d309R0.jpg');

cre02d301R = cre02d301R0(:,:,1);
cre02d301B = cre02d301B0(:,:,3);
cre02d303R = cre02d303R0(:,:,1);
cre02d303B = cre02d303B0(:,:,3);
cre02d306R = cre02d306R0(:,:,1);
cre02d306B = cre02d306B0(:,:,3);
cre02d308R = cre02d308R0(:,:,1);
cre02d308B = cre02d308B0(:,:,3);
cre02d309R = cre02d309R0(:,:,1);
cre02d309B = cre02d309B0(:,:,3);


%% cre02d301

%cre02d301B (B)
SE50 = strel('square',50);
cre02d301B01 = imtophat(cre02d301B, SE50);
cre02d301Baht = adapthisteq(cre02d301B01);
avg = ones(3,3)/9;
cre02d301Bmed = medfilt2(cre02d301Baht,[3,3]);
cre02d301B02 = imtophat(cre02d301Bmed,SE50);
cre02d301Bcom = imcomplement(cre02d301B02);
cre02d301B03 = medfilt2(cre02d301Bcom,[3,3]);
cre02d301B04 = imcomplement(cre02d301B03); % DAPI(B): pre1

%cre02d301R_Afos (R)
cre02d301R01 = imtophat(cre02d301R, SE50);
cre02d301Rcom = imcomplement(cre02d301R01);
cre02d301R02 = medfilt2(cre02d301Rcom, [3,3]);
cre02d301R03 = imcomplement(cre02d301R02);
cre02d301R03_T120 = cre02d301R03 > 105; % Arc_fosi % T105 <------------

cre02d301B04_T120 = cre02d301B04 > 120; % DAPI(B): pre2a
cre02d301Afos1 = imfuse(cre02d301R03_T120, cre02d301B04_T120, 'blend');
cre02d301Afos2 = cre02d301Afos1 > 140; % Arc_fosi(R): final

%cre02d301R_Acyt (R)
cre02d301R03_T100 = cre02d301R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre02d301Bdil1 = imdilate(cre02d301B04, s);
cre02d301Bdil2 = imfuse(cre02d301Bdil1, cre02d301B04, 'diff'); 
cre02d301Bdil2_T30 = cre02d301Bdil2 > 30; % DAPI(B): pre2b
cre02d301Acyt1 = imfuse(cre02d301R03_T100, cre02d301Bdil2_T30, 'blend');
cre02d301Acyt2 = cre02d301Acyt1 > 140;
cre02d301Acyt3 = bwareaopen(cre02d301Acyt2, 3); % Arc_cytoplasm(R): final
cre02d301Arc1 = imfuse(cre02d301Afos2, cre02d301Acyt3, 'blend');
cre02d301Arc2 = cre02d301Arc1 > 0;
cre02d301Arc3 = imfuse(cre02d301Arc2, cre02d301Afos2, 'blend');
cre02d301Arc4 = imfuse(cre02d301Arc3, cre02d301B04,'Colorchannel',[1 0 2]);
imwrite(cre02d301Arc4, 'cre02d301Arc.tif');


%% cre02d303

%cre02d303B (B)

cre02d303B01 = imtophat(cre02d303B, SE50);
cre02d303Baht = adapthisteq(cre02d303B01);

cre02d303Bmed = medfilt2(cre02d303Baht,[3,3]);
cre02d303B02 = imtophat(cre02d303Bmed,SE50);
cre02d303Bcom = imcomplement(cre02d303B02);
cre02d303B03 = medfilt2(cre02d303Bcom,[3,3]);
cre02d303B04 = imcomplement(cre02d303B03); % DAPI(B): pre1

%cre02d303R_Afos (R)
cre02d303R01 = imtophat(cre02d303R, SE50);
cre02d303Rcom = imcomplement(cre02d303R01);
cre02d303R02 = medfilt2(cre02d303Rcom, [3,3]);
cre02d303R03 = imcomplement(cre02d303R02);
cre02d303R03_T120 = cre02d303R03 > 105; % Arc_fosi % T105 <------------

cre02d303B04_T120 = cre02d303B04 > 120; % DAPI(B): pre2a
cre02d303Afos1 = imfuse(cre02d303R03_T120, cre02d303B04_T120, 'blend');
cre02d303Afos2 = cre02d303Afos1 > 140; % Arc_fosi(R): final

%cre02d303R_Acyt (R)
cre02d303R03_T100 = cre02d303R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre02d303Bdil1 = imdilate(cre02d303B04, s);
cre02d303Bdil2 = imfuse(cre02d303Bdil1, cre02d303B04, 'diff'); 
cre02d303Bdil2_T30 = cre02d303Bdil2 > 30; % DAPI(B): pre2b
cre02d303Acyt1 = imfuse(cre02d303R03_T100, cre02d303Bdil2_T30, 'blend');
cre02d303Acyt2 = cre02d303Acyt1 > 140;
cre02d303Acyt3 = bwareaopen(cre02d303Acyt2, 3); % Arc_cytoplasm(R): final
cre02d303Arc1 = imfuse(cre02d303Afos2, cre02d303Acyt3, 'blend');
cre02d303Arc2 = cre02d303Arc1 > 0;
cre02d303Arc3 = imfuse(cre02d303Arc2, cre02d303Afos2, 'blend');
cre02d303Arc4 = imfuse(cre02d303Arc3, cre02d303B04,'Colorchannel',[1 0 2]);
imwrite(cre02d303Arc4, 'cre02d303Arc.tif');


%% cre02d306

%cre02d306B (B)

cre02d306B01 = imtophat(cre02d306B, SE50);
cre02d306Baht = adapthisteq(cre02d306B01);

cre02d306Bmed = medfilt2(cre02d306Baht,[3,3]);
cre02d306B02 = imtophat(cre02d306Bmed,SE50);
cre02d306Bcom = imcomplement(cre02d306B02);
cre02d306B03 = medfilt2(cre02d306Bcom,[3,3]);
cre02d306B04 = imcomplement(cre02d306B03); % DAPI(B): pre1

%cre02d306R_Afos (R)
cre02d306R01 = imtophat(cre02d306R, SE50);
cre02d306Rcom = imcomplement(cre02d306R01);
cre02d306R02 = medfilt2(cre02d306Rcom, [3,3]);
cre02d306R03 = imcomplement(cre02d306R02);
cre02d306R03_T120 = cre02d306R03 > 105; % Arc_fosi % T105 <------------

cre02d306B04_T120 = cre02d306B04 > 120; % DAPI(B): pre2a
cre02d306Afos1 = imfuse(cre02d306R03_T120, cre02d306B04_T120, 'blend');
cre02d306Afos2 = cre02d306Afos1 > 140; % Arc_fosi(R): final

%cre02d306R_Acyt (R)
cre02d306R03_T100 = cre02d306R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre02d306Bdil1 = imdilate(cre02d306B04, s);
cre02d306Bdil2 = imfuse(cre02d306Bdil1, cre02d306B04, 'diff'); 
cre02d306Bdil2_T30 = cre02d306Bdil2 > 30; % DAPI(B): pre2b
cre02d306Acyt1 = imfuse(cre02d306R03_T100, cre02d306Bdil2_T30, 'blend');
cre02d306Acyt2 = cre02d306Acyt1 > 140;
cre02d306Acyt3 = bwareaopen(cre02d306Acyt2, 3); % Arc_cytoplasm(R): final
cre02d306Arc1 = imfuse(cre02d306Afos2, cre02d306Acyt3, 'blend');
cre02d306Arc2 = cre02d306Arc1 > 0;
cre02d306Arc3 = imfuse(cre02d306Arc2, cre02d306Afos2, 'blend');
cre02d306Arc4 = imfuse(cre02d306Arc3, cre02d306B04,'Colorchannel',[1 0 2]);
imwrite(cre02d306Arc4, 'cre02d306Arc.tif');

%% cre02d308

%cre02d308B (B)

cre02d308B01 = imtophat(cre02d308B, SE50);
cre02d308Baht = adapthisteq(cre02d308B01);

cre02d308Bmed = medfilt2(cre02d308Baht,[3,3]);
cre02d308B02 = imtophat(cre02d308Bmed,SE50);
cre02d308Bcom = imcomplement(cre02d308B02);
cre02d308B03 = medfilt2(cre02d308Bcom,[3,3]);
cre02d308B04 = imcomplement(cre02d308B03); % DAPI(B): pre1

%cre02d308R_Afos (R)
cre02d308R01 = imtophat(cre02d308R, SE50);
cre02d308Rcom = imcomplement(cre02d308R01);
cre02d308R02 = medfilt2(cre02d308Rcom, [3,3]);
cre02d308R03 = imcomplement(cre02d308R02);
cre02d308R03_T120 = cre02d308R03 > 105; % Arc_fosi % T105 <------------

cre02d308B04_T120 = cre02d308B04 > 120; % DAPI(B): pre2a
cre02d308Afos1 = imfuse(cre02d308R03_T120, cre02d308B04_T120, 'blend');
cre02d308Afos2 = cre02d308Afos1 > 140; % Arc_fosi(R): final

%cre02d308R_Acyt (R)
cre02d308R03_T100 = cre02d308R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre02d308Bdil1 = imdilate(cre02d308B04, s);
cre02d308Bdil2 = imfuse(cre02d308Bdil1, cre02d308B04, 'diff'); 
cre02d308Bdil2_T30 = cre02d308Bdil2 > 30; % DAPI(B): pre2b
cre02d308Acyt1 = imfuse(cre02d308R03_T100, cre02d308Bdil2_T30, 'blend');
cre02d308Acyt2 = cre02d308Acyt1 > 140;
cre02d308Acyt3 = bwareaopen(cre02d308Acyt2, 3); % Arc_cytoplasm(R): final
cre02d308Arc1 = imfuse(cre02d308Afos2, cre02d308Acyt3, 'blend');
cre02d308Arc2 = cre02d308Arc1 > 0;
cre02d308Arc3 = imfuse(cre02d308Arc2, cre02d308Afos2, 'blend');
cre02d308Arc4 = imfuse(cre02d308Arc3, cre02d308B04,'Colorchannel',[1 0 2]);
imwrite(cre02d308Arc4, 'cre02d308Arc.tif');

%% cre02d309

%cre02d309B (B)

cre02d309B01 = imtophat(cre02d309B, SE50);
cre02d309Baht = adapthisteq(cre02d309B01);

cre02d309Bmed = medfilt2(cre02d309Baht,[3,3]);
cre02d309B02 = imtophat(cre02d309Bmed,SE50);
cre02d309Bcom = imcomplement(cre02d309B02);
cre02d309B03 = medfilt2(cre02d309Bcom,[3,3]);
cre02d309B04 = imcomplement(cre02d309B03); % DAPI(B): pre1

%cre02d309R_Afos (R)
cre02d309R01 = imtophat(cre02d309R, SE50);
cre02d309Rcom = imcomplement(cre02d309R01);
cre02d309R02 = medfilt2(cre02d309Rcom, [3,3]);
cre02d309R03 = imcomplement(cre02d309R02);
cre02d309R03_T120 = cre02d309R03 > 105; % Arc_fosi % T105 <------------

cre02d309B04_T120 = cre02d309B04 > 120; % DAPI(B): pre2a
cre02d309Afos1 = imfuse(cre02d309R03_T120, cre02d309B04_T120, 'blend');
cre02d309Afos2 = cre02d309Afos1 > 140; % Arc_fosi(R): final

%cre02d309R_Acyt (R)
cre02d309R03_T100 = cre02d309R03 > 95; % Arc_cyto % T95 <------------

s = strel('disk', 2);
cre02d309Bdil1 = imdilate(cre02d309B04, s);
cre02d309Bdil2 = imfuse(cre02d309Bdil1, cre02d309B04, 'diff'); 
cre02d309Bdil2_T30 = cre02d309Bdil2 > 30; % DAPI(B): pre2b
cre02d309Acyt1 = imfuse(cre02d309R03_T100, cre02d309Bdil2_T30, 'blend');
cre02d309Acyt2 = cre02d309Acyt1 > 140;
cre02d309Acyt3 = bwareaopen(cre02d309Acyt2, 3); % Arc_cytoplasm(R): final
cre02d309Arc1 = imfuse(cre02d309Afos2, cre02d309Acyt3, 'blend');
cre02d309Arc2 = cre02d309Arc1 > 0;
cre02d309Arc3 = imfuse(cre02d309Arc2, cre02d309Afos2, 'blend');
cre02d309Arc4 = imfuse(cre02d309Arc3, cre02d309B04,'Colorchannel',[1 0 2]);
imwrite(cre02d309Arc4, 'cre02d309Arc.tif');

