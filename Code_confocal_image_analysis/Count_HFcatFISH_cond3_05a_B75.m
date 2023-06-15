%% H1a-Fos catFISH  con02d301a
% Freehand drawing and extraction
con02d301aI = imread('con02d301aHFB2.tif');
figure
imshow(con02d301aI)
con02d301ah = drawfreehand;
con02d301aBW = createMask(con02d301ah);
con02d301aJ = con02d301aI.*uint8(con02d301aBW);
figure
imshow(con02d301aJ)

% DAPI
con02d301aBW2 = con02d301aJ(:,:,3) >= 75; %% <----- 30 or 100
con02d301aBW3 = bwareaopen(con02d301aBW2, 50);
con02d301aBW4 = imfill(con02d301aBW3, 'holes');
con02d301aDa = bwlabel(con02d301aBW4, 4);
imwrite(con02d301aDa,'con02d301aDa.tif');
max(con02d301aDa(:))

% H1a 
con02d301aK = con02d301aJ(:,:,1);
imwrite(con02d301aK,'con02d301aK.tif');
s = strel('disk', 2);
for n = 1:max(con02d301aDa(:))
    con02d301aKBW = con02d301aDa == n;
    con02d301ares(n,1) = nnz((con02d301aK == 255).*con02d301aKBW); % H1a fosi
end

% Fos
con02d301aL = con02d301aJ(:,:,2);
imwrite(con02d301aL,'con02d301aL.tif');
for n = 1:max(con02d301aDa(:))
    con02d301aLBW = con02d301aDa == n;
    con02d301ares(n,2) = nnz((con02d301aL == 255).*con02d301aLBW); % Fos fosi
end



%% H1a-Fos catFISH  con02d301b
% Freehand drawing and extraction
con02d301bI = imread('con02d301bHFB2.tif');
figure
imshow(con02d301bI)
con02d301bh = drawfreehand;
con02d301bBW = createMask(con02d301bh);
con02d301bJ = con02d301bI.*uint8(con02d301bBW);
figure
imshow(con02d301bJ)

% DAPI
con02d301bBW2 = con02d301bJ(:,:,3) >= 75; %% <----- 30 or 100
con02d301bBW3 = bwareaopen(con02d301bBW2, 50);
con02d301bBW4 = imfill(con02d301bBW3, 'holes');
con02d301bDa = bwlabel(con02d301bBW4, 4);
imwrite(con02d301bDa,'con02d301bDa.tif');
max(con02d301bDa(:))

% H1a 
con02d301bK = con02d301bJ(:,:,1);
imwrite(con02d301bK,'con02d301bK.tif');
s = strel('disk', 2);
for n = 1:max(con02d301bDa(:))
    con02d301bKBW = con02d301bDa == n;
    con02d301bres(n,1) = nnz((con02d301bK == 255).*con02d301bKBW); % H1a fosi
end

% Fos
con02d301bL = con02d301bJ(:,:,2);
imwrite(con02d301bL,'con02d301bL.tif');
for n = 1:max(con02d301bDa(:))
    con02d301bLBW = con02d301bDa == n;
    con02d301bres(n,2) = nnz((con02d301bL == 255).*con02d301bLBW); % Fos fosi
end



%% H1a-Fos catFISH  con02d302
% Freehand drawing and extraction
con02d302I = imread('con02d302HFB2.tif');
figure
imshow(con02d302I)
con02d302h = drawfreehand;
con02d302BW = createMask(con02d302h);
con02d302J = con02d302I.*uint8(con02d302BW);
figure
imshow(con02d302J)

% DAPI
con02d302BW2 = con02d302J(:,:,3) >= 75; %% <----- 30 or 100
con02d302BW3 = bwareaopen(con02d302BW2, 50);
con02d302BW4 = imfill(con02d302BW3, 'holes');
con02d302Da = bwlabel(con02d302BW4, 4);
imwrite(con02d302Da,'con02d302Da.tif');
max(con02d302Da(:))

% H1a 
con02d302K = con02d302J(:,:,1);
imwrite(con02d302K,'con02d302K.tif');
s = strel('disk', 2);
for n = 1:max(con02d302Da(:))
    con02d302KBW = con02d302Da == n;
    con02d302res(n,1) = nnz((con02d302K == 255).*con02d302KBW); % H1a fosi
end

% Fos
con02d302L = con02d302J(:,:,2);
imwrite(con02d302L,'con02d302L.tif');
for n = 1:max(con02d302Da(:))
    con02d302LBW = con02d302Da == n;
    con02d302res(n,2) = nnz((con02d302L == 255).*con02d302LBW); % Fos fosi
