%% Arc catFISH  cre01d301
% Freehand drawing and extraction
cre01d301I = imread('cre01d301Arc.tif');
figure
imshow(cre01d301I)
cre01d301h = drawfreehand;
cre01d301BW = createMask(cre01d301h);
cre01d301J = cre01d301I.*uint8(cre01d301BW);
figure
imshow(cre01d301J)

% DAPI
cre01d301BW2 = cre01d301J(:,:,3) >=30;
cre01d301BW3 = bwareaopen(cre01d301BW2, 50);
cre01d301Da = bwlabel(cre01d301BW3);
max(cre01d301Da(:))

% Arc 
cre01d301Fo = cre01d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre01d301Da(:))
    cre01d301FoBW = cre01d301Da == n;
    cre01d301res(n,1) = nnz((cre01d301Fo == 255).*cre01d301FoBW); % Arc fosi
    cre01d301Dil1 = imdilate(cre01d301FoBW, s);
    cre01d301Dil2 = logical(imfuse(cre01d301Dil1, cre01d301FoBW, 'diff'));
    cre01d301res(n,2) = nnz((cre01d301Fo == 128).*cre01d301Dil2);  % Arc cyto
end

%% Arc catFISH  cre01d302
% Freehand drawing and extraction
cre01d302I = imread('cre01d302Arc.tif');
figure
imshow(cre01d302I)
cre01d302h = drawfreehand;
cre01d302BW = createMask(cre01d302h);
cre01d302J = cre01d302I.*uint8(cre01d302BW);
figure
imshow(cre01d302J)

% DAPI
cre01d302BW2 = cre01d302J(:,:,3) >=30;
cre01d302BW3 = bwareaopen(cre01d302BW2, 50);
cre01d302Da = bwlabel(cre01d302BW3);
max(cre01d302Da(:))

% Arc 
cre01d302Fo = cre01d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre01d302Da(:))
    cre01d302FoBW = cre01d302Da == n;
    cre01d302res(n,1) = nnz((cre01d302Fo == 255).*cre01d302FoBW); % Arc fosi
    cre01d302Dil1 = imdilate(cre01d302FoBW, s);
    cre01d302Dil2 = logical(imfuse(cre01d302Dil1, cre01d302FoBW, 'diff'));
    cre01d302res(n,2) = nnz((cre01d302Fo == 128).*cre01d302Dil2);  % Arc cyto
end

%% Arc catFISH  cre01d304
% Freehand drawing and extraction
cre01d304I = imread('cre01d304Arc.tif');
figure
imshow(cre01d304I)
cre01d304h = drawfreehand;
cre01d304BW = createMask(cre01d304h);
cre01d304J = cre01d304I.*uint8(cre01d304BW);
figure
imshow(cre01d304J)

% DAPI
cre01d304BW2 = cre01d304J(:,:,3) >=30;
cre01d304BW3 = bwareaopen(cre01d304BW2, 50);
cre01d304Da = bwlabel(cre01d304BW3);
max(cre01d304Da(:))

% Arc 
cre01d304Fo = cre01d304J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre01d304Da(:))
    cre01d304FoBW = cre01d304Da == n;
    cre01d304res(n,1) = nnz((cre01d304Fo == 255).*cre01d304FoBW); % Arc fosi
    cre01d304Dil1 = imdilate(cre01d304FoBW, s);
    cre01d304Dil2 = logical(imfuse(cre01d304Dil1, cre01d304FoBW, 'diff'));
    cre01d304res(n,2) = nnz((cre01d304Fo == 128).*cre01d304Dil2);  % Arc cyto
end


%% Arc catFISH  cre02d301
% Freehand drawing and extraction
cre02d301I = imread('cre02d301Arc.tif');
figure
imshow(cre02d301I)
cre02d301h = drawfreehand;
cre02d301BW = createMask(cre02d301h);
cre02d301J = cre02d301I.*uint8(cre02d301BW);
figure
imshow(cre02d301J)

