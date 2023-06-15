%% Arc catFISH  w01d301
% Freehand drawing and extraction
w01d301I = imread('w01d301Arc.tif');
figure
imshow(w01d301I)
w01d301h = drawfreehand;
w01d301BW = createMask(w01d301h);
w01d301J = w01d301I.*uint8(w01d301BW);
figure
imshow(w01d301J)

% DAPI
w01d301BW2 = w01d301J(:,:,3) >=30;
w01d301BW3 = bwareaopen(w01d301BW2, 50);
w01d301Da = bwlabel(w01d301BW3);
max(w01d301Da(:))

% Arc 
w01d301Fo = w01d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w01d301Da(:))
    w01d301FoBW = w01d301Da == n;
    w01d301res(n,1) = nnz((w01d301Fo == 255).*w01d301FoBW); % Arc fosi
    w01d301Dil1 = imdilate(w01d301FoBW, s);
    w01d301Dil2 = logical(imfuse(w01d301Dil1, w01d301FoBW, 'diff'));
    w01d301res(n,2) = nnz((w01d301Fo == 128).*w01d301Dil2);  % Arc cyto
end


%% Arc catFISH  w01d302
% Freehand drawing and extraction
w01d302I = imread('w01d302Arc.tif');
figure
imshow(w01d302I)
w01d302h = drawfreehand;
w01d302BW = createMask(w01d302h);
w01d302J = w01d302I.*uint8(w01d302BW);
figure
imshow(w01d302J)

% DAPI
w01d302BW2 = w01d302J(:,:,3) >=30;
w01d302BW3 = bwareaopen(w01d302BW2, 50);
w01d302Da = bwlabel(w01d302BW3);
max(w01d302Da(:))

% Arc 
w01d302Fo = w01d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w01d302Da(:))
    w01d302FoBW = w01d302Da == n;
    w01d302res(n,1) = nnz((w01d302Fo == 255).*w01d302FoBW); % Arc fosi
    w01d302Dil1 = imdilate(w01d302FoBW, s);
    w01d302Dil2 = logical(imfuse(w01d302Dil1, w01d302FoBW, 'diff'));
    w01d302res(n,2) = nnz((w01d302Fo == 128).*w01d302Dil2);  % Arc cyto
end



%% Arc catFISH  w01d304
% Freehand drawing and extraction
w01d304I = imread('w01d304Arc.tif');
figure
imshow(w01d304I)
w01d304h = drawfreehand;
w01d304BW = createMask(w01d304h);
w01d304J = w01d304I.*uint8(w01d304BW);
figure
imshow(w01d304J)

% DAPI
w01d304BW2 = w01d304J(:,:,3) >=30;
w01d304BW3 = bwareaopen(w01d304BW2, 50);
w01d304Da = bwlabel(w01d304BW3);
max(w01d304Da(:))

% Arc 
w01d304Fo = w01d304J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w01d304Da(:))
    w01d304FoBW = w01d304Da == n;
    w01d304res(n,1) = nnz((w01d304Fo == 255).*w01d304FoBW); % Arc fosi
    w01d304Dil1 = imdilate(w01d304FoBW, s);
    w01d304Dil2 = logical(imfuse(w01d304Dil1, w01d304FoBW, 'diff'));
    w01d304res(n,2) = nnz((w01d304Fo == 128).*w01d304Dil2);  % Arc cyto
end


%% Arc catFISH  w01d305
% Freehand drawing and extraction
w01d305I = imread('w01d305Arc.tif');
figure
imshow(w01d305I)
w01d305h = drawfreehand;
w01d305BW = createMask(w01d305h);
w01d305J = w01d305I.*uint8(w01d305BW);
figure
imshow(w01d305J)

% DAPI
w01d305BW2 = w01d305J(:,:,3) >=30;
w01d305BW3 = bwareaopen(w01d305BW2, 50);
w01d305Da = bwlabel(w01d305BW3);
max(w01d305Da(:))

