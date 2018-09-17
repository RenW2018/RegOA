classdef RegOA  < handle
    properties
%%   Step 2: Read the MSOT and MRI dataset
        MSOT_dl % [dx dy dz], MSOT resolution for processing, not raw 
        MSOT_thickness % slice thickness for MSOT
        MSOT_dataset % dataset for processing
        MSOT_file_name % MSOT file name
        MSOT_folder_name % MSOT folder name
        MSOT_n_z % slice number of MSOT
        MRI_dl % [dx dy dz], MRI resolution for processing, not raw
        MRI_thickness % slice thickness for MRI
        MRI_dataset % dataset for processing   
        MRI_file_name % MRI file name
        MRI_folder_name % MRI folder name
        MRI_n_z % slice number of MRI
        image_size % [n_x n_y] or n_x, image size for processing
        cur_folder % current folder 
        
%%   Step 3: Preprocessing
    %%   MSOT preprocessing
        MSOT_edge_method % the edge detection method ("Sobel", "Prewitt", "Roberts", "log", "Canny")
        MSOT_seg_MaxIteration % maximum iteration time for segmenting  
        MSOT_mask % mask of MSOT dataset
        MSOT_seg % segmented MSOT dataset
    %%   MRI preprocesing
        MRI_wiener_window %wiener filtering window
        MRI_seg_MaxIteration % maximum iteration time for segmenting  
        MRI_mask % mask of MRI dataset
        MRI_seg % segmented MRI dataset        

%%   Step 4: Registration
        MSOT_reg_slice % MSOT slice for registration
        MSOT_reg_slice_num % number of MSOT slice for registration
        MSOT_reg_slice_result % result: MSOT slice for registration
        MRI_reg_slice % MRI slice for registration
        MRI_reg_slice_num % number of MRI slice for registration
        MRI_reg_slice_result % result: MRI slice for registration
        
%%   Step 5: Quality control (TRE analysis)

%%   Step 6: Display, Image analysis, & Output
        Output_nii% MSOT mask | MSOT seg| MSOT reg slice | MSOT reg slice result
                  % MRI  mask | MRI  seg| MRI  reg slice | MRI  reg slice result
        Output_folder % output folder name
       
    end
    
    methods
        function configRegOA(obj)
            configRegOA_1(obj);
        end
        function readMSOTRegOA(obj)
            readMSOTRegOA_1(obj);
        end
        function readMRIRegOA(obj)
            readMRIRegOA_1(obj);
        end
        function prepMSOTRegOA(obj)
            prepMSOTRegOA_1(obj);
        end
        function prepMRIRegOA(obj)
            prepMRIRegOA_1(obj);
        end 
        function registRegOA(obj)
            registRegOA_1(obj);
        end
        function outputRegOA(obj)
            outputRegOA_1(obj);
        end
    end
end