% DAPI
cre02d301BW2 = cre02d301J(:,:,3) >=30;
cre02d301BW3 = bwareaopen(cre02d301BW2, 50);
cre02d301Da = bwlabel(cre02d301BW3);
max(cre02d301Da(:))

% Arc 
cre02d301Fo = cre02d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre02d301Da(:))
    cre02d301FoBW = cre02d301Da == n;
    cre02d301res(n,1) = nnz((cre02d301Fo == 255).*cre02d301FoBW); % Arc fosi
    cre02d301Dil1 = imdilate(cre02d301FoBW, s);
    cre02d301Dil2 = logical(imfuse(cre02d301Dil1, cre02d301FoBW, 'diff'));
    cre02d301res(n,2) = nnz((cre02d301Fo == 128).*cre02d301Dil2);  % Arc cyto
end


%% Arc catFISH  cre02d303
% Freehand drawing and extraction
cre02d303I = imread('cre02d303Arc.tif');
figure
imshow(cre02d303I)
cre02d303h = drawfreehand;
cre02d303BW = createMask(cre02d303h);
cre02d303J = cre02d303I.*uint8(cre02d303BW);
figure
imshow(cre02d303J)

% DAPI
cre02d303BW2 = cre02d303J(:,:,3) >=30;
cre02d303BW3 = bwareaopen(cre02d303BW2, 50);
cre02d303Da = bwlabel(cre02d303BW3);
max(cre02d303Da(:))

% Arc 
cre02d303Fo = cre02d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre02d303Da(:))
    cre02d303FoBW = cre02d303Da == n;
    cre02d303res(n,1) = nnz((cre02d303Fo == 255).*cre02d303FoBW); % Arc fosi
    cre02d303Dil1 = imdilate(cre02d303FoBW, s);
    cre02d303Dil2 = logical(imfuse(cre02d303Dil1, cre02d303FoBW, 'diff'));
    cre02d303res(n,2) = nnz((cre02d303Fo == 128).*cre02d303Dil2);  % Arc cyto
end


%% Arc catFISH  cre02d306
% Freehand drawing and extraction
cre02d306I = imread('cre02d306Arc.tif');
figure
imshow(cre02d306I)
cre02d306h = drawfreehand;
cre02d306BW = createMask(cre02d306h);
cre02d306J = cre02d306I.*uint8(cre02d306BW);
figure
imshow(cre02d306J)

% DAPI
cre02d306BW2 = cre02d306J(:,:,3) >=30;
cre02d306BW3 = bwareaopen(cre02d306BW2, 50);
cre02d306Da = bwlabel(cre02d306BW3);
max(cre02d306Da(:))

% Arc 
cre02d306Fo = cre02d306J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre02d306Da(:))
    cre02d306FoBW = cre02d306Da == n;
    cre02d306res(n,1) = nnz((cre02d306Fo == 255).*cre02d306FoBW); % Arc fosi
    cre02d306Dil1 = imdilate(cre02d306FoBW, s);
    cre02d306Dil2 = logical(imfuse(cre02d306Dil1, cre02d306FoBW, 'diff'));
    cre02d306res(n,2) = nnz((cre02d306Fo == 128).*cre02d306Dil2);  % Arc cyto
end


%% Arc catFISH  cre02d308
% Freehand drawing and extraction
cre02d308I = imread('cre02d308Arc.tif');
figure
imshow(cre02d308I)
cre02d308h = drawfreehand;
cre02d308BW = createMask(cre02d308h);
cre02d308J = cre02d308I.*uint8(cre02d308BW);
figure
imshow(cre02d308J)

% DAPI
cre02d308BW2 = cre02d308J(:,:,3) >=30;
cre02d308BW3 = bwareaopen(cre02d308BW2, 50);
cre02d308Da = bwlabel(cre02d308BW3);
max(cre02d308Da(:))

