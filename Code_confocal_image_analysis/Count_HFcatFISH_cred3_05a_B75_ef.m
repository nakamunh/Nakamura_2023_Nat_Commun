%% H1a-Fos catFISH  cre06d301e
% Freehand drawing and extraction
cre06d301eI = imread('cre06d301eHFB2.tif');
figure
imshow(cre06d301eI)
cre06d301eh = drawfreehand;
cre06d301eBW = createMask(cre06d301eh);
cre06d301eJ = cre06d301eI.*uint8(cre06d301eBW);
figure
imshow(cre06d301eJ)

% DAPI
cre06d301eBW2 = cre06d301eJ(:,:,3) >= 75; %% <----- 30 or 100
cre06d301eBW3 = bwareaopen(cre06d301eBW2, 50);
cre06d301eBW4 = imfill(cre06d301eBW3, 'holes');
cre06d301eDa = bwlabel(cre06d301eBW4, 4);
imwrite(cre06d301eDa,'cre06d301eDa.tif');
max(cre06d301eDa(:))

% H1a 
cre06d301eK = cre06d301eJ(:,:,1);
imwrite(cre06d301eK,'cre06d301eK.tif');
s = strel('disk', 2);
for n = 1:max(cre06d301eDa(:))
    cre06d301eKBW = cre06d301eDa == n;
    cre06d301eres(n,1) = nnz((cre06d301eK == 255).*cre06d301eKBW); % H1a fosi
end