% Arc 
w01d305Fo = w01d305J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w01d305Da(:))
    w01d305FoBW = w01d305Da == n;
    w01d305res(n,1) = nnz((w01d305Fo == 255).*w01d305FoBW); % Arc fosi
    w01d305Dil1 = imdilate(w01d305FoBW, s);
    w01d305Dil2 = logical(imfuse(w01d305Dil1, w01d305FoBW, 'diff'));
    w01d305res(n,2) = nnz((w01d305Fo == 128).*w01d305Dil2);  % Arc cyto
end



%% Arc catFISH  w02d301
% Freehand drawing and extraction
w02d301I = imread('w02d301Arc.tif');
figure
imshow(w02d301I)
w02d301h = drawfreehand;
w02d301BW = createMask(w02d301h);
w02d301J = w02d301I.*uint8(w02d301BW);
figure
imshow(w02d301J)

% DAPI
w02d301BW2 = w02d301J(:,:,3) >=30;
w02d301BW3 = bwareaopen(w02d301BW2, 50);
w02d301Da = bwlabel(w02d301BW3);
max(w02d301Da(:))

% Arc 
w02d301Fo = w02d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w02d301Da(:))
    w02d301FoBW = w02d301Da == n;
    w02d301res(n,1) = nnz((w02d301Fo == 255).*w02d301FoBW); % Arc fosi
    w02d301Dil1 = imdilate(w02d301FoBW, s);
    w02d301Dil2 = logical(imfuse(w02d301Dil1, w02d301FoBW, 'diff'));
    w02d301res(n,2) = nnz((w02d301Fo == 128).*w02d301Dil2);  % Arc cyto
end



%% Arc catFISH  w02d303
% Freehand drawing and extraction
w02d303I = imread('w02d303Arc.tif');
figure
imshow(w02d303I)
w02d303h = drawfreehand;
w02d303BW = createMask(w02d303h);
w02d303J = w02d303I.*uint8(w02d303BW);
figure
imshow(w02d303J)

% DAPI
w02d303BW2 = w02d303J(:,:,3) >=30;
w02d303BW3 = bwareaopen(w02d303BW2, 50);
w02d303Da = bwlabel(w02d303BW3);
max(w02d303Da(:))

% Arc 
w02d303Fo = w02d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w02d303Da(:))
    w02d303FoBW = w02d303Da == n;
    w02d303res(n,1) = nnz((w02d303Fo == 255).*w02d303FoBW); % Arc fosi
    w02d303Dil1 = imdilate(w02d303FoBW, s);
    w02d303Dil2 = logical(imfuse(w02d303Dil1, w02d303FoBW, 'diff'));
    w02d303res(n,2) = nnz((w02d303Fo == 128).*w02d303Dil2);  % Arc cyto
end



%% Arc catFISH  w02d304
% Freehand drawing and extraction
w02d304I = imread('w02d304Arc.tif');
figure
imshow(w02d304I)
w02d304h = drawfreehand;
w02d304BW = createMask(w02d304h);
w02d304J = w02d304I.*uint8(w02d304BW);
figure
imshow(w02d304J)

% DAPI
w02d304BW2 = w02d304J(:,:,3) >=30;
w02d304BW3 = bwareaopen(w02d304BW2, 50);
w02d304Da = bwlabel(w02d304BW3);
max(w02d304Da(:))

% Arc 
w02d304Fo = w02d304J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w02d304Da(:))
    w02d304FoBW = w02d304Da == n;
    w02d304res(n,1) = nnz((w02d304Fo == 255).*w02d304FoBW); % Arc fosi
    w02d304Dil1 = imdilate(w02d304FoBW, s);
    w02d304Dil2 = logical(imfuse(w02d304Dil1, w02d304FoBW, 'diff'));
    w02d304res(n,2) = nnz((w02d304Fo == 128).*w02d304Dil2);  % Arc cyto
end