% Arc 
cre02d308Fo = cre02d308J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre02d308Da(:))
    cre02d308FoBW = cre02d308Da == n;
    cre02d308res(n,1) = nnz((cre02d308Fo == 255).*cre02d308FoBW); % Arc fosi
    cre02d308Dil1 = imdilate(cre02d308FoBW, s);
    cre02d308Dil2 = logical(imfuse(cre02d308Dil1, cre02d308FoBW, 'diff'));
    cre02d308res(n,2) = nnz((cre02d308Fo == 128).*cre02d308Dil2);  % Arc cyto
end


%% Arc catFISH  cre02d309
% Freehand drawing and extraction
cre02d309I = imread('cre02d309Arc.tif');
figure
imshow(cre02d309I)
cre02d309h = drawfreehand;
cre02d309BW = createMask(cre02d309h);
cre02d309J = cre02d309I.*uint8(cre02d309BW);
figure
imshow(cre02d309J)

% DAPI
cre02d309BW2 = cre02d309J(:,:,3) >=30;
cre02d309BW3 = bwareaopen(cre02d309BW2, 50);
cre02d309Da = bwlabel(cre02d309BW3);
max(cre02d309Da(:))

% Arc 
cre02d309Fo = cre02d309J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre02d309Da(:))
    cre02d309FoBW = cre02d309Da == n;
    cre02d309res(n,1) = nnz((cre02d309Fo == 255).*cre02d309FoBW); % Arc fosi
    cre02d309Dil1 = imdilate(cre02d309FoBW, s);
    cre02d309Dil2 = logical(imfuse(cre02d309Dil1, cre02d309FoBW, 'diff'));
    cre02d309res(n,2) = nnz((cre02d309Fo == 128).*cre02d309Dil2);  % Arc cyto
end


%% Arc catFISH  cre03d301
% Freehand drawing and extraction
cre03d301I = imread('cre03d301Arc.tif');
figure
imshow(cre03d301I)
cre03d301h = drawfreehand;
cre03d301BW = createMask(cre03d301h);
cre03d301J = cre03d301I.*uint8(cre03d301BW);
figure
imshow(cre03d301J)

% DAPI
cre03d301BW2 = cre03d301J(:,:,3) >=30;
cre03d301BW3 = bwareaopen(cre03d301BW2, 50);
cre03d301Da = bwlabel(cre03d301BW3);
max(cre03d301Da(:))

% Arc 
cre03d301Fo = cre03d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre03d301Da(:))
    cre03d301FoBW = cre03d301Da == n;
    cre03d301res(n,1) = nnz((cre03d301Fo == 255).*cre03d301FoBW); % Arc fosi
    cre03d301Dil1 = imdilate(cre03d301FoBW, s);
    cre03d301Dil2 = logical(imfuse(cre03d301Dil1, cre03d301FoBW, 'diff'));
    cre03d301res(n,2) = nnz((cre03d301Fo == 128).*cre03d301Dil2);  % Arc cyto
end


%% Arc catFISH  cre03d302
% Freehand drawing and extraction
cre03d302I = imread('cre03d302Arc.tif');
figure
imshow(cre03d302I)
cre03d302h = drawfreehand;
cre03d302BW = createMask(cre03d302h);
cre03d302J = cre03d302I.*uint8(cre03d302BW);
figure
imshow(cre03d302J)

% DAPI
cre03d302BW2 = cre03d302J(:,:,3) >=30;
cre03d302BW3 = bwareaopen(cre03d302BW2, 50);
cre03d302Da = bwlabel(cre03d302BW3);
max(cre03d302Da(:))

% Arc 
cre03d302Fo = cre03d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre03d302Da(:))
    cre03d302FoBW = cre03d302Da == n;
    cre03d302res(n,1) = nnz((cre03d302Fo == 255).*cre03d302FoBW); % Arc fosi
    cre03d302Dil1 = imdilate(cre03d302FoBW, s);
    cre03d302Dil2 = logical(imfuse(cre03d302Dil1, cre03d302FoBW, 'diff'));
    cre03d302res(n,2) = nnz((cre03d302Fo == 128).*cre03d302Dil2);  % Arc cyto
