
%% Definition
% make movie's object
VFR = vision.VideoFileReader('Nat_Commun_Data\s001-OR2-se_g.avi');
VP = vision.VideoPlayer;
VA = vision.AlphaBlender;
Vid = VideoWriter('s001-OR2-last_g_bw.avi');
%% Proper
VFR.ImageColorSpace = 'Intensity';
VA.Operation = 'Highlight selected pixels';
open(Vid);
%% Step
% count number to make ROI in the first frame
count=1;

% count of pixel numbers piled with each mask
obj1_count=[];
obj2_count=[];

% loop untl the last frame
while ~VFR.isDone
% read the first frame 
I=VFR();
% grayscale from RGB 
% I=rgb2gray(I);
% Crop the center part properly (black edges)
I=I(5:end-6,5:end-5);
% compensate the left side for brightness 
I2=imflatfield(I,30);

% determination of ROI
if count==1
figure(1)
imshow(I2)
ax=gca;

% make ROI with center position and radius
% s002
% Box size: length 275 mm; width 395 mm; [412 587] = 1.50 1.49
% OR1: old2: metal_bunchin: diameter 34 mm; new1: lego_sakura: leaves 40 mm;
% OR2: old2: pottory_peper: diameter 34 mm; new1: metal_tower: diameter 43 mm;
% (20+17)*1.50=56 old2; (20+21.5)*1.50=62 new1

roi1=drawcircle(ax,'Center',[120 293],'Radius',56);
roi2=drawcircle(ax,'Center',[463 138],'Radius',62);

% make mask
mask1=roi1.createMask;
mask2=roi2.createMask;
end


if count==200
figure(2)
imshow(I2)
ax=gca;
roi1=drawcircle(ax,'Center',[120 293],'Radius',56);
roi2=drawcircle(ax,'Center',[463 138],'Radius',62);
end


% black and white
BW=imbinarize(I2);
BW=~BW;
% remove cable with opening processing
BW2=imopen(BW,ones(3));
% obtain pixel list with square of each white region 
T=regionprops('table',BW2,'Area','PixelIdxList');
% make true logical array only with maximum square
[~,idx]=max(T.Area);
BW3=zeros(size(BW2),'logical');
BW3(T.PixelIdxList{idx})=true;
% fill out holes
BW3=imfill(BW3, 'holes');

% visualization
% figure(2)
% imshowpair(I,BW3,'montage')
% imshow(BW3)

% make logical conjunction among BW3, mask1, and mask2 and remove zero, and then count pixel number with overlay 
obj1_count=[obj1_count;nnz(BW3 & mask1)];
obj2_count=[obj2_count;nnz(BW3 & mask2)];

% counter increment
count=count+1;

% Imaging
D = imabsdiff(mask1,mask2);
D2 = D.*BW3;
D3 = logical(D2);
I3 = VA(I, D3);
% imshowpair(I, I3, 'Blend');
% I4 = VA(I3, BW3);
VP(I3)
writeVideo(Vid,I3);

end

% visualization of overlapped pixel number 
figure(4)
plot([obj1_count,obj2_count])
legend('new1','old2')

close(Vid);

VFR.release;
VP.release;