%% Arc catFISH  w03d301
% Freehand drawing and extraction
w03d301I = imread('w03d301Arc.tif');
figure
imshow(w03d301I)
w03d301h = drawfreehand;
w03d301BW = createMask(w03d301h);
w03d301J = w03d301I.*uint8(w03d301BW);
figure
imshow(w03d301J)

% DAPI
w03d301BW2 = w03d301J(:,:,3) >=30;
w03d301BW3 = bwareaopen(w03d301BW2, 50);
w03d301Da = bwlabel(w03d301BW3);
max(w03d301Da(:))

% Arc 
w03d301Fo = w03d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w03d301Da(:))
    w03d301FoBW = w03d301Da == n;
    w03d301res(n,1) = nnz((w03d301Fo == 255).*w03d301FoBW); % Arc fosi
    w03d301Dil1 = imdilate(w03d301FoBW, s);
    w03d301Dil2 = logical(imfuse(w03d301Dil1, w03d301FoBW, 'diff'));
    w03d301res(n,2) = nnz((w03d301Fo == 128).*w03d301Dil2);  % Arc cyto
end


%% Arc catFISH  w03d302
% Freehand drawing and extraction
w03d302I = imread('w03d302Arc.tif');
figure
imshow(w03d302I)
w03d302h = drawfreehand;
w03d302BW = createMask(w03d302h);
w03d302J = w03d302I.*uint8(w03d302BW);
figure
imshow(w03d302J)

% DAPI
w03d302BW2 = w03d302J(:,:,3) >=30;
w03d302BW3 = bwareaopen(w03d302BW2, 50);
w03d302Da = bwlabel(w03d302BW3);
max(w03d302Da(:))

% Arc 
w03d302Fo = w03d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w03d302Da(:))
    w03d302FoBW = w03d302Da == n;
    w03d302res(n,1) = nnz((w03d302Fo == 255).*w03d302FoBW); % Arc fosi
    w03d302Dil1 = imdilate(w03d302FoBW, s);
    w03d302Dil2 = logical(imfuse(w03d302Dil1, w03d302FoBW, 'diff'));
    w03d302res(n,2) = nnz((w03d302Fo == 128).*w03d302Dil2);  % Arc cyto
end


%% Arc catFISH  w03d303
% Freehand drawing and extraction
w03d303I = imread('w03d303Arc.tif');
figure
imshow(w03d303I)
w03d303h = drawfreehand;
w03d303BW = createMask(w03d303h);
w03d303J = w03d303I.*uint8(w03d303BW);
figure
imshow(w03d303J)

% DAPI
w03d303BW2 = w03d303J(:,:,3) >=30;
w03d303BW3 = bwareaopen(w03d303BW2, 50);
w03d303Da = bwlabel(w03d303BW3);
max(w03d303Da(:))

% Arc 
w03d303Fo = w03d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w03d303Da(:))
    w03d303FoBW = w03d303Da == n;
    w03d303res(n,1) = nnz((w03d303Fo == 255).*w03d303FoBW); % Arc fosi
    w03d303Dil1 = imdilate(w03d303FoBW, s);
    w03d303Dil2 = logical(imfuse(w03d303Dil1, w03d303FoBW, 'diff'));
    w03d303res(n,2) = nnz((w03d303Fo == 128).*w03d303Dil2);  % Arc cyto
end



%% Arc catFISH  w04d301
% Freehand drawing and extraction
w04d301I = imread('w04d301Arc.tif');
figure
imshow(w04d301I)
w04d301h = drawfreehand;
w04d301BW = createMask(w04d301h);
w04d301J = w04d301I.*uint8(w04d301BW);
figure
imshow(w04d301J)

% DAPI
w04d301BW2 = w04d301J(:,:,3) >=30;
w04d301BW3 = bwareaopen(w04d301BW2, 50);
w04d301Da = bwlabel(w04d301BW3);
max(w04d301Da(:))