end


%% Arc catFISH  cre03d303
% Freehand drawing and extraction
cre03d303I = imread('cre03d303Arc.tif');
figure
imshow(cre03d303I)
cre03d303h = drawfreehand;
cre03d303BW = createMask(cre03d303h);
cre03d303J = cre03d303I.*uint8(cre03d303BW);
figure
imshow(cre03d303J)

% DAPI
cre03d303BW2 = cre03d303J(:,:,3) >=30;
cre03d303BW3 = bwareaopen(cre03d303BW2, 50);
cre03d303Da = bwlabel(cre03d303BW3);
max(cre03d303Da(:))

% Arc 
cre03d303Fo = cre03d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre03d303Da(:))
    cre03d303FoBW = cre03d303Da == n;
    cre03d303res(n,1) = nnz((cre03d303Fo == 255).*cre03d303FoBW); % Arc fosi
    cre03d303Dil1 = imdilate(cre03d303FoBW, s);
    cre03d303Dil2 = logical(imfuse(cre03d303Dil1, cre03d303FoBW, 'diff'));
    cre03d303res(n,2) = nnz((cre03d303Fo == 128).*cre03d303Dil2);  % Arc cyto
end





%% Arc catFISH  cre04d301
% Freehand drawing and extraction
cre04d301I = imread('cre04d301Arc.tif');
figure
imshow(cre04d301I)
cre04d301h = drawfreehand;
cre04d301BW = createMask(cre04d301h);
cre04d301J = cre04d301I.*uint8(cre04d301BW);
figure
imshow(cre04d301J)

% DAPI
cre04d301BW2 = cre04d301J(:,:,3) >=30;
cre04d301BW3 = bwareaopen(cre04d301BW2, 50);
cre04d301Da = bwlabel(cre04d301BW3);
max(cre04d301Da(:))

% Arc 
cre04d301Fo = cre04d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre04d301Da(:))
    cre04d301FoBW = cre04d301Da == n;
    cre04d301res(n,1) = nnz((cre04d301Fo == 255).*cre04d301FoBW); % Arc fosi
    cre04d301Dil1 = imdilate(cre04d301FoBW, s);
    cre04d301Dil2 = logical(imfuse(cre04d301Dil1, cre04d301FoBW, 'diff'));
    cre04d301res(n,2) = nnz((cre04d301Fo == 128).*cre04d301Dil2);  % Arc cyto
end



%% Arc catFISH  cre04d302
% Freehand drawing and extraction
cre04d302I = imread('cre04d302Arc.tif');
figure
imshow(cre04d302I)
cre04d302h = drawfreehand;
cre04d302BW = createMask(cre04d302h);
cre04d302J = cre04d302I.*uint8(cre04d302BW);
figure
imshow(cre04d302J)

% DAPI
cre04d302BW2 = cre04d302J(:,:,3) >=30;
cre04d302BW3 = bwareaopen(cre04d302BW2, 50);
cre04d302Da = bwlabel(cre04d302BW3);
max(cre04d302Da(:))

% Arc 
cre04d302Fo = cre04d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre04d302Da(:))
    cre04d302FoBW = cre04d302Da == n;
    cre04d302res(n,1) = nnz((cre04d302Fo == 255).*cre04d302FoBW); % Arc fosi
    cre04d302Dil1 = imdilate(cre04d302FoBW, s);
    cre04d302Dil2 = logical(imfuse(cre04d302Dil1, cre04d302FoBW, 'diff'));
    cre04d302res(n,2) = nnz((cre04d302Fo == 128).*cre04d302Dil2);  % Arc cyto
end


%% Arc catFISH  cre04d303
% Freehand drawing and extraction
cre04d303I = imread('cre04d303Arc.tif');
figure
imshow(cre04d303I)
cre04d303h = drawfreehand;
cre04d303BW = createMask(cre04d303h);
cre04d303J = cre04d303I.*uint8(cre04d303BW);
figure
imshow(cre04d303J)

