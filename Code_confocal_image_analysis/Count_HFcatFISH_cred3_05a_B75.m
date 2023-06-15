%% H1a-Fos catFISH  cre01d301
% Freehand drawing and extraction
cre01d301I = imread('cre01d301HFB2.tif');
figure
imshow(cre01d301I)
cre01d301h = drawfreehand;
cre01d301BW = createMask(cre01d301h);
cre01d301J = cre01d301I.*uint8(cre01d301BW);
figure
imshow(cre01d301J)

% DAPI
cre01d301BW2 = cre01d301J(:,:,3) >= 75; %% <----- 30 or 100
cre01d301BW3 = bwareaopen(cre01d301BW2, 50);
cre01d301BW4 = imfill(cre01d301BW3, 'holes');
cre01d301Da = bwlabel(cre01d301BW4, 4);
imwrite(cre01d301Da,'cre01d301Da.tif');
max(cre01d301Da(:))

% H1a 
cre01d301K = cre01d301J(:,:,1);
imwrite(cre01d301K,'cre01d301K.tif');
s = strel('disk', 2);
for n = 1:max(cre01d301Da(:))
    cre01d301KBW = cre01d301Da == n;
    cre01d301res(n,1) = nnz((cre01d301K == 255).*cre01d301KBW); % H1a fosi
end