% Arc 
w04d301Fo = w04d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w04d301Da(:))
    w04d301FoBW = w04d301Da == n;
    w04d301res(n,1) = nnz((w04d301Fo == 255).*w04d301FoBW); % Arc fosi
    w04d301Dil1 = imdilate(w04d301FoBW, s);
    w04d301Dil2 = logical(imfuse(w04d301Dil1, w04d301FoBW, 'diff'));
    w04d301res(n,2) = nnz((w04d301Fo == 128).*w04d301Dil2);  % Arc cyto
end


%% Arc catFISH  w04d302
% Freehand drawing and extraction
w04d302I = imread('w04d302Arc.tif');
figure
imshow(w04d302I)
w04d302h = drawfreehand;
w04d302BW = createMask(w04d302h);
w04d302J = w04d302I.*uint8(w04d302BW);
figure
imshow(w04d302J)

% DAPI
w04d302BW2 = w04d302J(:,:,3) >=30;
w04d302BW3 = bwareaopen(w04d302BW2, 50);
w04d302Da = bwlabel(w04d302BW3);
max(w04d302Da(:))

% Arc 
w04d302Fo = w04d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w04d302Da(:))
    w04d302FoBW = w04d302Da == n;
    w04d302res(n,1) = nnz((w04d302Fo == 255).*w04d302FoBW); % Arc fosi
    w04d302Dil1 = imdilate(w04d302FoBW, s);
    w04d302Dil2 = logical(imfuse(w04d302Dil1, w04d302FoBW, 'diff'));
    w04d302res(n,2) = nnz((w04d302Fo == 128).*w04d302Dil2);  % Arc cyto
end


%% Arc catFISH  w04d303
% Freehand drawing and extraction
w04d303I = imread('w04d303Arc.tif');
figure
imshow(w04d303I)
w04d303h = drawfreehand;
w04d303BW = createMask(w04d303h);
w04d303J = w04d303I.*uint8(w04d303BW);
figure
imshow(w04d303J)

% DAPI
w04d303BW2 = w04d303J(:,:,3) >=30;
w04d303BW3 = bwareaopen(w04d303BW2, 50);
w04d303Da = bwlabel(w04d303BW3);
max(w04d303Da(:))

% Arc 
w04d303Fo = w04d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w04d303Da(:))
    w04d303FoBW = w04d303Da == n;
    w04d303res(n,1) = nnz((w04d303Fo == 255).*w04d303FoBW); % Arc fosi
    w04d303Dil1 = imdilate(w04d303FoBW, s);
    w04d303Dil2 = logical(imfuse(w04d303Dil1, w04d303FoBW, 'diff'));
    w04d303res(n,2) = nnz((w04d303Fo == 128).*w04d303Dil2);  % Arc cyto
end




%% Arc catFISH  w04d308
% Freehand drawing and extraction
w04d308I = imread('w04d308Arc.tif');
figure
imshow(w04d308I)
w04d308h = drawfreehand;
w04d308BW = createMask(w04d308h);
w04d308J = w04d308I.*uint8(w04d308BW);
figure
imshow(w04d308J)

% DAPI
w04d308BW2 = w04d308J(:,:,3) >=30;
w04d308BW3 = bwareaopen(w04d308BW2, 50);
w04d308Da = bwlabel(w04d308BW3);
max(w04d308Da(:))

% Arc 
w04d308Fo = w04d308J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w04d308Da(:))
    w04d308FoBW = w04d308Da == n;
    w04d308res(n,1) = nnz((w04d308Fo == 255).*w04d308FoBW); % Arc fosi
    w04d308Dil1 = imdilate(w04d308FoBW, s);
    w04d308Dil2 = logical(imfuse(w04d308Dil1, w04d308FoBW, 'diff'));
    w04d308res(n,2) = nnz((w04d308Fo == 128).*w04d308Dil2);  % Arc cyto
end