% Fos
cre06d301eL = cre06d301eJ(:,:,2);
imwrite(cre06d301eL,'cre06d301eL.tif');
for n = 1:max(cre06d301eDa(:))
    cre06d301eLBW = cre06d301eDa == n;
    cre06d301eres(n,2) = nnz((cre06d301eL == 255).*cre06d301eLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d301f
% Freehand drawing and extraction
cre06d301fI = imread('cre06d301fHFB2.tif');
figure
imshow(cre06d301fI)
cre06d301fh = drawfreehand;
cre06d301fBW = createMask(cre06d301fh);
cre06d301fJ = cre06d301fI.*uint8(cre06d301fBW);
figure
imshow(cre06d301fJ)

% DAPI
cre06d301fBW2 = cre06d301fJ(:,:,3) >= 75; %% <----- 30 or 100
cre06d301fBW3 = bwareaopen(cre06d301fBW2, 50);
cre06d301fBW4 = imfill(cre06d301fBW3, 'holes');
cre06d301fDa = bwlabel(cre06d301fBW4, 4);
imwrite(cre06d301fDa,'cre06d301fDa.tif');
max(cre06d301fDa(:))

% H1a 
cre06d301fK = cre06d301fJ(:,:,1);
imwrite(cre06d301fK,'cre06d301fK.tif');
s = strel('disk', 2);
for n = 1:max(cre06d301fDa(:))
    cre06d301fKBW = cre06d301fDa == n;
    cre06d301fres(n,1) = nnz((cre06d301fK == 255).*cre06d301fKBW); % H1a fosi
end

% Fos
cre06d301fL = cre06d301fJ(:,:,2);
imwrite(cre06d301fL,'cre06d301fL.tif');
for n = 1:max(cre06d301fDa(:))
    cre06d301fLBW = cre06d301fDa == n;
    cre06d301fres(n,2) = nnz((cre06d301fL == 255).*cre06d301fLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d302e
% Freehand drawing and extraction
cre06d302eI = imread('cre06d302eHFB2.tif');
figure
imshow(cre06d302eI)
cre06d302eh = drawfreehand;
cre06d302eBW = createMask(cre06d302eh);
cre06d302eJ = cre06d302eI.*uint8(cre06d302eBW);
figure
imshow(cre06d302eJ)

% DAPI
cre06d302eBW2 = cre06d302eJ(:,:,3) >= 75; %% <----- 30 or 100
cre06d302eBW3 = bwareaopen(cre06d302eBW2, 50);
cre06d302eBW4 = imfill(cre06d302eBW3, 'holes');
cre06d302eDa = bwlabel(cre06d302eBW4, 4);
imwrite(cre06d302eDa,'cre06d302eDa.tif');
max(cre06d302eDa(:))

% H1a 
cre06d302eK = cre06d302eJ(:,:,1);
imwrite(cre06d302eK,'cre06d302eK.tif');
s = strel('disk', 2);
for n = 1:max(cre06d302eDa(:))
    cre06d302eKBW = cre06d302eDa == n;
    cre06d302eres(n,1) = nnz((cre06d302eK == 255).*cre06d302eKBW); % H1a fosi
end

% Fos
cre06d302eL = cre06d302eJ(:,:,2);
imwrite(cre06d302eL,'cre06d302eL.tif');
for n = 1:max(cre06d302eDa(:))
    cre06d302eLBW = cre06d302eDa == n;
    cre06d302eres(n,2) = nnz((cre06d302eL == 255).*cre06d302eLBW); % Fos fosi
end






%% H1a-Fos catFISH  cre06d301g
% Freehand drawing and extraction
cre06d301gI = imread('cre06d301gHFB2.tif');
figure
imshow(cre06d301gI)
cre06d301gh = drawfreehand;
cre06d301gBW = createMask(cre06d301gh);
cre06d301gJ = cre06d301gI.*uint8(cre06d301gBW);
figure
imshow(cre06d301gJ)

% DAPI
cre06d301gBW2 = cre06d301gJ(:,:,3) >= 75; %% <----- 30 or 100
cre06d301gBW3 = bwareaopen(cre06d301gBW2, 50);
cre06d301gBW4 = imfill(cre06d301gBW3, 'holes');
cre06d301gDa = bwlabel(cre06d301gBW4, 4);
imwrite(cre06d301gDa,'cre06d301gDa.tif');
max(cre06d301gDa(:))

% H1a 
cre06d301gK = cre06d301gJ(:,:,1);
imwrite(cre06d301gK,'cre06d301gK.tif');
s = strel('disk', 2);
for n = 1:max(cre06d301gDa(:))
    cre06d301gKBW = cre06d301gDa == n;
    cre06d301gres(n,1) = nnz((cre06d301gK == 255).*cre06d301gKBW); % H1a fosi
end

% Fos
cre06d301gL = cre06d301gJ(:,:,2);
imwrite(cre06d301gL,'cre06d301gL.tif');
for n = 1:max(cre06d301gDa(:))
    cre06d301gLBW = cre06d301gDa == n;
    cre06d301gres(n,2) = nnz((cre06d301gL == 255).*cre06d301gLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d301i
% Freehand drawing and extraction
cre06d301iI = imread('cre06d301iHFB2.tif');
figure
imshow(cre06d301iI)
cre06d301ih = drawfreehand;
cre06d301iBW = createMask(cre06d301ih);
cre06d301iJ = cre06d301iI.*uint8(cre06d301iBW);
figure
imshow(cre06d301iJ)

% DAPI
cre06d301iBW2 = cre06d301iJ(:,:,3) >= 75; %% <----- 30 or 100
cre06d301iBW3 = bwareaopen(cre06d301iBW2, 50);
cre06d301iBW4 = imfill(cre06d301iBW3, 'holes');
cre06d301iDa = bwlabel(cre06d301iBW4, 4);
imwrite(cre06d301iDa,'cre06d301iDa.tif');
max(cre06d301iDa(:))

% H1a 
cre06d301iK = cre06d301iJ(:,:,1);
imwrite(cre06d301iK,'cre06d301iK.tif');
s = strel('disk', 2);
for n = 1:max(cre06d301iDa(:))
    cre06d301iKBW = cre06d301iDa == n;
    cre06d301ires(n,1) = nnz((cre06d301iK == 255).*cre06d301iKBW); % H1a fosi
end

% Fos
cre06d301iL = cre06d301iJ(:,:,2);
imwrite(cre06d301iL,'cre06d301iL.tif');
for n = 1:max(cre06d301iDa(:))
    cre06d301iLBW = cre06d301iDa == n;
    cre06d301ires(n,2) = nnz((cre06d301iL == 255).*cre06d301iLBW); % Fos fosi
end



%% H1a-Fos catFISH  w05d303e
% Freehand drawing and extraction
w05d303eI = imread('w05d303eHFB2.tif');
figure
imshow(w05d303eI)
w05d303eh = drawfreehand;
w05d303eBW = createMask(w05d303eh);
w05d303eJ = w05d303eI.*uint8(w05d303eBW);
figure
imshow(w05d303eJ)

% DAPI
w05d303eBW2 = w05d303eJ(:,:,3) >= 75; %% <----- 30 or 100
w05d303eBW3 = bwareaopen(w05d303eBW2, 50);
w05d303eBW4 = imfill(w05d303eBW3, 'holes');
w05d303eDa = bwlabel(w05d303eBW4, 4);
imwrite(w05d303eDa,'w05d303eDa.tif');
max(w05d303eDa(:))

% H1a 
w05d303eK = w05d303eJ(:,:,1);
imwrite(w05d303eK,'w05d303eK.tif');
s = strel('disk', 2);
for n = 1:max(w05d303eDa(:))
    w05d303eKBW = w05d303eDa == n;
    w05d303eres(n,1) = nnz((w05d303eK == 255).*w05d303eKBW); % H1a fosi
end

% Fos
w05d303eL = w05d303eJ(:,:,2);
imwrite(w05d303eL,'w05d303eL.tif');
for n = 1:max(w05d303eDa(:))
    w05d303eLBW = w05d303eDa == n;
    w05d303eres(n,2) = nnz((w05d303eL == 255).*w05d303eLBW); % Fos fosi
end

