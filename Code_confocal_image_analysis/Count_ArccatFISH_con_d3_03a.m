%% Arc catFISH  con01d301
% Freehand drawing and extraction
con01d301I = imread('con01d301Arc.tif');
figure
imshow(con01d301I)
con01d301h = drawfreehand;
con01d301BW = createMask(con01d301h);
con01d301J = con01d301I.*uint8(con01d301BW);
figure
imshow(con01d301J)

% DAPI
con01d301BW2 = con01d301J(:,:,3) >=30;
con01d301BW3 = bwareaopen(con01d301BW2, 50);
con01d301Da = bwlabel(con01d301BW3);
max(con01d301Da(:))

% Arc 
con01d301Fo = con01d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con01d301Da(:))
    con01d301FoBW = con01d301Da == n;
    con01d301res(n,1) = nnz((con01d301Fo == 255).*con01d301FoBW); % Arc fosi
    con01d301Dil1 = imdilate(con01d301FoBW, s);
    con01d301Dil2 = logical(imfuse(con01d301Dil1, con01d301FoBW, 'diff'));
    con01d301res(n,2) = nnz((con01d301Fo == 128).*con01d301Dil2);  % Arc cyto
end

%% Arc catFISH  con01d302
% Freehand drawing and extraction
con01d302I = imread('con01d302Arc.tif');
figure
imshow(con01d302I)
con01d302h = drawfreehand;
con01d302BW = createMask(con01d302h);
con01d302J = con01d302I.*uint8(con01d302BW);
figure
imshow(con01d302J)

% DAPI
con01d302BW2 = con01d302J(:,:,3) >=30;
con01d302BW3 = bwareaopen(con01d302BW2, 50);
con01d302Da = bwlabel(con01d302BW3);
max(con01d302Da(:))

% Arc 
con01d302Fo = con01d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con01d302Da(:))
    con01d302FoBW = con01d302Da == n;
    con01d302res(n,1) = nnz((con01d302Fo == 255).*con01d302FoBW); % Arc fosi
    con01d302Dil1 = imdilate(con01d302FoBW, s);
    con01d302Dil2 = logical(imfuse(con01d302Dil1, con01d302FoBW, 'diff'));
    con01d302res(n,2) = nnz((con01d302Fo == 128).*con01d302Dil2);  % Arc cyto
end

%% Arc catFISH  con01d303
% Freehand drawing and extraction
con01d303I = imread('con01d303Arc.tif');
figure
imshow(con01d303I)
con01d303h = drawfreehand;
con01d303BW = createMask(con01d303h);
con01d303J = con01d303I.*uint8(con01d303BW);
figure
imshow(con01d303J)

% DAPI
con01d303BW2 = con01d303J(:,:,3) >=30;
con01d303BW3 = bwareaopen(con01d303BW2, 50);
con01d303Da = bwlabel(con01d303BW3);
max(con01d303Da(:))

% Arc 
con01d303Fo = con01d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con01d303Da(:))
    con01d303FoBW = con01d303Da == n;
    con01d303res(n,1) = nnz((con01d303Fo == 255).*con01d303FoBW); % Arc fosi
    con01d303Dil1 = imdilate(con01d303FoBW, s);
    con01d303Dil2 = logical(imfuse(con01d303Dil1, con01d303FoBW, 'diff'));
    con01d303res(n,2) = nnz((con01d303Fo == 128).*con01d303Dil2);  % Arc cyto
end


%% Arc catFISH  con02d301
% Freehand drawing and extraction
con02d301I = imread('con02d301Arc.tif');
figure
imshow(con02d301I)
con02d301h = drawfreehand;
con02d301BW = createMask(con02d301h);
con02d301J = con02d301I.*uint8(con02d301BW);
figure
imshow(con02d301J)

% DAPI
con02d301BW2 = con02d301J(:,:,3) >=30;
con02d301BW3 = bwareaopen(con02d301BW2, 50);
con02d301Da = bwlabel(con02d301BW3);
max(con02d301Da(:))

% Arc 
con02d301Fo = con02d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con02d301Da(:))
    con02d301FoBW = con02d301Da == n;
    con02d301res(n,1) = nnz((con02d301Fo == 255).*con02d301FoBW); % Arc fosi
    con02d301Dil1 = imdilate(con02d301FoBW, s);
    con02d301Dil2 = logical(imfuse(con02d301Dil1, con02d301FoBW, 'diff'));
    con02d301res(n,2) = nnz((con02d301Fo == 128).*con02d301Dil2);  % Arc cyto
end


%% Arc catFISH  con02d302
% Freehand drawing and extraction
con02d302I = imread('con02d302Arc.tif');
figure
imshow(con02d302I)
con02d302h = drawfreehand;
con02d302BW = createMask(con02d302h);
con02d302J = con02d302I.*uint8(con02d302BW);
figure
imshow(con02d302J)