%% Arc catFISH  w05d301
% Freehand drawing and extraction
w05d301I = imread('w05d301Arc.tif');
figure
imshow(w05d301I)
w05d301h = drawfreehand;
w05d301BW = createMask(w05d301h);
w05d301J = w05d301I.*uint8(w05d301BW);
figure
imshow(w05d301J)

% DAPI
w05d301BW2 = w05d301J(:,:,3) >=30;
w05d301BW3 = bwareaopen(w05d301BW2, 50);
w05d301Da = bwlabel(w05d301BW3);
max(w05d301Da(:))

% Arc 
w05d301Fo = w05d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w05d301Da(:))
    w05d301FoBW = w05d301Da == n;
    w05d301res(n,1) = nnz((w05d301Fo == 255).*w05d301FoBW); % Arc fosi
    w05d301Dil1 = imdilate(w05d301FoBW, s);
    w05d301Dil2 = logical(imfuse(w05d301Dil1, w05d301FoBW, 'diff'));
    w05d301res(n,2) = nnz((w05d301Fo == 128).*w05d301Dil2);  % Arc cyto
end


%% Arc catFISH  w05d302
% Freehand drawing and extraction
w05d302I = imread('w05d302Arc.tif');
figure
imshow(w05d302I)
w05d302h = drawfreehand;
w05d302BW = createMask(w05d302h);
w05d302J = w05d302I.*uint8(w05d302BW);
figure
imshow(w05d302J)

% DAPI
w05d302BW2 = w05d302J(:,:,3) >=30;
w05d302BW3 = bwareaopen(w05d302BW2, 50);
w05d302Da = bwlabel(w05d302BW3);
max(w05d302Da(:))

% Arc 
w05d302Fo = w05d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w05d302Da(:))
    w05d302FoBW = w05d302Da == n;
    w05d302res(n,1) = nnz((w05d302Fo == 255).*w05d302FoBW); % Arc fosi
    w05d302Dil1 = imdilate(w05d302FoBW, s);
    w05d302Dil2 = logical(imfuse(w05d302Dil1, w05d302FoBW, 'diff'));
    w05d302res(n,2) = nnz((w05d302Fo == 128).*w05d302Dil2);  % Arc cyto
end


%% Arc catFISH  w05d303
% Freehand drawing and extraction
w05d303I = imread('w05d303Arc.tif');
figure
imshow(w05d303I)
w05d303h = drawfreehand;
w05d303BW = createMask(w05d303h);
w05d303J = w05d303I.*uint8(w05d303BW);
figure
imshow(w05d303J)

% DAPI
w05d303BW2 = w05d303J(:,:,3) >=30;
w05d303BW3 = bwareaopen(w05d303BW2, 50);
w05d303Da = bwlabel(w05d303BW3);
max(w05d303Da(:))

% Arc 
w05d303Fo = w05d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w05d303Da(:))
    w05d303FoBW = w05d303Da == n;
    w05d303res(n,1) = nnz((w05d303Fo == 255).*w05d303FoBW); % Arc fosi
    w05d303Dil1 = imdilate(w05d303FoBW, s);
    w05d303Dil2 = logical(imfuse(w05d303Dil1, w05d303FoBW, 'diff'));
    w05d303res(n,2) = nnz((w05d303Fo == 128).*w05d303Dil2);  % Arc cyto
end



%% Arc catFISH  w06d301
% Freehand drawing and extraction
w06d301I = imread('w06d301Arc.tif');
figure
imshow(w06d301I)
w06d301h = drawfreehand;
w06d301BW = createMask(w06d301h);
w06d301J = w06d301I.*uint8(w06d301BW);
figure
imshow(w06d301J)

% DAPI
w06d301BW2 = w06d301J(:,:,3) >=30;
w06d301BW3 = bwareaopen(w06d301BW2, 50);
w06d301Da = bwlabel(w06d301BW3);
max(w06d301Da(:))

