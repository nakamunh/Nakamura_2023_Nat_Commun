%% H1a-Fos catFISH  w01d301
% Freehand drawing and extraction
w01d301I = imread('w01d301HFB2.tif');
figure
imshow(w01d301I)
w01d301h = drawfreehand;
w01d301BW = createMask(w01d301h);
w01d301J = w01d301I.*uint8(w01d301BW);
figure
imshow(w01d301J)

% DAPI
w01d301BW2 = w01d301J(:,:,3) >= 75; %% <----- 30 or 100
w01d301BW3 = bwareaopen(w01d301BW2, 50);
w01d301BW4 = imfill(w01d301BW3, 'holes');
w01d301Da = bwlabel(w01d301BW4, 4);
imwrite(w01d301Da,'w01d301Da.tif');
max(w01d301Da(:))

% H1a 
w01d301K = w01d301J(:,:,1);
imwrite(w01d301K,'w01d301K.tif');
s = strel('disk', 2);
for n = 1:max(w01d301Da(:))
    w01d301KBW = w01d301Da == n;
    w01d301res(n,1) = nnz((w01d301K == 255).*w01d301KBW); % H1a fosi
end

% Fos
w01d301L = w01d301J(:,:,2);
imwrite(w01d301L,'w01d301L.tif');
for n = 1:max(w01d301Da(:))
    w01d301LBW = w01d301Da == n;
    w01d301res(n,2) = nnz((w01d301L == 255).*w01d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w01d302
% Freehand drawing and extraction
w01d302I = imread('w01d302HFB2.tif');
figure
imshow(w01d302I)
w01d302h = drawfreehand;
w01d302BW = createMask(w01d302h);
w01d302J = w01d302I.*uint8(w01d302BW);
figure
imshow(w01d302J)

% DAPI
w01d302BW2 = w01d302J(:,:,3) >= 75; %% <----- 30 or 100
w01d302BW3 = bwareaopen(w01d302BW2, 50);
w01d302BW4 = imfill(w01d302BW3, 'holes');
w01d302Da = bwlabel(w01d302BW4, 4);
imwrite(w01d302Da,'w01d302Da.tif');
max(w01d302Da(:))

% H1a 
w01d302K = w01d302J(:,:,1);
imwrite(w01d302K,'w01d302K.tif');
s = strel('disk', 2);
for n = 1:max(w01d302Da(:))
    w01d302KBW = w01d302Da == n;
    w01d302res(n,1) = nnz((w01d302K == 255).*w01d302KBW); % H1a fosi
end

% Fos
w01d302L = w01d302J(:,:,2);
imwrite(w01d302L,'w01d302L.tif');
for n = 1:max(w01d302Da(:))
    w01d302LBW = w01d302Da == n;
    w01d302res(n,2) = nnz((w01d302L == 255).*w01d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w01d303
% Freehand drawing and extraction
w01d303I = imread('w01d303HFB2.tif');
figure
imshow(w01d303I)
w01d303h = drawfreehand;
w01d303BW = createMask(w01d303h);
w01d303J = w01d303I.*uint8(w01d303BW);
figure
imshow(w01d303J)

% DAPI
w01d303BW2 = w01d303J(:,:,3) >= 75; %% <----- 30 or 100
w01d303BW3 = bwareaopen(w01d303BW2, 50);
w01d303BW4 = imfill(w01d303BW3, 'holes');
w01d303Da = bwlabel(w01d303BW4, 4);
imwrite(w01d303Da,'w01d303Da.tif');
max(w01d303Da(:))

% H1a 
w01d303K = w01d303J(:,:,1);
imwrite(w01d303K,'w01d303K.tif');
s = strel('disk', 2);
for n = 1:max(w01d303Da(:))
    w01d303KBW = w01d303Da == n;
    w01d303res(n,1) = nnz((w01d303K == 255).*w01d303KBW); % H1a fosi
end

% Fos
w01d303L = w01d303J(:,:,2);
imwrite(w01d303L,'w01d303L.tif');
for n = 1:max(w01d303Da(:))
    w01d303LBW = w01d303Da == n;
    w01d303res(n,2) = nnz((w01d303L == 255).*w01d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w01d304
% Freehand drawing and extraction
w01d304I = imread('w01d304HFB2.tif');
figure
imshow(w01d304I)
w01d304h = drawfreehand;
w01d304BW = createMask(w01d304h);
w01d304J = w01d304I.*uint8(w01d304BW);
figure
imshow(w01d304J)

% DAPI
w01d304BW2 = w01d304J(:,:,3) >= 75; %% <----- 30 or 100
w01d304BW3 = bwareaopen(w01d304BW2, 50);
w01d304BW4 = imfill(w01d304BW3, 'holes');
w01d304Da = bwlabel(w01d304BW4, 4);
imwrite(w01d304Da,'w01d304Da.tif');
max(w01d304Da(:))

% H1a 
w01d304K = w01d304J(:,:,1);
imwrite(w01d304K,'w01d304K.tif');
s = strel('disk', 2);
for n = 1:max(w01d304Da(:))
    w01d304KBW = w01d304Da == n;
    w01d304res(n,1) = nnz((w01d304K == 255).*w01d304KBW); % H1a fosi
end

% Fos
w01d304L = w01d304J(:,:,2);
imwrite(w01d304L,'w01d304L.tif');
for n = 1:max(w01d304Da(:))
    w01d304LBW = w01d304Da == n;
    w01d304res(n,2) = nnz((w01d304L == 255).*w01d304LBW); % Fos fosi
end



%% H1a-Fos catFISH  w02d301
% Freehand drawing and extraction
w02d301I = imread('w02d301HFB2.tif');
figure
imshow(w02d301I)
w02d301h = drawfreehand;
w02d301BW = createMask(w02d301h);
w02d301J = w02d301I.*uint8(w02d301BW);
figure
imshow(w02d301J)

% DAPI
w02d301BW2 = w02d301J(:,:,3) >= 75; %% <----- 30 or 100
w02d301BW3 = bwareaopen(w02d301BW2, 50);
w02d301BW4 = imfill(w02d301BW3, 'holes');
w02d301Da = bwlabel(w02d301BW4, 4);
imwrite(w02d301Da,'w02d301Da.tif');
max(w02d301Da(:))

% H1a 
w02d301K = w02d301J(:,:,1);
imwrite(w02d301K,'w02d301K.tif');
s = strel('disk', 2);
for n = 1:max(w02d301Da(:))
    w02d301KBW = w02d301Da == n;
    w02d301res(n,1) = nnz((w02d301K == 255).*w02d301KBW); % H1a fosi
end

% Fos
w02d301L = w02d301J(:,:,2);
imwrite(w02d301L,'w02d301L.tif');
for n = 1:max(w02d301Da(:))
    w02d301LBW = w02d301Da == n;
    w02d301res(n,2) = nnz((w02d301L == 255).*w02d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w02d302
% Freehand drawing and extraction
w02d302I = imread('w02d302HFB2.tif');
figure
imshow(w02d302I)
w02d302h = drawfreehand;
w02d302BW = createMask(w02d302h);
w02d302J = w02d302I.*uint8(w02d302BW);
figure
imshow(w02d302J)

% DAPI
w02d302BW2 = w02d302J(:,:,3) >= 75; %% <----- 30 or 100
w02d302BW3 = bwareaopen(w02d302BW2, 50);
w02d302BW4 = imfill(w02d302BW3, 'holes');
w02d302Da = bwlabel(w02d302BW4, 4);
imwrite(w02d302Da,'w02d302Da.tif');
max(w02d302Da(:))

% H1a 
w02d302K = w02d302J(:,:,1);
imwrite(w02d302K,'w02d302K.tif');
s = strel('disk', 2);
for n = 1:max(w02d302Da(:))
    w02d302KBW = w02d302Da == n;
    w02d302res(n,1) = nnz((w02d302K == 255).*w02d302KBW); % H1a fosi
end

% Fos
w02d302L = w02d302J(:,:,2);
imwrite(w02d302L,'w02d302L.tif');
for n = 1:max(w02d302Da(:))
    w02d302LBW = w02d302Da == n;
    w02d302res(n,2) = nnz((w02d302L == 255).*w02d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w02d303
% Freehand drawing and extraction
w02d303I = imread('w02d303HFB2.tif');
figure
imshow(w02d303I)
w02d303h = drawfreehand;
w02d303BW = createMask(w02d303h);
w02d303J = w02d303I.*uint8(w02d303BW);
figure
imshow(w02d303J)

% DAPI
w02d303BW2 = w02d303J(:,:,3) >= 75; %% <----- 30 or 100
w02d303BW3 = bwareaopen(w02d303BW2, 50);
w02d303BW4 = imfill(w02d303BW3, 'holes');
w02d303Da = bwlabel(w02d303BW4, 4);
imwrite(w02d303Da,'w02d303Da.tif');
max(w02d303Da(:))

% H1a 
w02d303K = w02d303J(:,:,1);
imwrite(w02d303K,'w02d303K.tif');
s = strel('disk', 2);
for n = 1:max(w02d303Da(:))
    w02d303KBW = w02d303Da == n;
    w02d303res(n,1) = nnz((w02d303K == 255).*w02d303KBW); % H1a fosi
end

% Fos
w02d303L = w02d303J(:,:,2);
imwrite(w02d303L,'w02d303L.tif');
for n = 1:max(w02d303Da(:))
    w02d303LBW = w02d303Da == n;
    w02d303res(n,2) = nnz((w02d303L == 255).*w02d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w02d304
% Freehand drawing and extraction
w02d304I = imread('w02d304HFB2.tif');
figure
imshow(w02d304I)
w02d304h = drawfreehand;
w02d304BW = createMask(w02d304h);
w02d304J = w02d304I.*uint8(w02d304BW);
figure
imshow(w02d304J)

% DAPI
w02d304BW2 = w02d304J(:,:,3) >= 75; %% <----- 30 or 100
w02d304BW3 = bwareaopen(w02d304BW2, 50);
w02d304BW4 = imfill(w02d304BW3, 'holes');
w02d304Da = bwlabel(w02d304BW4, 4);
imwrite(w02d304Da,'w02d304Da.tif');
max(w02d304Da(:))

% H1a 
w02d304K = w02d304J(:,:,1);
imwrite(w02d304K,'w02d304K.tif');
s = strel('disk', 2);
for n = 1:max(w02d304Da(:))
    w02d304KBW = w02d304Da == n;
    w02d304res(n,1) = nnz((w02d304K == 255).*w02d304KBW); % H1a fosi
end

% Fos
w02d304L = w02d304J(:,:,2);
imwrite(w02d304L,'w02d304L.tif');
for n = 1:max(w02d304Da(:))
    w02d304LBW = w02d304Da == n;
    w02d304res(n,2) = nnz((w02d304L == 255).*w02d304LBW); % Fos fosi
end



%% H1a-Fos catFISH  w03d301
% Freehand drawing and extraction
w03d301I = imread('w03d301HFB2.tif');
figure
imshow(w03d301I)
w03d301h = drawfreehand;
w03d301BW = createMask(w03d301h);
w03d301J = w03d301I.*uint8(w03d301BW);
figure
imshow(w03d301J)

% DAPI
w03d301BW2 = w03d301J(:,:,3) >= 75; %% <----- 30 or 100
w03d301BW3 = bwareaopen(w03d301BW2, 50);
w03d301BW4 = imfill(w03d301BW3, 'holes');
w03d301Da = bwlabel(w03d301BW4, 4);
imwrite(w03d301Da,'w03d301Da.tif');
max(w03d301Da(:))

% H1a 
w03d301K = w03d301J(:,:,1);
imwrite(w03d301K,'w03d301K.tif');
s = strel('disk', 2);
for n = 1:max(w03d301Da(:))
    w03d301KBW = w03d301Da == n;
    w03d301res(n,1) = nnz((w03d301K == 255).*w03d301KBW); % H1a fosi
end

% Fos
w03d301L = w03d301J(:,:,2);
imwrite(w03d301L,'w03d301L.tif');
for n = 1:max(w03d301Da(:))
    w03d301LBW = w03d301Da == n;
    w03d301res(n,2) = nnz((w03d301L == 255).*w03d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w03d302
% Freehand drawing and extraction
w03d302I = imread('w03d302HFB2.tif');
figure
imshow(w03d302I)
w03d302h = drawfreehand;
w03d302BW = createMask(w03d302h);
w03d302J = w03d302I.*uint8(w03d302BW);
figure
imshow(w03d302J)

% DAPI
w03d302BW2 = w03d302J(:,:,3) >= 75; %% <----- 30 or 100
w03d302BW3 = bwareaopen(w03d302BW2, 50);
w03d302BW4 = imfill(w03d302BW3, 'holes');
w03d302Da = bwlabel(w03d302BW4, 4);
imwrite(w03d302Da,'w03d302Da.tif');
max(w03d302Da(:))

% H1a 
w03d302K = w03d302J(:,:,1);
imwrite(w03d302K,'w03d302K.tif');
s = strel('disk', 2);
for n = 1:max(w03d302Da(:))
    w03d302KBW = w03d302Da == n;
    w03d302res(n,1) = nnz((w03d302K == 255).*w03d302KBW); % H1a fosi
end

% Fos
w03d302L = w03d302J(:,:,2);
imwrite(w03d302L,'w03d302L.tif');
for n = 1:max(w03d302Da(:))
    w03d302LBW = w03d302Da == n;
    w03d302res(n,2) = nnz((w03d302L == 255).*w03d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w03d303
% Freehand drawing and extraction
w03d303I = imread('w03d303HFB2.tif');
figure
imshow(w03d303I)
w03d303h = drawfreehand;
w03d303BW = createMask(w03d303h);
w03d303J = w03d303I.*uint8(w03d303BW);
figure
imshow(w03d303J)

% DAPI
w03d303BW2 = w03d303J(:,:,3) >= 75; %% <----- 30 or 100
w03d303BW3 = bwareaopen(w03d303BW2, 50);
w03d303BW4 = imfill(w03d303BW3, 'holes');
w03d303Da = bwlabel(w03d303BW4, 4);
imwrite(w03d303Da,'w03d303Da.tif');
max(w03d303Da(:))

% H1a 
w03d303K = w03d303J(:,:,1);
imwrite(w03d303K,'w03d303K.tif');
s = strel('disk', 2);
for n = 1:max(w03d303Da(:))
    w03d303KBW = w03d303Da == n;
    w03d303res(n,1) = nnz((w03d303K == 255).*w03d303KBW); % H1a fosi
end

% Fos
w03d303L = w03d303J(:,:,2);
imwrite(w03d303L,'w03d303L.tif');
for n = 1:max(w03d303Da(:))
    w03d303LBW = w03d303Da == n;
    w03d303res(n,2) = nnz((w03d303L == 255).*w03d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w03d304
% Freehand drawing and extraction
w03d304I = imread('w03d304HFB2.tif');
figure
imshow(w03d304I)
w03d304h = drawfreehand;
w03d304BW = createMask(w03d304h);
w03d304J = w03d304I.*uint8(w03d304BW);
figure
imshow(w03d304J)

% DAPI
w03d304BW2 = w03d304J(:,:,3) >= 75; %% <----- 30 or 100
w03d304BW3 = bwareaopen(w03d304BW2, 50);
w03d304BW4 = imfill(w03d304BW3, 'holes');
w03d304Da = bwlabel(w03d304BW4, 4);
imwrite(w03d304Da,'w03d304Da.tif');
max(w03d304Da(:))

% H1a 
w03d304K = w03d304J(:,:,1);
imwrite(w03d304K,'w03d304K.tif');
s = strel('disk', 2);
for n = 1:max(w03d304Da(:))
    w03d304KBW = w03d304Da == n;
    w03d304res(n,1) = nnz((w03d304K == 255).*w03d304KBW); % H1a fosi
end

% Fos
w03d304L = w03d304J(:,:,2);
imwrite(w03d304L,'w03d304L.tif');
for n = 1:max(w03d304Da(:))
    w03d304LBW = w03d304Da == n;
    w03d304res(n,2) = nnz((w03d304L == 255).*w03d304LBW); % Fos fosi
end


%% H1a-Fos catFISH  w04d301
% Freehand drawing and extraction
w04d301I = imread('w04d301HFB2.tif');
figure
imshow(w04d301I)
w04d301h = drawfreehand;
w04d301BW = createMask(w04d301h);
w04d301J = w04d301I.*uint8(w04d301BW);
figure
imshow(w04d301J)

% DAPI
w04d301BW2 = w04d301J(:,:,3) >= 75; %% <----- 30 or 100
w04d301BW3 = bwareaopen(w04d301BW2, 50);
w04d301BW4 = imfill(w04d301BW3, 'holes');
w04d301Da = bwlabel(w04d301BW4, 4);
imwrite(w04d301Da,'w04d301Da.tif');
max(w04d301Da(:))

% H1a 
w04d301K = w04d301J(:,:,1);
imwrite(w04d301K,'w04d301K.tif');
s = strel('disk', 2);
for n = 1:max(w04d301Da(:))
    w04d301KBW = w04d301Da == n;
    w04d301res(n,1) = nnz((w04d301K == 255).*w04d301KBW); % H1a fosi
end

% Fos
w04d301L = w04d301J(:,:,2);
imwrite(w04d301L,'w04d301L.tif');
for n = 1:max(w04d301Da(:))
    w04d301LBW = w04d301Da == n;
    w04d301res(n,2) = nnz((w04d301L == 255).*w04d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w04d302
% Freehand drawing and extraction
w04d302I = imread('w04d302HFB2.tif');
figure
imshow(w04d302I)
w04d302h = drawfreehand;
w04d302BW = createMask(w04d302h);
w04d302J = w04d302I.*uint8(w04d302BW);
figure
imshow(w04d302J)

% DAPI
w04d302BW2 = w04d302J(:,:,3) >= 75; %% <----- 30 or 100
w04d302BW3 = bwareaopen(w04d302BW2, 50);
w04d302BW4 = imfill(w04d302BW3, 'holes');
w04d302Da = bwlabel(w04d302BW4, 4);
imwrite(w04d302Da,'w04d302Da.tif');
max(w04d302Da(:))

% H1a 
w04d302K = w04d302J(:,:,1);
imwrite(w04d302K,'w04d302K.tif');
s = strel('disk', 2);
for n = 1:max(w04d302Da(:))
    w04d302KBW = w04d302Da == n;
    w04d302res(n,1) = nnz((w04d302K == 255).*w04d302KBW); % H1a fosi
end

% Fos
w04d302L = w04d302J(:,:,2);
imwrite(w04d302L,'w04d302L.tif');
for n = 1:max(w04d302Da(:))
    w04d302LBW = w04d302Da == n;
    w04d302res(n,2) = nnz((w04d302L == 255).*w04d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w04d303
% Freehand drawing and extraction
w04d303I = imread('w04d303HFB2.tif');
figure
imshow(w04d303I)
w04d303h = drawfreehand;
w04d303BW = createMask(w04d303h);
w04d303J = w04d303I.*uint8(w04d303BW);
figure
imshow(w04d303J)

% DAPI
w04d303BW2 = w04d303J(:,:,3) >= 75; %% <----- 30 or 100
w04d303BW3 = bwareaopen(w04d303BW2, 50);
w04d303BW4 = imfill(w04d303BW3, 'holes');
w04d303Da = bwlabel(w04d303BW4, 4);
imwrite(w04d303Da,'w04d303Da.tif');
max(w04d303Da(:))

% H1a 
w04d303K = w04d303J(:,:,1);
imwrite(w04d303K,'w04d303K.tif');
s = strel('disk', 2);
for n = 1:max(w04d303Da(:))
    w04d303KBW = w04d303Da == n;
    w04d303res(n,1) = nnz((w04d303K == 255).*w04d303KBW); % H1a fosi
end

% Fos
w04d303L = w04d303J(:,:,2);
imwrite(w04d303L,'w04d303L.tif');
for n = 1:max(w04d303Da(:))
    w04d303LBW = w04d303Da == n;
    w04d303res(n,2) = nnz((w04d303L == 255).*w04d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w04d304
% Freehand drawing and extraction
w04d304I = imread('w04d304HFB2.tif');
figure
imshow(w04d304I)
w04d304h = drawfreehand;
w04d304BW = createMask(w04d304h);
w04d304J = w04d304I.*uint8(w04d304BW);
figure
imshow(w04d304J)

% DAPI
w04d304BW2 = w04d304J(:,:,3) >= 75; %% <----- 30 or 100
w04d304BW3 = bwareaopen(w04d304BW2, 50);
w04d304BW4 = imfill(w04d304BW3, 'holes');
w04d304Da = bwlabel(w04d304BW4, 4);
imwrite(w04d304Da,'w04d304Da.tif');
max(w04d304Da(:))

% H1a 
w04d304K = w04d304J(:,:,1);
imwrite(w04d304K,'w04d304K.tif');
s = strel('disk', 2);
for n = 1:max(w04d304Da(:))
    w04d304KBW = w04d304Da == n;
    w04d304res(n,1) = nnz((w04d304K == 255).*w04d304KBW); % H1a fosi
end

% Fos
w04d304L = w04d304J(:,:,2);
imwrite(w04d304L,'w04d304L.tif');
for n = 1:max(w04d304Da(:))
    w04d304LBW = w04d304Da == n;
    w04d304res(n,2) = nnz((w04d304L == 255).*w04d304LBW); % Fos fosi
end



%% H1a-Fos catFISH  w05d301
% Freehand drawing and extraction
w05d301I = imread('w05d301HFB2.tif');
figure
imshow(w05d301I)
w05d301h = drawfreehand;
w05d301BW = createMask(w05d301h);
w05d301J = w05d301I.*uint8(w05d301BW);
figure
imshow(w05d301J)

% DAPI
w05d301BW2 = w05d301J(:,:,3) >= 75; %% <----- 30 or 100
w05d301BW3 = bwareaopen(w05d301BW2, 50);
w05d301BW4 = imfill(w05d301BW3, 'holes');
w05d301Da = bwlabel(w05d301BW4, 4);
imwrite(w05d301Da,'w05d301Da.tif');
max(w05d301Da(:))

% H1a 
w05d301K = w05d301J(:,:,1);
imwrite(w05d301K,'w05d301K.tif');
s = strel('disk', 2);
for n = 1:max(w05d301Da(:))
    w05d301KBW = w05d301Da == n;
    w05d301res(n,1) = nnz((w05d301K == 255).*w05d301KBW); % H1a fosi
end

% Fos
w05d301L = w05d301J(:,:,2);
imwrite(w05d301L,'w05d301L.tif');
for n = 1:max(w05d301Da(:))
    w05d301LBW = w05d301Da == n;
    w05d301res(n,2) = nnz((w05d301L == 255).*w05d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w05d302
% Freehand drawing and extraction
w05d302I = imread('w05d302HFB2.tif');
figure
imshow(w05d302I)
w05d302h = drawfreehand;
w05d302BW = createMask(w05d302h);
w05d302J = w05d302I.*uint8(w05d302BW);
figure
imshow(w05d302J)

% DAPI
w05d302BW2 = w05d302J(:,:,3) >= 75; %% <----- 30 or 100
w05d302BW3 = bwareaopen(w05d302BW2, 50);
w05d302BW4 = imfill(w05d302BW3, 'holes');
w05d302Da = bwlabel(w05d302BW4, 4);
imwrite(w05d302Da,'w05d302Da.tif');
max(w05d302Da(:))

% H1a 
w05d302K = w05d302J(:,:,1);
imwrite(w05d302K,'w05d302K.tif');
s = strel('disk', 2);
for n = 1:max(w05d302Da(:))
    w05d302KBW = w05d302Da == n;
    w05d302res(n,1) = nnz((w05d302K == 255).*w05d302KBW); % H1a fosi
end

% Fos
w05d302L = w05d302J(:,:,2);
imwrite(w05d302L,'w05d302L.tif');
for n = 1:max(w05d302Da(:))
    w05d302LBW = w05d302Da == n;
    w05d302res(n,2) = nnz((w05d302L == 255).*w05d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w05d303
% Freehand drawing and extraction
w05d303I = imread('w05d303HFB2.tif');
figure
imshow(w05d303I)
w05d303h = drawfreehand;
w05d303BW = createMask(w05d303h);
w05d303J = w05d303I.*uint8(w05d303BW);
figure
imshow(w05d303J)

% DAPI
w05d303BW2 = w05d303J(:,:,3) >= 75; %% <----- 30 or 100
w05d303BW3 = bwareaopen(w05d303BW2, 50);
w05d303BW4 = imfill(w05d303BW3, 'holes');
w05d303Da = bwlabel(w05d303BW4, 4);
imwrite(w05d303Da,'w05d303Da.tif');
max(w05d303Da(:))

% H1a 
w05d303K = w05d303J(:,:,1);
imwrite(w05d303K,'w05d303K.tif');
s = strel('disk', 2);
for n = 1:max(w05d303Da(:))
    w05d303KBW = w05d303Da == n;
    w05d303res(n,1) = nnz((w05d303K == 255).*w05d303KBW); % H1a fosi
end

% Fos
w05d303L = w05d303J(:,:,2);
imwrite(w05d303L,'w05d303L.tif');
for n = 1:max(w05d303Da(:))
    w05d303LBW = w05d303Da == n;
    w05d303res(n,2) = nnz((w05d303L == 255).*w05d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w06d301
% Freehand drawing and extraction
w06d301I = imread('w06d301HFB2.tif');
figure
imshow(w06d301I)
w06d301h = drawfreehand;
w06d301BW = createMask(w06d301h);
w06d301J = w06d301I.*uint8(w06d301BW);
figure
imshow(w06d301J)

% DAPI
w06d301BW2 = w06d301J(:,:,3) >= 75; %% <----- 30 or 100
w06d301BW3 = bwareaopen(w06d301BW2, 50);
w06d301BW4 = imfill(w06d301BW3, 'holes');
w06d301Da = bwlabel(w06d301BW4, 4);
imwrite(w06d301Da,'w06d301Da.tif');
max(w06d301Da(:))

% H1a 
w06d301K = w06d301J(:,:,1);
imwrite(w06d301K,'w06d301K.tif');
s = strel('disk', 2);
for n = 1:max(w06d301Da(:))
    w06d301KBW = w06d301Da == n;
    w06d301res(n,1) = nnz((w06d301K == 255).*w06d301KBW); % H1a fosi
end

% Fos
w06d301L = w06d301J(:,:,2);
imwrite(w06d301L,'w06d301L.tif');
for n = 1:max(w06d301Da(:))
    w06d301LBW = w06d301Da == n;
    w06d301res(n,2) = nnz((w06d301L == 255).*w06d301LBW); % Fos fosi
end



%% H1a-Fos catFISH  w06d302
% Freehand drawing and extraction
w06d302I = imread('w06d302HFB2.tif');
figure
imshow(w06d302I)
w06d302h = drawfreehand;
w06d302BW = createMask(w06d302h);
w06d302J = w06d302I.*uint8(w06d302BW);
figure
imshow(w06d302J)

% DAPI
w06d302BW2 = w06d302J(:,:,3) >= 75; %% <----- 30 or 100
w06d302BW3 = bwareaopen(w06d302BW2, 50);
w06d302BW4 = imfill(w06d302BW3, 'holes');
w06d302Da = bwlabel(w06d302BW4, 4);
imwrite(w06d302Da,'w06d302Da.tif');
max(w06d302Da(:))

% H1a 
w06d302K = w06d302J(:,:,1);
imwrite(w06d302K,'w06d302K.tif');
s = strel('disk', 2);
for n = 1:max(w06d302Da(:))
    w06d302KBW = w06d302Da == n;
    w06d302res(n,1) = nnz((w06d302K == 255).*w06d302KBW); % H1a fosi
end

% Fos
w06d302L = w06d302J(:,:,2);
imwrite(w06d302L,'w06d302L.tif');
for n = 1:max(w06d302Da(:))
    w06d302LBW = w06d302Da == n;
    w06d302res(n,2) = nnz((w06d302L == 255).*w06d302LBW); % Fos fosi
end



%% H1a-Fos catFISH  w06d303
% Freehand drawing and extraction
w06d303I = imread('w06d303HFB2.tif');
figure
imshow(w06d303I)
w06d303h = drawfreehand;
w06d303BW = createMask(w06d303h);
w06d303J = w06d303I.*uint8(w06d303BW);
figure
imshow(w06d303J)

% DAPI
w06d303BW2 = w06d303J(:,:,3) >= 75; %% <----- 30 or 100
w06d303BW3 = bwareaopen(w06d303BW2, 50);
w06d303BW4 = imfill(w06d303BW3, 'holes');
w06d303Da = bwlabel(w06d303BW4, 4);
imwrite(w06d303Da,'w06d303Da.tif');
max(w06d303Da(:))

% H1a 
w06d303K = w06d303J(:,:,1);
imwrite(w06d303K,'w06d303K.tif');
s = strel('disk', 2);
for n = 1:max(w06d303Da(:))
    w06d303KBW = w06d303Da == n;
    w06d303res(n,1) = nnz((w06d303K == 255).*w06d303KBW); % H1a fosi
end

% Fos
w06d303L = w06d303J(:,:,2);
imwrite(w06d303L,'w06d303L.tif');
for n = 1:max(w06d303Da(:))
    w06d303LBW = w06d303Da == n;
    w06d303res(n,2) = nnz((w06d303L == 255).*w06d303LBW); % Fos fosi
end



%% H1a-Fos catFISH  w06d304
% Freehand drawing and extraction
w06d304I = imread('w06d304HFB2.tif');
figure
imshow(w06d304I)
w06d304h = drawfreehand;
w06d304BW = createMask(w06d304h);
w06d304J = w06d304I.*uint8(w06d304BW);
figure
imshow(w06d304J)

% DAPI
w06d304BW2 = w06d304J(:,:,3) >= 75; %% <----- 30 or 100
w06d304BW3 = bwareaopen(w06d304BW2, 50);
w06d304BW4 = imfill(w06d304BW3, 'holes');
w06d304Da = bwlabel(w06d304BW4, 4);
imwrite(w06d304Da,'w06d304Da.tif');
max(w06d304Da(:))

% H1a 
w06d304K = w06d304J(:,:,1);
imwrite(w06d304K,'w06d304K.tif');
s = strel('disk', 2);
for n = 1:max(w06d304Da(:))
    w06d304KBW = w06d304Da == n;
    w06d304res(n,1) = nnz((w06d304K == 255).*w06d304KBW); % H1a fosi
end

% Fos
w06d304L = w06d304J(:,:,2);
imwrite(w06d304L,'w06d304L.tif');
for n = 1:max(w06d304Da(:))
    w06d304LBW = w06d304Da == n;
    w06d304res(n,2) = nnz((w06d304L == 255).*w06d304LBW); % Fos fosi
end