% DAPI
cre04d303BW2 = cre04d303J(:,:,3) >=30;
cre04d303BW3 = bwareaopen(cre04d303BW2, 50);
cre04d303Da = bwlabel(cre04d303BW3);
max(cre04d303Da(:))

% Arc 
cre04d303Fo = cre04d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre04d303Da(:))
    cre04d303FoBW = cre04d303Da == n;
    cre04d303res(n,1) = nnz((cre04d303Fo == 255).*cre04d303FoBW); % Arc fosi
    cre04d303Dil1 = imdilate(cre04d303FoBW, s);
    cre04d303Dil2 = logical(imfuse(cre04d303Dil1, cre04d303FoBW, 'diff'));
    cre04d303res(n,2) = nnz((cre04d303Fo == 128).*cre04d303Dil2);  % Arc cyto
end



%% Arc catFISH  cre04d308
% Freehand drawing and extraction
cre04d308I = imread('cre04d308Arc.tif');
figure
imshow(cre04d308I)
cre04d308h = drawfreehand;
cre04d308BW = createMask(cre04d308h);
cre04d308J = cre04d308I.*uint8(cre04d308BW);
figure
imshow(cre04d308J)

% DAPI
cre04d308BW2 = cre04d308J(:,:,3) >=30;
cre04d308BW3 = bwareaopen(cre04d308BW2, 50);
cre04d308Da = bwlabel(cre04d308BW3);
max(cre04d308Da(:))

% Arc 
cre04d308Fo = cre04d308J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre04d308Da(:))
    cre04d308FoBW = cre04d308Da == n;
    cre04d308res(n,1) = nnz((cre04d308Fo == 255).*cre04d308FoBW); % Arc fosi
    cre04d308Dil1 = imdilate(cre04d308FoBW, s);
    cre04d308Dil2 = logical(imfuse(cre04d308Dil1, cre04d308FoBW, 'diff'));
    cre04d308res(n,2) = nnz((cre04d308Fo == 128).*cre04d308Dil2);  % Arc cyto
end



%% Arc catFISH  cre05d301
% Freehand drawing and extraction
cre05d301I = imread('cre05d301Arc.tif');
figure
imshow(cre05d301I)
cre05d301h = drawfreehand;
cre05d301BW = createMask(cre05d301h);
cre05d301J = cre05d301I.*uint8(cre05d301BW);
figure
imshow(cre05d301J)

% DAPI
cre05d301BW2 = cre05d301J(:,:,3) >=30;
cre05d301BW3 = bwareaopen(cre05d301BW2, 50);
cre05d301Da = bwlabel(cre05d301BW3);
max(cre05d301Da(:))

% Arc 
cre05d301Fo = cre05d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre05d301Da(:))
    cre05d301FoBW = cre05d301Da == n;
    cre05d301res(n,1) = nnz((cre05d301Fo == 255).*cre05d301FoBW); % Arc fosi
    cre05d301Dil1 = imdilate(cre05d301FoBW, s);
    cre05d301Dil2 = logical(imfuse(cre05d301Dil1, cre05d301FoBW, 'diff'));
    cre05d301res(n,2) = nnz((cre05d301Fo == 128).*cre05d301Dil2);  % Arc cyto
end



%% Arc catFISH  cre05d302
% Freehand drawing and extraction
cre05d302I = imread('cre05d302Arc.tif');
figure
imshow(cre05d302I)
cre05d302h = drawfreehand;
cre05d302BW = createMask(cre05d302h);
cre05d302J = cre05d302I.*uint8(cre05d302BW);
figure
imshow(cre05d302J)

% DAPI
cre05d302BW2 = cre05d302J(:,:,3) >=30;
cre05d302BW3 = bwareaopen(cre05d302BW2, 50);
cre05d302Da = bwlabel(cre05d302BW3);
max(cre05d302Da(:))