end




%% H1a-Fos catFISH  con02d303
% Freehand drawing and extraction
con02d303I = imread('con02d303HFB2.tif');
figure
imshow(con02d303I)
con02d303h = drawfreehand;
con02d303BW = createMask(con02d303h);
con02d303J = con02d303I.*uint8(con02d303BW);
figure
imshow(con02d303J)

% DAPI
con02d303BW2 = con02d303J(:,:,3) >= 75; %% <----- 30 or 100
con02d303BW3 = bwareaopen(con02d303BW2, 50);
con02d303BW4 = imfill(con02d303BW3, 'holes');
con02d303Da = bwlabel(con02d303BW4, 4);
imwrite(con02d303Da,'con02d303Da.tif');
max(con02d303Da(:))

% H1a 
con02d303K = con02d303J(:,:,1);
imwrite(con02d303K,'con02d303K.tif');
s = strel('disk', 2);
for n = 1:max(con02d303Da(:))
    con02d303KBW = con02d303Da == n;
    con02d303res(n,1) = nnz((con02d303K == 255).*con02d303KBW); % H1a fosi
end

% Fos
con02d303L = con02d303J(:,:,2);
imwrite(con02d303L,'con02d303L.tif');
for n = 1:max(con02d303Da(:))
    con02d303LBW = con02d303Da == n;
    con02d303res(n,2) = nnz((con02d303L == 255).*con02d303LBW); % Fos fosi
end




%% H1a-Fos catFISH  con03d301
% Freehand drawing and extraction
con03d301I = imread('con03d301HFB2.tif');
figure
imshow(con03d301I)
con03d301h = drawfreehand;
con03d301BW = createMask(con03d301h);
con03d301J = con03d301I.*uint8(con03d301BW);
figure
imshow(con03d301J)

% DAPI
con03d301BW2 = con03d301J(:,:,3) >= 75; %% <----- 30 or 100
con03d301BW3 = bwareaopen(con03d301BW2, 50);
con03d301BW4 = imfill(con03d301BW3, 'holes');
con03d301Da = bwlabel(con03d301BW4, 4);
imwrite(con03d301Da,'con03d301Da.tif');
max(con03d301Da(:))

% H1a 
con03d301K = con03d301J(:,:,1);
imwrite(con03d301K,'con03d301K.tif');
s = strel('disk', 2);
for n = 1:max(con03d301Da(:))
    con03d301KBW = con03d301Da == n;
    con03d301res(n,1) = nnz((con03d301K == 255).*con03d301KBW); % H1a fosi
end

