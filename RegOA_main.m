%% RegOA: image registration toolbox for optoacoustic imaging 
% Wuwei Ren, PhD, ETH Zurich
% updated, 10,Jul,2018
% version 1.0
% description: 
% Preprocessing of the MRI images is performed by using a lowpass Wiener 
% filter and an active contour model (snakes).
% Preprocessing of the MSOT images is performed by using the Canny edge 
% detector and an active contour model.
% Registration is performed based on mutual information
% Registration accuracy is measured in target-to-registration error (TRE)
%
% Main steps as following:
%   Step 1: Configuration
%   Step 2: Read the MSOT and MRI dataset
%   Step 3: Preprocessing
%   Step 4: Registration
%   Step 5: Quality control (TRE analysis)
%   Step 6: Display, Image analysis, & Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Step 1: Configuration
disp('Welcome to RegOA*****************************************************')
tic
clearvars;
close all;
current_root_folder = pwd;
addpath(genpath(current_root_folder)); % installation of the path
proj = RegOA;
proj.configRegOA;
proj.MSOT_seg_MaxIteration   =50;
proj.MRI_seg_MaxIteration    =50;
toc
disp('Configuration done***************************************************')
%% Step 2: Read the MSOT and MRI dataset
tic
proj.readMSOTRegOA;
proj.readMRIRegOA;
toc
disp('Read files done******************************************************')
%% Step 3: Preprocessing
tic
proj.prepMSOTRegOA; % for standard procedure
proj.prepMRIRegOA;
toc
disp('Preprocessing done***************************************************')
%% Step 4: Registration
tic
proj.registRegOA;
toc
disp('Registration done****************************************************')
%% Step 5: Quality control (TRE analysis)

%% Step 6: Display, Image analysis, & Output
figure,imshowpair(proj.MSOT_reg_slice_result,proj.MRI_reg_slice_result);
%proj.outputRegOA;
%[n_X1,n_Z1,MRI_height_map] = surface_map(proj.MRI_mask,1);
%[n_X2,n_Z2,MSOT_height_map] = surface_map(proj.MSOT_mask,1);
%figure, subplot(1,2,1),surface(MRI_height_map);
%subplot(1,2,2),surface(MSOT_height_map);
%niftiwrite(proj.MSOT_seg,'outbrain.nii');