% Arc 
w06d301Fo = w06d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w06d301Da(:))
    w06d301FoBW = w06d301Da == n;
    w06d301res(n,1) = nnz((w06d301Fo == 255).*w06d301FoBW); % Arc fosi
    w06d301Dil1 = imdilate(w06d301FoBW, s);
    w06d301Dil2 = logical(imfuse(w06d301Dil1, w06d301FoBW, 'diff'));
    w06d301res(n,2) = nnz((w06d301Fo == 128).*w06d301Dil2);  % Arc cyto
end



%% Arc catFISH  w06d302
% Freehand drawing and extraction
w06d302I = imread('w06d302Arc.tif');
figure
imshow(w06d302I)
w06d302h = drawfreehand;
w06d302BW = createMask(w06d302h);
w06d302J = w06d302I.*uint8(w06d302BW);
figure
imshow(w06d302J)

% DAPI
w06d302BW2 = w06d302J(:,:,3) >=30;
w06d302BW3 = bwareaopen(w06d302BW2, 50);
w06d302Da = bwlabel(w06d302BW3);
max(w06d302Da(:))

% Arc 
w06d302Fo = w06d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w06d302Da(:))
    w06d302FoBW = w06d302Da == n;
    w06d302res(n,1) = nnz((w06d302Fo == 255).*w06d302FoBW); % Arc fosi
    w06d302Dil1 = imdilate(w06d302FoBW, s);
    w06d302Dil2 = logical(imfuse(w06d302Dil1, w06d302FoBW, 'diff'));
    w06d302res(n,2) = nnz((w06d302Fo == 128).*w06d302Dil2);  % Arc cyto
end


%% Arc catFISH  w06d303
% Freehand drawing and extraction
w06d303I = imread('w06d303Arc.tif');
figure
imshow(w06d303I)
w06d303h = drawfreehand;
w06d303BW = createMask(w06d303h);
w06d303J = w06d303I.*uint8(w06d303BW);
figure
imshow(w06d303J)

% DAPI
w06d303BW2 = w06d303J(:,:,3) >=30;
w06d303BW3 = bwareaopen(w06d303BW2, 50);
w06d303Da = bwlabel(w06d303BW3);
max(w06d303Da(:))

% Arc 
w06d303Fo = w06d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w06d303Da(:))
    w06d303FoBW = w06d303Da == n;
    w06d303res(n,1) = nnz((w06d303Fo == 255).*w06d303FoBW); % Arc fosi
    w06d303Dil1 = imdilate(w06d303FoBW, s);
    w06d303Dil2 = logical(imfuse(w06d303Dil1, w06d303FoBW, 'diff'));
    w06d303res(n,2) = nnz((w06d303Fo == 128).*w06d303Dil2);  % Arc cyto
end


%% Arc catFISH  w06d308
% Freehand drawing and extraction
w06d308I = imread('w06d308Arc.tif');
figure
imshow(w06d308I)
w06d308h = drawfreehand;
w06d308BW = createMask(w06d308h);
w06d308J = w06d308I.*uint8(w06d308BW);
figure
imshow(w06d308J)

% DAPI
w06d308BW2 = w06d308J(:,:,3) >=30;
w06d308BW3 = bwareaopen(w06d308BW2, 50);
w06d308Da = bwlabel(w06d308BW3);
max(w06d308Da(:))

% Arc 
w06d308Fo = w06d308J(:,:,1);
s = strel('disk', 2);
for n = 1:max(w06d308Da(:))
    w06d308FoBW = w06d308Da == n;
    w06d308res(n,1) = nnz((w06d308Fo == 255).*w06d308FoBW); % Arc fosi
    w06d308Dil1 = imdilate(w06d308FoBW, s);
    w06d308Dil2 = logical(imfuse(w06d308Dil1, w06d308FoBW, 'diff'));
    w06d308res(n,2) = nnz((w06d308Fo == 128).*w06d308Dil2);  % Arc cyto
end

