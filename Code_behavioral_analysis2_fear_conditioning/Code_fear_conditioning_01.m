%% Subtraction & List

%% Definition
VFR = vision.VideoFileReader("Nat_Commun_Data\s001-nn_g.avi");
VP = vision.VideoPlayer;
VA = vision.AlphaBlender;
Vid = VideoWriter('s001-nn_g_bw.avi');
%% Proper
VFR.ImageColorSpace = 'Intensity';
VA.Operation = 'Highlight selected pixels';
open(Vid);
%% Step1
s001nnlist = 0;
s001nnOLD_F = VFR();
% OLD_F = rgb2gray(OLD_F);
s001nnOLD_F2 = imadjust(s001nnOLD_F, [0 0.2745]);
% OLD_F2=imflatfield(OLD_F,20); 
% OLD_F2=imbinarize(OLD_F2);
s001nnOLD_F2 =imadjust(s001nnOLD_F2, [0.5882 0.5883]);

% figure
% imshow(OLD_F2)

%% Step2

while ~isDone(VFR)
s001nnF = VFR();
% F=rgb2gray(F);
s001nnF2 = imadjust(s001nnF, [0 0.2745]);
% F2=imflatfield(F,20);
% F2 =imbinarize(F2);
s001nnF2 = imadjust(s001nnF2, [0.5882 0.5883]);

s001nnD = imabsdiff(s001nnF2,s001nnOLD_F2);
s001nnD2 = bwareaopen(s001nnD, 10); 
s001nnOLD_F2 = s001nnF2;
s001nnBW = s001nnD2 > 0.5;
s001nnscore = nnz(s001nnBW);
s001nnlist(end+1) = s001nnscore;

% figure(1)
% imshowpair(D,D2, 'montage')
% imshow(BW)

s001nnF3 = VA(s001nnF,s001nnBW);
VP(s001nnF3)
writeVideo(Vid,s001nnF3);


end
figure(2)
plot(s001nnlist)

close(Vid);

VFR.release;
VP.release;


%% Subtraction & List

%% Definition
VFR = vision.VideoFileReader("Nat_Commun_Data\s001-np_g.avi");
VP = vision.VideoPlayer;
VA = vision.AlphaBlender;
Vid = VideoWriter('s001-np_g_bw.avi');
%% Proper
VFR.ImageColorSpace = 'Intensity';
VA.Operation = 'Highlight selected pixels';
open(Vid);
%% Step1
s001nplist = 0;
s001npOLD_F = VFR();
% OLD_F = rgb2gray(OLD_F);
s001npOLD_F2 = imadjust(s001npOLD_F, [0 0.2745]);
% OLD_F2=imflatfield(OLD_F,20); 
% OLD_F2=imbinarize(OLD_F2);
s001npOLD_F2 =imadjust(s001npOLD_F2, [0.5882 0.5883]);

% figure
% imshow(OLD_F2)

%% Step2

while ~isDone(VFR)
s001npF = VFR();
% F=rgb2gray(F);
s001npF2 = imadjust(s001npF, [0 0.2745]);
% F2=imflatfield(F,20);
% F2 =imbinarize(F2);
s001npF2 = imadjust(s001npF2, [0.5882 0.5883]);

s001npD = imabsdiff(s001npF2,s001npOLD_F2);
s001npD2 = bwareaopen(s001npD, 10); 
s001npOLD_F2 = s001npF2;
s001npBW = s001npD2 > 0.5;
s001npscore = nnz(s001npBW);
s001nplist(end+1) = s001npscore;

% figure(1)
% imshowpair(D,D2, 'montage')
% imshow(BW)

s001npF3 = VA(s001npF,s001npBW);
VP(s001npF3)
writeVideo(Vid,s001npF3);


end
figure(2)
plot(s001nplist)

close(Vid);

VFR.release;
VP.release;


%% Subtraction & List

%% Definition
VFR = vision.VideoFileReader("Nat_Commun_Data\s001-pn_g.avi");
VP = vision.VideoPlayer;
VA = vision.AlphaBlender;
Vid = VideoWriter('s001-pn_g_bw.avi');
%% Proper
VFR.ImageColorSpace = 'Intensity';
VA.Operation = 'Highlight selected pixels';
open(Vid);
%% Step1
s001pnlist = 0;
s001pnOLD_F = VFR();
% OLD_F = rgb2gray(OLD_F);
s001pnOLD_F2 = imadjust(s001pnOLD_F, [0 0.2745]);
% OLD_F2=imflatfield(OLD_F,20); 
% OLD_F2=imbinarize(OLD_F2);
s001pnOLD_F2 =imadjust(s001pnOLD_F2, [0.5882 0.5883]);

% figure
% imshow(OLD_F2)

%% Step2

while ~isDone(VFR)
s001pnF = VFR();
% F=rgb2gray(F);
s001pnF2 = imadjust(s001pnF, [0 0.2745]);
% F2=imflatfield(F,20);
% F2 =imbinarize(F2);
s001pnF2 = imadjust(s001pnF2, [0.5882 0.5883]);

s001pnD = imabsdiff(s001pnF2,s001pnOLD_F2);
s001pnD2 = bwareaopen(s001pnD, 10); 
s001pnOLD_F2 = s001pnF2;
s001pnBW = s001pnD2 > 0.5;
s001pnscore = nnz(s001pnBW);
s001pnlist(end+1) = s001pnscore;

% figure(1)
% imshowpair(D,D2, 'montage')
% imshow(BW)

s001pnF3 = VA(s001pnF,s001pnBW);
VP(s001pnF3)
writeVideo(Vid,s001pnF3);


end
figure(2)
plot(s001pnlist)

close(Vid);

VFR.release;
VP.release;


%% Subtraction & List

%% Definition
VFR = vision.VideoFileReader("Nat_Commun_Data\s001-pp_g.avi");
VP = vision.VideoPlayer;
VA = vision.AlphaBlender;
Vid = VideoWriter('s001-pp_g_bw.avi');
%% Proper
VFR.ImageColorSpace = 'Intensity';
VA.Operation = 'Highlight selected pixels';
open(Vid);
%% Step1
s001pplist = 0;
s001ppOLD_F = VFR();
% OLD_F = rgb2gray(OLD_F);
s001ppOLD_F2 = imadjust(s001ppOLD_F, [0 0.2745]);
% OLD_F2=imflatfield(OLD_F,20); 
% OLD_F2=imbinarize(OLD_F2);
s001ppOLD_F2 =imadjust(s001ppOLD_F2, [0.5882 0.5883]);

% figure
% imshow(OLD_F2)

%% Step2

while ~isDone(VFR)
s001ppF = VFR();
% F=rgb2gray(F);
s001ppF2 = imadjust(s001ppF, [0 0.2745]);
% F2=imflatfield(F,20);
% F2 =imbinarize(F2);
s001ppF2 = imadjust(s001ppF2, [0.5882 0.5883]);

s001ppD = imabsdiff(s001ppF2,s001ppOLD_F2);
s001ppD2 = bwareaopen(s001ppD, 10); 
s001ppOLD_F2 = s001ppF2;
s001ppBW = s001ppD2 > 0.5;
s001ppscore = nnz(s001ppBW);
s001pplist(end+1) = s001ppscore;

% figure(1)
% imshowpair(D,D2, 'montage')
% imshow(BW)

s001ppF3 = VA(s001ppF,s001ppBW);
VP(s001ppF3)
writeVideo(Vid,s001ppF3);


end
figure(2)
plot(s001pplist)

close(Vid);

VFR.release;
VP.release;