% Fos
con03d301L = con03d301J(:,:,2);
imwrite(con03d301L,'con03d301L.tif');
for n = 1:max(con03d301Da(:))
    con03d301LBW = con03d301Da == n;
    con03d301res(n,2) = nnz((con03d301L == 255).*con03d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  con03d302
% Freehand drawing and extraction
con03d302I = imread('con03d302HFB2.tif');
figure
imshow(con03d302I)
con03d302h = drawfreehand;
con03d302BW = createMask(con03d302h);
con03d302J = con03d302I.*uint8(con03d302BW);
figure
imshow(con03d302J)

% DAPI
con03d302BW2 = con03d302J(:,:,3) >= 75; %% <----- 30 or 100
con03d302BW3 = bwareaopen(con03d302BW2, 50);
con03d302BW4 = imfill(con03d302BW3, 'holes');
con03d302Da = bwlabel(con03d302BW4, 4);
imwrite(con03d302Da,'con03d302Da.tif');
max(con03d302Da(:))

% H1a 
con03d302K = con03d302J(:,:,1);
imwrite(con03d302K,'con03d302K.tif');
s = strel('disk', 2);
for n = 1:max(con03d302Da(:))
    con03d302KBW = con03d302Da == n;
    con03d302res(n,1) = nnz((con03d302K == 255).*con03d302KBW); % H1a fosi
end

% Fos
con03d302L = con03d302J(:,:,2);
imwrite(con03d302L,'con03d302L.tif');
for n = 1:max(con03d302Da(:))
    con03d302LBW = con03d302Da == n;
    con03d302res(n,2) = nnz((con03d302L == 255).*con03d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  con03d303
% Freehand drawing and extraction
con03d303I = imread('con03d303HFB2.tif');
figure
imshow(con03d303I)
con03d303h = drawfreehand;
con03d303BW = createMask(con03d303h);
con03d303J = con03d303I.*uint8(con03d303BW);
figure
imshow(con03d303J)

% DAPI
con03d303BW2 = con03d303J(:,:,3) >= 75; %% <----- 30 or 100
con03d303BW3 = bwareaopen(con03d303BW2, 50);
con03d303BW4 = imfill(con03d303BW3, 'holes');
con03d303Da = bwlabel(con03d303BW4, 4);
imwrite(con03d303Da,'con03d303Da.tif');
max(con03d303Da(:))

% H1a 
con03d303K = con03d303J(:,:,1);
imwrite(con03d303K,'con03d303K.tif');
s = strel('disk', 2);
for n = 1:max(con03d303Da(:))
    con03d303KBW = con03d303Da == n;
    con03d303res(n,1) = nnz((con03d303K == 255).*con03d303KBW); % H1a fosi
end

% Fos
con03d303L = con03d303J(:,:,2);
imwrite(con03d303L,'con03d303L.tif');
for n = 1:max(con03d303Da(:))
    con03d303LBW = con03d303Da == n;
    con03d303res(n,2) = nnz((con03d303L == 255).*con03d303LBW); % Fos fosi
end




%% H1a-Fos catFISH  con04d301
% Freehand drawing and extraction
con04d301I = imread('con04d301HFB2.tif');
figure
imshow(con04d301I)
con04d301h = drawfreehand;
con04d301BW = createMask(con04d301h);
con04d301J = con04d301I.*uint8(con04d301BW);
figure
imshow(con04d301J)

% DAPI
con04d301BW2 = con04d301J(:,:,3) >= 75; %% <----- 30 or 100
con04d301BW3 = bwareaopen(con04d301BW2, 50);
con04d301BW4 = imfill(con04d301BW3, 'holes');
con04d301Da = bwlabel(con04d301BW4, 4);
imwrite(con04d301Da,'con04d301Da.tif');
max(con04d301Da(:))

% H1a 
con04d301K = con04d301J(:,:,1);
imwrite(con04d301K,'con04d301K.tif');
s = strel('disk', 2);
for n = 1:max(con04d301Da(:))
    con04d301KBW = con04d301Da == n;
    con04d301res(n,1) = nnz((con04d301K == 255).*con04d301KBW); % H1a fosi
end

% Fos
con04d301L = con04d301J(:,:,2);
imwrite(con04d301L,'con04d301L.tif');
for n = 1:max(con04d301Da(:))
    con04d301LBW = con04d301Da == n;
    con04d301res(n,2) = nnz((con04d301L == 255).*con04d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  con04d302a
% Freehand drawing and extraction
con04d302aI = imread('con04d302aHFB2.tif');
figure
imshow(con04d302aI)
con04d302ah = drawfreehand;
con04d302aBW = createMask(con04d302ah);
con04d302aJ = con04d302aI.*uint8(con04d302aBW);
figure
imshow(con04d302aJ)

% DAPI
con04d302aBW2 = con04d302aJ(:,:,3) >= 75; %% <----- 30 or 100
con04d302aBW3 = bwareaopen(con04d302aBW2, 50);
con04d302aBW4 = imfill(con04d302aBW3, 'holes');
con04d302aDa = bwlabel(con04d302aBW4, 4);
imwrite(con04d302aDa,'con04d302aDa.tif');
max(con04d302aDa(:))

% H1a 
con04d302aK = con04d302aJ(:,:,1);
imwrite(con04d302aK,'con04d302aK.tif');
s = strel('disk', 2);
for n = 1:max(con04d302aDa(:))
    con04d302aKBW = con04d302aDa == n;
    con04d302ares(n,1) = nnz((con04d302aK == 255).*con04d302aKBW); % H1a fosi
end

% Fos
con04d302aL = con04d302aJ(:,:,2);
imwrite(con04d302aL,'con04d302aL.tif');
for n = 1:max(con04d302aDa(:))
    con04d302aLBW = con04d302aDa == n;
    con04d302ares(n,2) = nnz((con04d302aL == 255).*con04d302aLBW); % Fos fosi
end



%% H1a-Fos catFISH  con04d302b
% Freehand drawing and extraction
con04d302bI = imread('con04d302bHFB2.tif');
figure
imshow(con04d302bI)
con04d302bh = drawfreehand;
con04d302bBW = createMask(con04d302bh);
con04d302bJ = con04d302bI.*uint8(con04d302bBW);
figure
imshow(con04d302bJ)

% DAPI
con04d302bBW2 = con04d302bJ(:,:,3) >= 75; %% <----- 30 or 100
con04d302bBW3 = bwareaopen(con04d302bBW2, 50);
con04d302bBW4 = imfill(con04d302bBW3, 'holes');
con04d302bDa = bwlabel(con04d302bBW4, 4);
imwrite(con04d302bDa,'con04d302bDa.tif');
max(con04d302bDa(:))

% H1a 
con04d302bK = con04d302bJ(:,:,1);
imwrite(con04d302bK,'con04d302bK.tif');
s = strel('disk', 2);
for n = 1:max(con04d302bDa(:))
    con04d302bKBW = con04d302bDa == n;
    con04d302bres(n,1) = nnz((con04d302bK == 255).*con04d302bKBW); % H1a fosi
end

% Fos
con04d302bL = con04d302bJ(:,:,2);
imwrite(con04d302bL,'con04d302bL.tif');
for n = 1:max(con04d302bDa(:))
    con04d302bLBW = con04d302bDa == n;
    con04d302bres(n,2) = nnz((con04d302bL == 255).*con04d302bLBW); % Fos fosi
end



%% H1a-Fos catFISH  con04d303
% Freehand drawing and extraction
con04d303I = imread('con04d303HFB2.tif');
figure
imshow(con04d303I)
con04d303h = drawfreehand;
con04d303BW = createMask(con04d303h);
con04d303J = con04d303I.*uint8(con04d303BW);
figure
imshow(con04d303J)

% DAPI
con04d303BW2 = con04d303J(:,:,3) >= 75; %% <----- 30 or 100
con04d303BW3 = bwareaopen(con04d303BW2, 50);
con04d303BW4 = imfill(con04d303BW3, 'holes');
con04d303Da = bwlabel(con04d303BW4, 4);
imwrite(con04d303Da,'con04d303Da.tif');
max(con04d303Da(:))

% H1a 
con04d303K = con04d303J(:,:,1);
imwrite(con04d303K,'con04d303K.tif');
s = strel('disk', 2);
for n = 1:max(con04d303Da(:))
    con04d303KBW = con04d303Da == n;
    con04d303res(n,1) = nnz((con04d303K == 255).*con04d303KBW); % H1a fosi
end

% Fos
con04d303L = con04d303J(:,:,2);
imwrite(con04d303L,'con04d303L.tif');
for n = 1:max(con04d303Da(:))
    con04d303LBW = con04d303Da == n;
    con04d303res(n,2) = nnz((con04d303L == 255).*con04d303LBW); % Fos fosi
end




%% H1a-Fos catFISH  con313d301
% Freehand drawing and extraction
con313d301I = imread('con313d301HFB2.tif');
figure
imshow(con313d301I)
con313d301h = drawfreehand;
con313d301BW = createMask(con313d301h);
con313d301J = con313d301I.*uint8(con313d301BW);
figure
imshow(con313d301J)

% DAPI
con313d301BW2 = con313d301J(:,:,3) >= 75; %% <----- 30 or 100
con313d301BW3 = bwareaopen(con313d301BW2, 50);
con313d301BW4 = imfill(con313d301BW3, 'holes');
con313d301Da = bwlabel(con313d301BW4, 4);
imwrite(con313d301Da,'con313d301Da.tif');
max(con313d301Da(:))

% H1a 
con313d301K = con313d301J(:,:,1);
imwrite(con313d301K,'con313d301K.tif');
s = strel('disk', 2);
for n = 1:max(con313d301Da(:))
    con313d301KBW = con313d301Da == n;
    con313d301res(n,1) = nnz((con313d301K == 255).*con313d301KBW); % H1a fosi
end

% Fos
con313d301L = con313d301J(:,:,2);
imwrite(con313d301L,'con313d301L.tif');
for n = 1:max(con313d301Da(:))
    con313d301LBW = con313d301Da == n;
    con313d301res(n,2) = nnz((con313d301L == 255).*con313d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  con313d302
% Freehand drawing and extraction
con313d302I = imread('con313d302HFB2.tif');
figure
imshow(con313d302I)
con313d302h = drawfreehand;
con313d302BW = createMask(con313d302h);
con313d302J = con313d302I.*uint8(con313d302BW);
figure
imshow(con313d302J)

% DAPI
con313d302BW2 = con313d302J(:,:,3) >= 75; %% <----- 30 or 100
con313d302BW3 = bwareaopen(con313d302BW2, 50);
con313d302BW4 = imfill(con313d302BW3, 'holes');
con313d302Da = bwlabel(con313d302BW4, 4);
imwrite(con313d302Da,'con313d302Da.tif');
max(con313d302Da(:))

% H1a 
con313d302K = con313d302J(:,:,1);
imwrite(con313d302K,'con313d302K.tif');
s = strel('disk', 2);
for n = 1:max(con313d302Da(:))
    con313d302KBW = con313d302Da == n;
    con313d302res(n,1) = nnz((con313d302K == 255).*con313d302KBW); % H1a fosi
end

% Fos
con313d302L = con313d302J(:,:,2);
imwrite(con313d302L,'con313d302L.tif');
for n = 1:max(con313d302Da(:))
    con313d302LBW = con313d302Da == n;
    con313d302res(n,2) = nnz((con313d302L == 255).*con313d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  con313d303
% Freehand drawing and extraction
con313d303I = imread('con313d303HFB2.tif');
figure
imshow(con313d303I)
con313d303h = drawfreehand;
con313d303BW = createMask(con313d303h);
con313d303J = con313d303I.*uint8(con313d303BW);
figure
imshow(con313d303J)

% DAPI
con313d303BW2 = con313d303J(:,:,3) >= 75; %% <----- 30 or 100
con313d303BW3 = bwareaopen(con313d303BW2, 50);
con313d303BW4 = imfill(con313d303BW3, 'holes');
con313d303Da = bwlabel(con313d303BW4, 4);
imwrite(con313d303Da,'con313d303Da.tif');
max(con313d303Da(:))

% H1a 
con313d303K = con313d303J(:,:,1);
imwrite(con313d303K,'con313d303K.tif');
s = strel('disk', 2);
for n = 1:max(con313d303Da(:))
    con313d303KBW = con313d303Da == n;
    con313d303res(n,1) = nnz((con313d303K == 255).*con313d303KBW); % H1a fosi
end

% Fos
con313d303L = con313d303J(:,:,2);
imwrite(con313d303L,'con313d303L.tif');
for n = 1:max(con313d303Da(:))
    con313d303LBW = con313d303Da == n;
    con313d303res(n,2) = nnz((con313d303L == 255).*con313d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  con313d304
% Freehand drawing and extraction
con313d304I = imread('con313d304HFB2.tif');
figure
imshow(con313d304I)
con313d304h = drawfreehand;
con313d304BW = createMask(con313d304h);
con313d304J = con313d304I.*uint8(con313d304BW);
figure
imshow(con313d304J)

% DAPI
con313d304BW2 = con313d304J(:,:,3) >= 75; %% <----- 30 or 100
con313d304BW3 = bwareaopen(con313d304BW2, 50);
con313d304BW4 = imfill(con313d304BW3, 'holes');
con313d304Da = bwlabel(con313d304BW4, 4);
imwrite(con313d304Da,'con313d304Da.tif');
max(con313d304Da(:))

% H1a 
con313d304K = con313d304J(:,:,1);
imwrite(con313d304K,'con313d304K.tif');
s = strel('disk', 2);
for n = 1:max(con313d304Da(:))
    con313d304KBW = con313d304Da == n;
    con313d304res(n,1) = nnz((con313d304K == 255).*con313d304KBW); % H1a fosi
end

% Fos
con313d304L = con313d304J(:,:,2);
imwrite(con313d304L,'con313d304L.tif');
for n = 1:max(con313d304Da(:))
    con313d304LBW = con313d304Da == n;
    con313d304res(n,2) = nnz((con313d304L == 255).*con313d304LBW); % Fos fosi
end



%% H1a-Fos catFISH  con313d305
% Freehand drawing and extraction
con313d305I = imread('con313d305HFB2.tif');
figure
imshow(con313d305I)
con313d305h = drawfreehand;
con313d305BW = createMask(con313d305h);
con313d305J = con313d305I.*uint8(con313d305BW);
figure
imshow(con313d305J)

% DAPI
con313d305BW2 = con313d305J(:,:,3) >= 75; %% <----- 30 or 100
con313d305BW3 = bwareaopen(con313d305BW2, 50);
con313d305BW4 = imfill(con313d305BW3, 'holes');
con313d305Da = bwlabel(con313d305BW4, 4);
imwrite(con313d305Da,'con313d305Da.tif');
max(con313d305Da(:))

% H1a 
con313d305K = con313d305J(:,:,1);
imwrite(con313d305K,'con313d305K.tif');
s = strel('disk', 2);
for n = 1:max(con313d305Da(:))
    con313d305KBW = con313d305Da == n;
    con313d305res(n,1) = nnz((con313d305K == 255).*con313d305KBW); % H1a fosi
end

% Fos
con313d305L = con313d305J(:,:,2);
imwrite(con313d305L,'con313d305L.tif');
for n = 1:max(con313d305Da(:))
    con313d305LBW = con313d305Da == n;
    con313d305res(n,2) = nnz((con313d305L == 255).*con313d305LBW); % Fos fosi
end