% Arc 
cre05d302Fo = cre05d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre05d302Da(:))
    cre05d302FoBW = cre05d302Da == n;
    cre05d302res(n,1) = nnz((cre05d302Fo == 255).*cre05d302FoBW); % Arc fosi
    cre05d302Dil1 = imdilate(cre05d302FoBW, s);
    cre05d302Dil2 = logical(imfuse(cre05d302Dil1, cre05d302FoBW, 'diff'));
    cre05d302res(n,2) = nnz((cre05d302Fo == 128).*cre05d302Dil2);  % Arc cyto
end


%% Arc catFISH  cre05d303
% Freehand drawing and extraction
cre05d303I = imread('cre05d303Arc.tif');
figure
imshow(cre05d303I)
cre05d303h = drawfreehand;
cre05d303BW = createMask(cre05d303h);
cre05d303J = cre05d303I.*uint8(cre05d303BW);
figure
imshow(cre05d303J)

% DAPI
cre05d303BW2 = cre05d303J(:,:,3) >=30;
cre05d303BW3 = bwareaopen(cre05d303BW2, 50);
cre05d303Da = bwlabel(cre05d303BW3);
max(cre05d303Da(:))

% Arc 
cre05d303Fo = cre05d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre05d303Da(:))
    cre05d303FoBW = cre05d303Da == n;
    cre05d303res(n,1) = nnz((cre05d303Fo == 255).*cre05d303FoBW); % Arc fosi
    cre05d303Dil1 = imdilate(cre05d303FoBW, s);
    cre05d303Dil2 = logical(imfuse(cre05d303Dil1, cre05d303FoBW, 'diff'));
    cre05d303res(n,2) = nnz((cre05d303Fo == 128).*cre05d303Dil2);  % Arc cyto
end



%% Arc catFISH  cre05d304
% Freehand drawing and extraction
cre05d304I = imread('cre05d304Arc.tif');
figure
imshow(cre05d304I)
cre05d304h = drawfreehand;
cre05d304BW = createMask(cre05d304h);
cre05d304J = cre05d304I.*uint8(cre05d304BW);
figure
imshow(cre05d304J)

% DAPI
cre05d304BW2 = cre05d304J(:,:,3) >=30;
cre05d304BW3 = bwareaopen(cre05d304BW2, 50);
cre05d304Da = bwlabel(cre05d304BW3);
max(cre05d304Da(:))

% Arc 
cre05d304Fo = cre05d304J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre05d304Da(:))
    cre05d304FoBW = cre05d304Da == n;
    cre05d304res(n,1) = nnz((cre05d304Fo == 255).*cre05d304FoBW); % Arc fosi
    cre05d304Dil1 = imdilate(cre05d304FoBW, s);
    cre05d304Dil2 = logical(imfuse(cre05d304Dil1, cre05d304FoBW, 'diff'));
    cre05d304res(n,2) = nnz((cre05d304Fo == 128).*cre05d304Dil2);  % Arc cyto
end


%% Arc catFISH  cre06d301
% Freehand drawing and extraction
cre06d301I = imread('cre06d301Arc.tif');
figure
imshow(cre06d301I)
cre06d301h = drawfreehand;
cre06d301BW = createMask(cre06d301h);
cre06d301J = cre06d301I.*uint8(cre06d301BW);
figure
imshow(cre06d301J)

% DAPI
cre06d301BW2 = cre06d301J(:,:,3) >=30;
cre06d301BW3 = bwareaopen(cre06d301BW2, 50);
cre06d301Da = bwlabel(cre06d301BW3);
max(cre06d301Da(:))

% Arc 
cre06d301Fo = cre06d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre06d301Da(:))
    cre06d301FoBW = cre06d301Da == n;
    cre06d301res(n,1) = nnz((cre06d301Fo == 255).*cre06d301FoBW); % Arc fosi
    cre06d301Dil1 = imdilate(cre06d301FoBW, s);
    cre06d301Dil2 = logical(imfuse(cre06d301Dil1, cre06d301FoBW, 'diff'));
    cre06d301res(n,2) = nnz((cre06d301Fo == 128).*cre06d301Dil2);  % Arc cyto