% DAPI
con02d302BW2 = con02d302J(:,:,3) >=30;
con02d302BW3 = bwareaopen(con02d302BW2, 50);
con02d302Da = bwlabel(con02d302BW3);
max(con02d302Da(:))

% Arc 
con02d302Fo = con02d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con02d302Da(:))
    con02d302FoBW = con02d302Da == n;
    con02d302res(n,1) = nnz((con02d302Fo == 255).*con02d302FoBW); % Arc fosi
    con02d302Dil1 = imdilate(con02d302FoBW, s);
    con02d302Dil2 = logical(imfuse(con02d302Dil1, con02d302FoBW, 'diff'));
    con02d302res(n,2) = nnz((con02d302Fo == 128).*con02d302Dil2);  % Arc cyto
end


%% Arc catFISH  con02d303
% Freehand drawing and extraction
con02d303I = imread('con02d303Arc.tif');
figure
imshow(con02d303I)
con02d303h = drawfreehand;
con02d303BW = createMask(con02d303h);
con02d303J = con02d303I.*uint8(con02d303BW);
figure
imshow(con02d303J)

% DAPI
con02d303BW2 = con02d303J(:,:,3) >=30;
con02d303BW3 = bwareaopen(con02d303BW2, 50);
con02d303Da = bwlabel(con02d303BW3);
max(con02d303Da(:))

% Arc 
con02d303Fo = con02d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con02d303Da(:))
    con02d303FoBW = con02d303Da == n;
    con02d303res(n,1) = nnz((con02d303Fo == 255).*con02d303FoBW); % Arc fosi
    con02d303Dil1 = imdilate(con02d303FoBW, s);
    con02d303Dil2 = logical(imfuse(con02d303Dil1, con02d303FoBW, 'diff'));
    con02d303res(n,2) = nnz((con02d303Fo == 128).*con02d303Dil2);  % Arc cyto
end



%% Arc catFISH  con03d301
% Freehand drawing and extraction
con03d301I = imread('con03d301Arc.tif');
figure
imshow(con03d301I)
con03d301h = drawfreehand;
con03d301BW = createMask(con03d301h);
con03d301J = con03d301I.*uint8(con03d301BW);
figure
imshow(con03d301J)

% DAPI
con03d301BW2 = con03d301J(:,:,3) >=30;
con03d301BW3 = bwareaopen(con03d301BW2, 50);
con03d301Da = bwlabel(con03d301BW3);
max(con03d301Da(:))

% Arc 
con03d301Fo = con03d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con03d301Da(:))
    con03d301FoBW = con03d301Da == n;
    con03d301res(n,1) = nnz((con03d301Fo == 255).*con03d301FoBW); % Arc fosi
    con03d301Dil1 = imdilate(con03d301FoBW, s);
    con03d301Dil2 = logical(imfuse(con03d301Dil1, con03d301FoBW, 'diff'));
    con03d301res(n,2) = nnz((con03d301Fo == 128).*con03d301Dil2);  % Arc cyto
end


%% Arc catFISH  con03d302
% Freehand drawing and extraction
con03d302I = imread('con03d302Arc.tif');
figure
imshow(con03d302I)
con03d302h = drawfreehand;
con03d302BW = createMask(con03d302h);
con03d302J = con03d302I.*uint8(con03d302BW);
figure
imshow(con03d302J)

% DAPI
con03d302BW2 = con03d302J(:,:,3) >=30;
con03d302BW3 = bwareaopen(con03d302BW2, 50);
con03d302Da = bwlabel(con03d302BW3);
max(con03d302Da(:))

% Arc 
con03d302Fo = con03d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con03d302Da(:))
    con03d302FoBW = con03d302Da == n;
    con03d302res(n,1) = nnz((con03d302Fo == 255).*con03d302FoBW); % Arc fosi
    con03d302Dil1 = imdilate(con03d302FoBW, s);
    con03d302Dil2 = logical(imfuse(con03d302Dil1, con03d302FoBW, 'diff'));
    con03d302res(n,2) = nnz((con03d302Fo == 128).*con03d302Dil2);  % Arc cyto
end


%% Arc catFISH  con03d303
% Freehand drawing and extraction
con03d303I = imread('con03d303Arc.tif');
figure
imshow(con03d303I)
con03d303h = drawfreehand;
con03d303BW = createMask(con03d303h);
con03d303J = con03d303I.*uint8(con03d303BW);
figure
imshow(con03d303J)

% DAPI
con03d303BW2 = con03d303J(:,:,3) >=30;
con03d303BW3 = bwareaopen(con03d303BW2, 50);
con03d303Da = bwlabel(con03d303BW3);
max(con03d303Da(:))

