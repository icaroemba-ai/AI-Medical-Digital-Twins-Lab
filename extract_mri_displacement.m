% =========================================================================
% Script: Extract Tissue Displacement from cine-MRI (anonymized_mri.avi)
% =========================================================================
clear; clc; close all;

% 1. Load the Video
videoFile = 'anonymized_mri.avi';
v = VideoReader(videoFile);
numFrames = floor(v.Duration * v.FrameRate);
dt = 1 / v.FrameRate;
t_vector = (0:numFrames-1) * dt;

% 2. Select the Region of Interest (ROI)
frame1 = rgb2gray(readFrame(v));
figure('Name', 'Select Tissue to Track');
imshow(frame1); title('Draw a rectangle over the boundary to track, then double-click');
roi = drawrectangle();
l = addlistener(roi,'ROIClicked',@(src,evt) uiresume(gcf)); uiwait(gcf);
pos = roi.Position; delete(l); close;

xRect = round(pos(1)); yRect = round(pos(2));
wRect = round(pos(3)); hRect = round(pos(4));
template = frame1(yRect:(yRect+hRect), xRect:(xRect+wRect));
initial_x = xRect + wRect/2; initial_y = yRect + hRect/2;

% 3. Track the ROI across all frames
disp_x = zeros(numFrames, 1); disp_y = zeros(numFrames, 1);
v.CurrentTime = 0; frameCount = 1;
h = waitbar(0, 'Tracking tissue displacement...');
while hasFrame(v)
    current_frame_gray = rgb2gray(readFrame(v));
    c = normxcorr2(template, current_frame_gray);
    [ypeak, xpeak] = find(c == max(c(:)));
    yoffset = ypeak - size(template, 1); xoffset = xpeak - size(template, 2);
    disp_x(frameCount) = (xoffset + wRect/2) - initial_x;
    disp_y(frameCount) = (yoffset + hRect/2) - initial_y;
    waitbar(frameCount/numFrames, h); frameCount = frameCount + 1;
end
close(h);

% 4. Calculate Magnitude, Smooth, and Scale
disp_magnitude = sqrt(disp_x.^2 + disp_y.^2);
smoothed_disp = smoothdata(disp_magnitude, 'gaussian', 12); % Remove pixelation
scaled_disp = (smoothed_disp / max(smoothed_disp)) * 5.0; % Scale to match theoretical amp

% 5. Format for Simulink (Structure with empty time vector for Cyclic Repetition)
simulink_data = struct();
simulink_data.time = []; 
simulink_data.signals.values = scaled_disp;
simulink_data.signals.dimensions = 1;

disp('*** CRITICAL SIMULINK SETTINGS ***');
disp(['Set Sample Time in From Workspace block to: ', num2str(dt)]);


%XXX