% Fos
cre01d301L = cre01d301J(:,:,2);
imwrite(cre01d301L,'cre01d301L.tif');
for n = 1:max(cre01d301Da(:))
    cre01d301LBW = cre01d301Da == n;
    cre01d301res(n,2) = nnz((cre01d301L == 255).*cre01d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre01d302
% Freehand drawing and extraction
cre01d302I = imread('cre01d302HFB2.tif');
figure
imshow(cre01d302I)
cre01d302h = drawfreehand;
cre01d302BW = createMask(cre01d302h);
cre01d302J = cre01d302I.*uint8(cre01d302BW);
figure
imshow(cre01d302J)

% DAPI
cre01d302BW2 = cre01d302J(:,:,3) >= 75; %% <----- 30 or 100
cre01d302BW3 = bwareaopen(cre01d302BW2, 50);
cre01d302BW4 = imfill(cre01d302BW3, 'holes');
cre01d302Da = bwlabel(cre01d302BW4, 4);
imwrite(cre01d302Da,'cre01d302Da.tif');
max(cre01d302Da(:))

% H1a 
cre01d302K = cre01d302J(:,:,1);
imwrite(cre01d302K,'cre01d302K.tif');
s = strel('disk', 2);
for n = 1:max(cre01d302Da(:))
    cre01d302KBW = cre01d302Da == n;
    cre01d302res(n,1) = nnz((cre01d302K == 255).*cre01d302KBW); % H1a fosi
end

% Fos
cre01d302L = cre01d302J(:,:,2);
imwrite(cre01d302L,'cre01d302L.tif');
for n = 1:max(cre01d302Da(:))
    cre01d302LBW = cre01d302Da == n;
    cre01d302res(n,2) = nnz((cre01d302L == 255).*cre01d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre01d303
% Freehand drawing and extraction
cre01d303I = imread('cre01d303HFB2.tif');
figure
imshow(cre01d303I)
cre01d303h = drawfreehand;
cre01d303BW = createMask(cre01d303h);
cre01d303J = cre01d303I.*uint8(cre01d303BW);
figure
imshow(cre01d303J)

% DAPI
cre01d303BW2 = cre01d303J(:,:,3) >= 75; %% <----- 30 or 100
cre01d303BW3 = bwareaopen(cre01d303BW2, 50);
cre01d303BW4 = imfill(cre01d303BW3, 'holes');
cre01d303Da = bwlabel(cre01d303BW4, 4);
imwrite(cre01d303Da,'cre01d303Da.tif');
max(cre01d303Da(:))

% H1a 
cre01d303K = cre01d303J(:,:,1);
imwrite(cre01d303K,'cre01d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre01d303Da(:))
    cre01d303KBW = cre01d303Da == n;
    cre01d303res(n,1) = nnz((cre01d303K == 255).*cre01d303KBW); % H1a fosi
end

% Fos
cre01d303L = cre01d303J(:,:,2);
imwrite(cre01d303L,'cre01d303L.tif');
for n = 1:max(cre01d303Da(:))
    cre01d303LBW = cre01d303Da == n;
    cre01d303res(n,2) = nnz((cre01d303L == 255).*cre01d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre02d301
% Freehand drawing and extraction
cre02d301I = imread('cre02d301HFB2.tif');
figure
imshow(cre02d301I)
cre02d301h = drawfreehand;
cre02d301BW = createMask(cre02d301h);
cre02d301J = cre02d301I.*uint8(cre02d301BW);
figure
imshow(cre02d301J)

% DAPI
cre02d301BW2 = cre02d301J(:,:,3) >= 75; %% <----- 30 or 100
cre02d301BW3 = bwareaopen(cre02d301BW2, 50);
cre02d301BW4 = imfill(cre02d301BW3, 'holes');
cre02d301Da = bwlabel(cre02d301BW4, 4);
imwrite(cre02d301Da,'cre02d301Da.tif');
max(cre02d301Da(:))

% H1a 
cre02d301K = cre02d301J(:,:,1);
imwrite(cre02d301K,'cre02d301K.tif');
s = strel('disk', 2);
for n = 1:max(cre02d301Da(:))
    cre02d301KBW = cre02d301Da == n;
    cre02d301res(n,1) = nnz((cre02d301K == 255).*cre02d301KBW); % H1a fosi
end

% Fos
cre02d301L = cre02d301J(:,:,2);
imwrite(cre02d301L,'cre02d301L.tif');
for n = 1:max(cre02d301Da(:))
    cre02d301LBW = cre02d301Da == n;
    cre02d301res(n,2) = nnz((cre02d301L == 255).*cre02d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre02d302
% Freehand drawing and extraction
cre02d302I = imread('cre02d302HFB2.tif');
figure
imshow(cre02d302I)
cre02d302h = drawfreehand;
cre02d302BW = createMask(cre02d302h);
cre02d302J = cre02d302I.*uint8(cre02d302BW);
figure
imshow(cre02d302J)

% DAPI
cre02d302BW2 = cre02d302J(:,:,3) >= 75; %% <----- 30 or 100
cre02d302BW3 = bwareaopen(cre02d302BW2, 50);
cre02d302BW4 = imfill(cre02d302BW3, 'holes');
cre02d302Da = bwlabel(cre02d302BW4, 4);
imwrite(cre02d302Da,'cre02d302Da.tif');
max(cre02d302Da(:))

% H1a 
cre02d302K = cre02d302J(:,:,1);
imwrite(cre02d302K,'cre02d302K.tif');
s = strel('disk', 2);
for n = 1:max(cre02d302Da(:))
    cre02d302KBW = cre02d302Da == n;
    cre02d302res(n,1) = nnz((cre02d302K == 255).*cre02d302KBW); % H1a fosi
end

% Fos
cre02d302L = cre02d302J(:,:,2);
imwrite(cre02d302L,'cre02d302L.tif');
for n = 1:max(cre02d302Da(:))
    cre02d302LBW = cre02d302Da == n;
    cre02d302res(n,2) = nnz((cre02d302L == 255).*cre02d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre02d303
% Freehand drawing and extraction
cre02d303I = imread('cre02d303HFB2.tif');
figure
imshow(cre02d303I)
cre02d303h = drawfreehand;
cre02d303BW = createMask(cre02d303h);
cre02d303J = cre02d303I.*uint8(cre02d303BW);
figure
imshow(cre02d303J)

% DAPI
cre02d303BW2 = cre02d303J(:,:,3) >= 75; %% <----- 30 or 100
cre02d303BW3 = bwareaopen(cre02d303BW2, 50);
cre02d303BW4 = imfill(cre02d303BW3, 'holes');
cre02d303Da = bwlabel(cre02d303BW4, 4);
imwrite(cre02d303Da,'cre02d303Da.tif');
max(cre02d303Da(:))

% H1a 
cre02d303K = cre02d303J(:,:,1);
imwrite(cre02d303K,'cre02d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre02d303Da(:))
    cre02d303KBW = cre02d303Da == n;
    cre02d303res(n,1) = nnz((cre02d303K == 255).*cre02d303KBW); % H1a fosi
end

% Fos
cre02d303L = cre02d303J(:,:,2);
imwrite(cre02d303L,'cre02d303L.tif');
for n = 1:max(cre02d303Da(:))
    cre02d303LBW = cre02d303Da == n;
    cre02d303res(n,2) = nnz((cre02d303L == 255).*cre02d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre03d301
% Freehand drawing and extraction
cre03d301I = imread('cre03d301HFB2.tif');
figure
imshow(cre03d301I)
cre03d301h = drawfreehand;
cre03d301BW = createMask(cre03d301h);
cre03d301J = cre03d301I.*uint8(cre03d301BW);
figure
imshow(cre03d301J)

% DAPI
cre03d301BW2 = cre03d301J(:,:,3) >= 75; %% <----- 30 or 100
cre03d301BW3 = bwareaopen(cre03d301BW2, 50);
cre03d301BW4 = imfill(cre03d301BW3, 'holes');
cre03d301Da = bwlabel(cre03d301BW4, 4);
imwrite(cre03d301Da,'cre03d301Da.tif');
max(cre03d301Da(:))

% H1a 
cre03d301K = cre03d301J(:,:,1);
imwrite(cre03d301K,'cre03d301K.tif');
s = strel('disk', 2);
for n = 1:max(cre03d301Da(:))
    cre03d301KBW = cre03d301Da == n;
    cre03d301res(n,1) = nnz((cre03d301K == 255).*cre03d301KBW); % H1a fosi
end

% Fos
cre03d301L = cre03d301J(:,:,2);
imwrite(cre03d301L,'cre03d301L.tif');
for n = 1:max(cre03d301Da(:))
    cre03d301LBW = cre03d301Da == n;
    cre03d301res(n,2) = nnz((cre03d301L == 255).*cre03d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre03d302a
% Freehand drawing and extraction
cre03d302aI = imread('cre03d302aHFB2.tif');
figure
imshow(cre03d302aI)
cre03d302ah = drawfreehand;
cre03d302aBW = createMask(cre03d302ah);
cre03d302aJ = cre03d302aI.*uint8(cre03d302aBW);
figure
imshow(cre03d302aJ)

% DAPI
cre03d302aBW2 = cre03d302aJ(:,:,3) >= 75; %% <----- 30 or 100
cre03d302aBW3 = bwareaopen(cre03d302aBW2, 50);
cre03d302aBW4 = imfill(cre03d302aBW3, 'holes');
cre03d302aDa = bwlabel(cre03d302aBW4, 4);
imwrite(cre03d302aDa,'cre03d302aDa.tif');
max(cre03d302aDa(:))

% H1a 
cre03d302aK = cre03d302aJ(:,:,1);
imwrite(cre03d302aK,'cre03d302aK.tif');
s = strel('disk', 2);
for n = 1:max(cre03d302aDa(:))
    cre03d302aKBW = cre03d302aDa == n;
    cre03d302ares(n,1) = nnz((cre03d302aK == 255).*cre03d302aKBW); % H1a fosi
end

% Fos
cre03d302aL = cre03d302aJ(:,:,2);
imwrite(cre03d302aL,'cre03d302aL.tif');
for n = 1:max(cre03d302aDa(:))
    cre03d302aLBW = cre03d302aDa == n;
    cre03d302ares(n,2) = nnz((cre03d302aL == 255).*cre03d302aLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre03d302b
% Freehand drawing and extraction
cre03d302bI = imread('cre03d302bHFB2.tif');
figure
imshow(cre03d302bI)
cre03d302bh = drawfreehand;
cre03d302bBW = createMask(cre03d302bh);
cre03d302bJ = cre03d302bI.*uint8(cre03d302bBW);
figure
imshow(cre03d302bJ)

% DAPI
cre03d302bBW2 = cre03d302bJ(:,:,3) >= 75; %% <----- 30 or 100
cre03d302bBW3 = bwareaopen(cre03d302bBW2, 50);
cre03d302bBW4 = imfill(cre03d302bBW3, 'holes');
cre03d302bDa = bwlabel(cre03d302bBW4, 4);
imwrite(cre03d302bDa,'cre03d302bDa.tif');
max(cre03d302bDa(:))

% H1a 
cre03d302bK = cre03d302bJ(:,:,1);
imwrite(cre03d302bK,'cre03d302bK.tif');
s = strel('disk', 2);
for n = 1:max(cre03d302bDa(:))
    cre03d302bKBW = cre03d302bDa == n;
    cre03d302bres(n,1) = nnz((cre03d302bK == 255).*cre03d302bKBW); % H1a fosi
end

% Fos
cre03d302bL = cre03d302bJ(:,:,2);
imwrite(cre03d302bL,'cre03d302bL.tif');
for n = 1:max(cre03d302bDa(:))
    cre03d302bLBW = cre03d302bDa == n;
    cre03d302bres(n,2) = nnz((cre03d302bL == 255).*cre03d302bLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre03d303
% Freehand drawing and extraction
cre03d303I = imread('cre03d303HFB2.tif');
figure
imshow(cre03d303I)
cre03d303h = drawfreehand;
cre03d303BW = createMask(cre03d303h);
cre03d303J = cre03d303I.*uint8(cre03d303BW);
figure
imshow(cre03d303J)

% DAPI
cre03d303BW2 = cre03d303J(:,:,3) >= 75; %% <----- 30 or 100
cre03d303BW3 = bwareaopen(cre03d303BW2, 50);
cre03d303BW4 = imfill(cre03d303BW3, 'holes');
cre03d303Da = bwlabel(cre03d303BW4, 4);
imwrite(cre03d303Da,'cre03d303Da.tif');
max(cre03d303Da(:))

% H1a 
cre03d303K = cre03d303J(:,:,1);
imwrite(cre03d303K,'cre03d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre03d303Da(:))
    cre03d303KBW = cre03d303Da == n;
    cre03d303res(n,1) = nnz((cre03d303K == 255).*cre03d303KBW); % H1a fosi
end

% Fos
cre03d303L = cre03d303J(:,:,2);
imwrite(cre03d303L,'cre03d303L.tif');
for n = 1:max(cre03d303Da(:))
    cre03d303LBW = cre03d303Da == n;
    cre03d303res(n,2) = nnz((cre03d303L == 255).*cre03d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre04d301a
% Freehand drawing and extraction
cre04d301aI = imread('cre04d301aHFB2.tif');
figure
imshow(cre04d301aI)
cre04d301ah = drawfreehand;
cre04d301aBW = createMask(cre04d301ah);
cre04d301aJ = cre04d301aI.*uint8(cre04d301aBW);
figure
imshow(cre04d301aJ)

% DAPI
cre04d301aBW2 = cre04d301aJ(:,:,3) >= 75; %% <----- 30 or 100
cre04d301aBW3 = bwareaopen(cre04d301aBW2, 50);
cre04d301aBW4 = imfill(cre04d301aBW3, 'holes');
cre04d301aDa = bwlabel(cre04d301aBW4, 4);
imwrite(cre04d301aDa,'cre04d301aDa.tif');
max(cre04d301aDa(:))

% H1a 
cre04d301aK = cre04d301aJ(:,:,1);
imwrite(cre04d301aK,'cre04d301aK.tif');
s = strel('disk', 2);
for n = 1:max(cre04d301aDa(:))
    cre04d301aKBW = cre04d301aDa == n;
    cre04d301ares(n,1) = nnz((cre04d301aK == 255).*cre04d301aKBW); % H1a fosi
end

% Fos
cre04d301aL = cre04d301aJ(:,:,2);
imwrite(cre04d301aL,'cre04d301aL.tif');
for n = 1:max(cre04d301aDa(:))
    cre04d301aLBW = cre04d301aDa == n;
    cre04d301ares(n,2) = nnz((cre04d301aL == 255).*cre04d301aLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre04d301b
% Freehand drawing and extraction
cre04d301bI = imread('cre04d301bHFB2.tif');
figure
imshow(cre04d301bI)
cre04d301bh = drawfreehand;
cre04d301bBW = createMask(cre04d301bh);
cre04d301bJ = cre04d301bI.*uint8(cre04d301bBW);
figure
imshow(cre04d301bJ)

% DAPI
cre04d301bBW2 = cre04d301bJ(:,:,3) >= 75; %% <----- 30 or 100
cre04d301bBW3 = bwareaopen(cre04d301bBW2, 50);
cre04d301bBW4 = imfill(cre04d301bBW3, 'holes');
cre04d301bDa = bwlabel(cre04d301bBW4, 4);
imwrite(cre04d301bDa,'cre04d301bDa.tif');
max(cre04d301bDa(:))

% H1a 
cre04d301bK = cre04d301bJ(:,:,1);
imwrite(cre04d301bK,'cre04d301bK.tif');
s = strel('disk', 2);
for n = 1:max(cre04d301bDa(:))
    cre04d301bKBW = cre04d301bDa == n;
    cre04d301bres(n,1) = nnz((cre04d301bK == 255).*cre04d301bKBW); % H1a fosi
end

% Fos
cre04d301bL = cre04d301bJ(:,:,2);
imwrite(cre04d301bL,'cre04d301bL.tif');
for n = 1:max(cre04d301bDa(:))
    cre04d301bLBW = cre04d301bDa == n;
    cre04d301bres(n,2) = nnz((cre04d301bL == 255).*cre04d301bLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre04d302
% Freehand drawing and extraction
cre04d302I = imread('cre04d302HFB2.tif');
figure
imshow(cre04d302I)
cre04d302h = drawfreehand;
cre04d302BW = createMask(cre04d302h);
cre04d302J = cre04d302I.*uint8(cre04d302BW);
figure
imshow(cre04d302J)

% DAPI
cre04d302BW2 = cre04d302J(:,:,3) >= 75; %% <----- 30 or 100
cre04d302BW3 = bwareaopen(cre04d302BW2, 50);
cre04d302BW4 = imfill(cre04d302BW3, 'holes');
cre04d302Da = bwlabel(cre04d302BW4, 4);
imwrite(cre04d302Da,'cre04d302Da.tif');
max(cre04d302Da(:))

% H1a 
cre04d302K = cre04d302J(:,:,1);
imwrite(cre04d302K,'cre04d302K.tif');
s = strel('disk', 2);
for n = 1:max(cre04d302Da(:))
    cre04d302KBW = cre04d302Da == n;
    cre04d302res(n,1) = nnz((cre04d302K == 255).*cre04d302KBW); % H1a fosi
end

% Fos
cre04d302L = cre04d302J(:,:,2);
imwrite(cre04d302L,'cre04d302L.tif');
for n = 1:max(cre04d302Da(:))
    cre04d302LBW = cre04d302Da == n;
    cre04d302res(n,2) = nnz((cre04d302L == 255).*cre04d302LBW); % Fos fosi
end




%% H1a-Fos catFISH  cre04d303
% Freehand drawing and extraction
cre04d303I = imread('cre04d303HFB2.tif');
figure
imshow(cre04d303I)
cre04d303h = drawfreehand;
cre04d303BW = createMask(cre04d303h);
cre04d303J = cre04d303I.*uint8(cre04d303BW);
figure
imshow(cre04d303J)

% DAPI
cre04d303BW2 = cre04d303J(:,:,3) >= 75; %% <----- 30 or 100
cre04d303BW3 = bwareaopen(cre04d303BW2, 50);
cre04d303BW4 = imfill(cre04d303BW3, 'holes');
cre04d303Da = bwlabel(cre04d303BW4, 4);
imwrite(cre04d303Da,'cre04d303Da.tif');
max(cre04d303Da(:))

% H1a 
cre04d303K = cre04d303J(:,:,1);
imwrite(cre04d303K,'cre04d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre04d303Da(:))
    cre04d303KBW = cre04d303Da == n;
    cre04d303res(n,1) = nnz((cre04d303K == 255).*cre04d303KBW); % H1a fosi
end

% Fos
cre04d303L = cre04d303J(:,:,2);
imwrite(cre04d303L,'cre04d303L.tif');
for n = 1:max(cre04d303Da(:))
    cre04d303LBW = cre04d303Da == n;
    cre04d303res(n,2) = nnz((cre04d303L == 255).*cre04d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre05d301
% Freehand drawing and extraction
cre05d301I = imread('cre05d301HFB2.tif');
figure
imshow(cre05d301I)
cre05d301h = drawfreehand;
cre05d301BW = createMask(cre05d301h);
cre05d301J = cre05d301I.*uint8(cre05d301BW);
figure
imshow(cre05d301J)

% DAPI
cre05d301BW2 = cre05d301J(:,:,3) >= 75; %% <----- 30 or 100
cre05d301BW3 = bwareaopen(cre05d301BW2, 50);
cre05d301BW4 = imfill(cre05d301BW3, 'holes');
cre05d301Da = bwlabel(cre05d301BW4, 4);
imwrite(cre05d301Da,'cre05d301Da.tif');
max(cre05d301Da(:))

% H1a 
cre05d301K = cre05d301J(:,:,1);
imwrite(cre05d301K,'cre05d301K.tif');
s = strel('disk', 2);
for n = 1:max(cre05d301Da(:))
    cre05d301KBW = cre05d301Da == n;
    cre05d301res(n,1) = nnz((cre05d301K == 255).*cre05d301KBW); % H1a fosi
end

% Fos
cre05d301L = cre05d301J(:,:,2);
imwrite(cre05d301L,'cre05d301L.tif');
for n = 1:max(cre05d301Da(:))
    cre05d301LBW = cre05d301Da == n;
    cre05d301res(n,2) = nnz((cre05d301L == 255).*cre05d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre05d302a
% Freehand drawing and extraction
cre05d302aI = imread('cre05d302aHFB2.tif');
figure
imshow(cre05d302aI)
cre05d302ah = drawfreehand;
cre05d302aBW = createMask(cre05d302ah);
cre05d302aJ = cre05d302aI.*uint8(cre05d302aBW);
figure
imshow(cre05d302aJ)

% DAPI
cre05d302aBW2 = cre05d302aJ(:,:,3) >= 75; %% <----- 30 or 100
cre05d302aBW3 = bwareaopen(cre05d302aBW2, 50);
cre05d302aBW4 = imfill(cre05d302aBW3, 'holes');
cre05d302aDa = bwlabel(cre05d302aBW4, 4);
imwrite(cre05d302aDa,'cre05d302aDa.tif');
max(cre05d302aDa(:))

% H1a 
cre05d302aK = cre05d302aJ(:,:,1);
imwrite(cre05d302aK,'cre05d302aK.tif');
s = strel('disk', 2);
for n = 1:max(cre05d302aDa(:))
    cre05d302aKBW = cre05d302aDa == n;
    cre05d302ares(n,1) = nnz((cre05d302aK == 255).*cre05d302aKBW); % H1a fosi
end

% Fos
cre05d302aL = cre05d302aJ(:,:,2);
imwrite(cre05d302aL,'cre05d302aL.tif');
for n = 1:max(cre05d302aDa(:))
    cre05d302aLBW = cre05d302aDa == n;
    cre05d302ares(n,2) = nnz((cre05d302aL == 255).*cre05d302aLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre05d302b
% Freehand drawing and extraction
cre05d302bI = imread('cre05d302bHFB2.tif');
figure
imshow(cre05d302bI)
cre05d302bh = drawfreehand;
cre05d302bBW = createMask(cre05d302bh);
cre05d302bJ = cre05d302bI.*uint8(cre05d302bBW);
figure
imshow(cre05d302bJ)

% DAPI
cre05d302bBW2 = cre05d302bJ(:,:,3) >= 75; %% <----- 30 or 100
cre05d302bBW3 = bwareaopen(cre05d302bBW2, 50);
cre05d302bBW4 = imfill(cre05d302bBW3, 'holes');
cre05d302bDa = bwlabel(cre05d302bBW4, 4);
imwrite(cre05d302bDa,'cre05d302bDa.tif');
max(cre05d302bDa(:))

% H1a 
cre05d302bK = cre05d302bJ(:,:,1);
imwrite(cre05d302bK,'cre05d302bK.tif');
s = strel('disk', 2);
for n = 1:max(cre05d302bDa(:))
    cre05d302bKBW = cre05d302bDa == n;
    cre05d302bres(n,1) = nnz((cre05d302bK == 255).*cre05d302bKBW); % H1a fosi
end

% Fos
cre05d302bL = cre05d302bJ(:,:,2);
imwrite(cre05d302bL,'cre05d302bL.tif');
for n = 1:max(cre05d302bDa(:))
    cre05d302bLBW = cre05d302bDa == n;
    cre05d302bres(n,2) = nnz((cre05d302bL == 255).*cre05d302bLBW); % Fos fosi
end



%% H1a-Fos catFISH  cre05d303
% Freehand drawing and extraction
cre05d303I = imread('cre05d303HFB2.tif');
figure
imshow(cre05d303I)
cre05d303h = drawfreehand;
cre05d303BW = createMask(cre05d303h);
cre05d303J = cre05d303I.*uint8(cre05d303BW);
figure
imshow(cre05d303J)

% DAPI
cre05d303BW2 = cre05d303J(:,:,3) >= 75; %% <----- 30 or 100
cre05d303BW3 = bwareaopen(cre05d303BW2, 50);
cre05d303BW4 = imfill(cre05d303BW3, 'holes');
cre05d303Da = bwlabel(cre05d303BW4, 4);
imwrite(cre05d303Da,'cre05d303Da.tif');
max(cre05d303Da(:))

% H1a 
cre05d303K = cre05d303J(:,:,1);
imwrite(cre05d303K,'cre05d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre05d303Da(:))
    cre05d303KBW = cre05d303Da == n;
    cre05d303res(n,1) = nnz((cre05d303K == 255).*cre05d303KBW); % H1a fosi
end

% Fos
cre05d303L = cre05d303J(:,:,2);
imwrite(cre05d303L,'cre05d303L.tif');
for n = 1:max(cre05d303Da(:))
    cre05d303LBW = cre05d303Da == n;
    cre05d303res(n,2) = nnz((cre05d303L == 255).*cre05d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d301
% Freehand drawing and extraction
cre06d301I = imread('cre06d301HFB2.tif');
figure
imshow(cre06d301I)
cre06d301h = drawfreehand;
cre06d301BW = createMask(cre06d301h);
cre06d301J = cre06d301I.*uint8(cre06d301BW);
figure
imshow(cre06d301J)

% DAPI
cre06d301BW2 = cre06d301J(:,:,3) >= 75; %% <----- 30 or 100
cre06d301BW3 = bwareaopen(cre06d301BW2, 50);
cre06d301BW4 = imfill(cre06d301BW3, 'holes');
cre06d301Da = bwlabel(cre06d301BW4, 4);
imwrite(cre06d301Da,'cre06d301Da.tif');
max(cre06d301Da(:))

% H1a 
cre06d301K = cre06d301J(:,:,1);
imwrite(cre06d301K,'cre06d301K.tif');
s = strel('disk', 2);
for n = 1:max(cre06d301Da(:))
    cre06d301KBW = cre06d301Da == n;
    cre06d301res(n,1) = nnz((cre06d301K == 255).*cre06d301KBW); % H1a fosi
end

% Fos
cre06d301L = cre06d301J(:,:,2);
imwrite(cre06d301L,'cre06d301L.tif');
for n = 1:max(cre06d301Da(:))
    cre06d301LBW = cre06d301Da == n;
    cre06d301res(n,2) = nnz((cre06d301L == 255).*cre06d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d302
% Freehand drawing and extraction
cre06d302I = imread('cre06d302HFB2.tif');
figure
imshow(cre06d302I)
cre06d302h = drawfreehand;
cre06d302BW = createMask(cre06d302h);
cre06d302J = cre06d302I.*uint8(cre06d302BW);
figure
imshow(cre06d302J)

% DAPI
cre06d302BW2 = cre06d302J(:,:,3) >= 75; %% <----- 30 or 100
cre06d302BW3 = bwareaopen(cre06d302BW2, 50);
cre06d302BW4 = imfill(cre06d302BW3, 'holes');
cre06d302Da = bwlabel(cre06d302BW4, 4);
imwrite(cre06d302Da,'cre06d302Da.tif');
max(cre06d302Da(:))

% H1a 
cre06d302K = cre06d302J(:,:,1);
imwrite(cre06d302K,'cre06d302K.tif');
s = strel('disk', 2);
for n = 1:max(cre06d302Da(:))
    cre06d302KBW = cre06d302Da == n;
    cre06d302res(n,1) = nnz((cre06d302K == 255).*cre06d302KBW); % H1a fosi
end

% Fos
cre06d302L = cre06d302J(:,:,2);
imwrite(cre06d302L,'cre06d302L.tif');
for n = 1:max(cre06d302Da(:))
    cre06d302LBW = cre06d302Da == n;
    cre06d302res(n,2) = nnz((cre06d302L == 255).*cre06d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  cre06d303
% Freehand drawing and extraction
cre06d303I = imread('cre06d303HFB2.tif');
figure
imshow(cre06d303I)
cre06d303h = drawfreehand;
cre06d303BW = createMask(cre06d303h);
cre06d303J = cre06d303I.*uint8(cre06d303BW);
figure
imshow(cre06d303J)

% DAPI
cre06d303BW2 = cre06d303J(:,:,3) >= 75; %% <----- 30 or 100
cre06d303BW3 = bwareaopen(cre06d303BW2, 50);
cre06d303BW4 = imfill(cre06d303BW3, 'holes');
cre06d303Da = bwlabel(cre06d303BW4, 4);
imwrite(cre06d303Da,'cre06d303Da.tif');
max(cre06d303Da(:))

% H1a 
cre06d303K = cre06d303J(:,:,1);
imwrite(cre06d303K,'cre06d303K.tif');
s = strel('disk', 2);
for n = 1:max(cre06d303Da(:))
    cre06d303KBW = cre06d303Da == n;
    cre06d303res(n,1) = nnz((cre06d303K == 255).*cre06d303KBW); % H1a fosi
end

% Fos
cre06d303L = cre06d303J(:,:,2);
imwrite(cre06d303L,'cre06d303L.tif');
for n = 1:max(cre06d303Da(:))
    cre06d303LBW = cre06d303Da == n;
    cre06d303res(n,2) = nnz((cre06d303L == 255).*cre06d303LBW); % Fos fosi
end