% Arc 
con03d303Fo = con03d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con03d303Da(:))
    con03d303FoBW = con03d303Da == n;
    con03d303res(n,1) = nnz((con03d303Fo == 255).*con03d303FoBW); % Arc fosi
    con03d303Dil1 = imdilate(con03d303FoBW, s);
    con03d303Dil2 = logical(imfuse(con03d303Dil1, con03d303FoBW, 'diff'));
    con03d303res(n,2) = nnz((con03d303Fo == 128).*con03d303Dil2);  % Arc cyto
end



%% Arc catFISH  con03d308
% Freehand drawing and extraction
con03d308I = imread('con03d308Arc.tif');
figure
imshow(con03d308I)
con03d308h = drawfreehand;
con03d308BW = createMask(con03d308h);
con03d308J = con03d308I.*uint8(con03d308BW);
figure
imshow(con03d308J)

% DAPI
con03d308BW2 = con03d308J(:,:,3) >=30;
con03d308BW3 = bwareaopen(con03d308BW2, 50);
con03d308Da = bwlabel(con03d308BW3);
max(con03d308Da(:))

% Arc 
con03d308Fo = con03d308J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con03d308Da(:))
    con03d308FoBW = con03d308Da == n;
    con03d308res(n,1) = nnz((con03d308Fo == 255).*con03d308FoBW); % Arc fosi
    con03d308Dil1 = imdilate(con03d308FoBW, s);
    con03d308Dil2 = logical(imfuse(con03d308Dil1, con03d308FoBW, 'diff'));
    con03d308res(n,2) = nnz((con03d308Fo == 128).*con03d308Dil2);  % Arc cyto
end




%% Arc catFISH  con04d301
% Freehand drawing and extraction
con04d301I = imread('con04d301Arc.tif');
figure
imshow(con04d301I)
con04d301h = drawfreehand;
con04d301BW = createMask(con04d301h);
con04d301J = con04d301I.*uint8(con04d301BW);
figure
imshow(con04d301J)

% DAPI
con04d301BW2 = con04d301J(:,:,3) >=30;
con04d301BW3 = bwareaopen(con04d301BW2, 50);
con04d301Da = bwlabel(con04d301BW3);
max(con04d301Da(:))

% Arc 
con04d301Fo = con04d301J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con04d301Da(:))
    con04d301FoBW = con04d301Da == n;
    con04d301res(n,1) = nnz((con04d301Fo == 255).*con04d301FoBW); % Arc fosi
    con04d301Dil1 = imdilate(con04d301FoBW, s);
    con04d301Dil2 = logical(imfuse(con04d301Dil1, con04d301FoBW, 'diff'));
    con04d301res(n,2) = nnz((con04d301Fo == 128).*con04d301Dil2);  % Arc cyto
end



%% Arc catFISH  con04d302
% Freehand drawing and extraction
con04d302I = imread('con04d302Arc.tif');
figure
imshow(con04d302I)
con04d302h = drawfreehand;
con04d302BW = createMask(con04d302h);
con04d302J = con04d302I.*uint8(con04d302BW);
figure
imshow(con04d302J)

% DAPI
con04d302BW2 = con04d302J(:,:,3) >=30;
con04d302BW3 = bwareaopen(con04d302BW2, 50);
con04d302Da = bwlabel(con04d302BW3);
max(con04d302Da(:))

% Arc 
con04d302Fo = con04d302J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con04d302Da(:))
    con04d302FoBW = con04d302Da == n;
    con04d302res(n,1) = nnz((con04d302Fo == 255).*con04d302FoBW); % Arc fosi
    con04d302Dil1 = imdilate(con04d302FoBW, s);
    con04d302Dil2 = logical(imfuse(con04d302Dil1, con04d302FoBW, 'diff'));
    con04d302res(n,2) = nnz((con04d302Fo == 128).*con04d302Dil2);  % Arc cyto
end


%% Arc catFISH  con04d303
% Freehand drawing and extraction
con04d303I = imread('con04d303Arc.tif');
figure
imshow(con04d303I)
con04d303h = drawfreehand;
con04d303BW = createMask(con04d303h);
con04d303J = con04d303I.*uint8(con04d303BW);
figure
imshow(con04d303J)

% DAPI
con04d303BW2 = con04d303J(:,:,3) >=30;
con04d303BW3 = bwareaopen(con04d303BW2, 50);
con04d303Da = bwlabel(con04d303BW3);
max(con04d303Da(:))

% Arc 
con04d303Fo = con04d303J(:,:,1);
s = strel('disk', 2);
for n = 1:max(con04d303Da(:))
    con04d303FoBW = con04d303Da == n;
    con04d303res(n,1) = nnz((con04d303Fo == 255).*con04d303FoBW); % Arc fosi
    con04d303Dil1 = imdilate(con04d303FoBW, s);
    con04d303Dil2 = logical(imfuse(con04d303Dil1, con04d303FoBW, 'diff'));
    con04d303res(n,2) = nnz((con04d303Fo == 128).*con04d303Dil2);  % Arc cyto
end