end


%% Arc catFISH  cre06d302
% Freehand drawing and extraction
cre06d302I = imread('cre06d302Arc.tif');
figure
imshow(cre06d302I)
cre06d302h = drawfreehand;
cre06d302BW = createMask(cre06d302h);
cre06d302J = cre06d302I.*uint8(cre06d302BW);
figure
imshow(cre06d302J)

% DAPI
cre06d302BW2 = cre06d302J(:,:,3) >=30;
cre06d302BW3 = bwareaopen(cre06d302BW2, 50);
cre06d302Da = bwlabel(cre06d302BW3);
max(cre06d302Da(:))

% Arc 
cre06d302Fo = cre06d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre06d302Da(:))
    cre06d302FoBW = cre06d302Da == n;
    cre06d302res(n,1) = nnz((cre06d302Fo == 255).*cre06d302FoBW); % Arc fosi
    cre06d302Dil1 = imdilate(cre06d302FoBW, s);
    cre06d302Dil2 = logical(imfuse(cre06d302Dil1, cre06d302FoBW, 'diff'));
    cre06d302res(n,2) = nnz((cre06d302Fo == 128).*cre06d302Dil2);  % Arc cyto
end

%% Arc catFISH  cre06d303
% Freehand drawing and extraction
cre06d303I = imread('cre06d303Arc.tif');
figure
imshow(cre06d303I)
cre06d303h = drawfreehand;
cre06d303BW = createMask(cre06d303h);
cre06d303J = cre06d303I.*uint8(cre06d303BW);
figure
imshow(cre06d303J)

% DAPI
cre06d303BW2 = cre06d303J(:,:,3) >=30;
cre06d303BW3 = bwareaopen(cre06d303BW2, 50);
cre06d303Da = bwlabel(cre06d303BW3);
max(cre06d303Da(:))

% Arc 
cre06d303Fo = cre06d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre06d303Da(:))
    cre06d303FoBW = cre06d303Da == n;
    cre06d303res(n,1) = nnz((cre06d303Fo == 255).*cre06d303FoBW); % Arc fosi
    cre06d303Dil1 = imdilate(cre06d303FoBW, s);
    cre06d303Dil2 = logical(imfuse(cre06d303Dil1, cre06d303FoBW, 'diff'));
    cre06d303res(n,2) = nnz((cre06d303Fo == 128).*cre06d303Dil2);  % Arc cyto
end


%% Arc catFISH  cre06d304
% Freehand drawing and extraction
cre06d304I = imread('cre06d304Arc.tif');
figure
imshow(cre06d304I)
cre06d304h = drawfreehand;
cre06d304BW = createMask(cre06d304h);
cre06d304J = cre06d304I.*uint8(cre06d304BW);
figure
imshow(cre06d304J)

% DAPI
cre06d304BW2 = cre06d304J(:,:,3) >=30;
cre06d304BW3 = bwareaopen(cre06d304BW2, 50);
cre06d304Da = bwlabel(cre06d304BW3);
max(cre06d304Da(:))

% Arc 
cre06d304Fo = cre06d304J(:,:,1);
s = strel('disk', 2);
for n = 1:max(cre06d304Da(:))
    cre06d304FoBW = cre06d304Da == n;
    cre06d304res(n,1) = nnz((cre06d304Fo == 255).*cre06d304FoBW); % Arc fosi
    cre06d304Dil1 = imdilate(cre06d304FoBW, s);
    cre06d304Dil2 = logical(imfuse(cre06d304Dil1, cre06d304FoBW, 'diff'));
    cre06d304res(n,2) = nnz((cre06d304Fo == 128).*cre06d304Dil2);  % Arc cyto
end
