function obj = configRegOA_1(obj)
%   Step 2: Read the MSOT and MRI dataset
        obj.MSOT_dl         =[1 1 1]; % [dx dy dz], MSOT resolution for processing, not raw 
        obj.MSOT_thickness  =1; % slice thickness for MSOT
        obj.MSOT_dataset    =[]; % dataset for processing
        obj.MSOT_file_name  =[]; % MSOT file name
        obj.MSOT_folder_name=[]; % MSOT folder name
        obj.MSOT_n_z        =[]; % slice number of MSOT        
        obj.MRI_dl          =[1 1 1]; % [dx dy dz], MRI resolution for processing, not raw
        obj.MRI_thickness   =1; % slice thickness for MRI
        obj.MRI_dataset     =[]; % dataset for processing   
        obj.MRI_file_name   =[]; % MRI file name
        obj.MRI_folder_name =[]; % MRI folder name
        obj.MRI_n_z         =[]; % slice number of MRI
        obj.image_size      =512; % [n_x n_y] or n_x, image size for processing
        obj.cur_folder      =pwd; % current folder 
%   Step 3: Preprocessing
    %   MSOT preprocessing
        obj.MSOT_edge_method    = 'canny'; %the edge detection method ("Sobel", "Prewitt", "Roberts", "log", "Canny")
        obj.MSOT_seg_MaxIteration   =50; % maximum iteration time for segmenting  
        obj.MSOT_mask               =[]; % mask of MSOT dataset
        obj.MSOT_seg                =[];% segmented MSOT dataset
    %   MRI preprocesing
        obj.MRI_wiener_window       =[5 5]; %wiener filtering window
        obj.MRI_seg_MaxIteration    =50; % maximum iteration time for segmenting  
        obj.MRI_mask                =[]; % mask of MRI dataset
        obj.MRI_seg                 =[]; % segmented MRI dataset 
        
%   Step 4: Registration
        obj.MSOT_reg_slice          =[]; % MSOT slice for registration
        obj.MSOT_reg_slice_num      =[]; % number of MSOT slice for registration
        obj.MSOT_reg_slice_result   =[]; % result: MSOT slice for registration
        obj.MRI_reg_slice           =[]; % MRI slice for registration
        obj.MRI_reg_slice_num       =[]; % number of MRI slice for registration
        obj.MRI_reg_slice_result    =[]; % result: MRI slice for registration
        
%   Step 5: Quality control (TRE analysis)
%   Step 6: Display, Image analysis, & Output
        obj.Output_nii              =[1 1 1 1;1 1 1 1]; % MSOT mask | MSOT seg| MSOT reg slice | MSOT reg slice result
                                                        % MRI  mask | MRI  seg| MRI  reg slice | MRI  reg slice result
        obj.Output_folder           =[]; % output folder name
end