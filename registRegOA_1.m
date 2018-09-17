function obj = registRegOA_1(obj)
    disp('Slices chosen for each dataset (recommended):')
    disp('                          MSOT    MRI')   
    disp('in vivo mouse 460:        24,     3')
    disp('in vivo stroke mouse:     21,     7')
    disp('ex vivo mouse 6629:       96,     11')
    disp('ex vivo mouse brain:      16,     6')
    disp('in vivo with fiducial:    23,     51')
    disp('phantom with fiducial:    28,     39')
    disp('MRI atlas:                N/A,    43')
    disp('Select the MSOT slice to register: ')
    obj.MSOT_reg_slice_num = input(' ');
    disp('Select the MRI slice to register: ')
    obj.MRI_reg_slice_num = input(' ');
    if obj.MSOT_reg_slice_num>0 && obj.MSOT_reg_slice_num<obj.MSOT_n_z
        disp('MSOT registration slice selected')
    else
        disp('error in seleting MSOT registration slice')
        disp('middle slice selected')
        obj.MSOT_reg_slice_num = ceil(obj.MSOT_n_z/2);
    end
    if obj.MRI_reg_slice_num>0 && obj.MRI_reg_slice_num<obj.MRI_n_z
        disp('MRI registration slice selected')
    else
        disp('error in seleting MRI registration slice')
        disp('middle slice selected')
        obj.MRI_reg_slice_num = ceil(obj.MRI_n_z/2);
    end
    obj.MSOT_reg_slice = obj.MSOT_seg(:,:,obj.MSOT_reg_slice_num);
    obj.MRI_reg_slice = obj.MRI_seg(:,:,obj.MRI_reg_slice_num);
    obj.MRI_reg_slice_result = obj.MRI_reg_slice;
    
    MRI_mask_reg_slice = obj.MRI_mask(:,:,obj.MRI_reg_slice_num);
    MSOT_mask_reg_slice = obj.MSOT_mask(:,:,obj.MSOT_reg_slice_num);
    [optimizer_1,metric_1] = imregconfig('monomodal');
    tform_1 = imregtform(MSOT_mask_reg_slice,MRI_mask_reg_slice,'affine',optimizer_1,metric_1);
    MSOT_reg_mask_result_1 = imwarp(obj.MSOT_reg_slice,tform_1,'OutputView',imref2d(size(MRI_mask_reg_slice)), 'SmoothEdges', true);
    %MSOT_mask_reg_slice_result = imwarp(MSOT_mask_reg_slice,tform_1,'OutputView',imref2d(size(MRI_mask_reg_slice)), 'SmoothEdges', true);
    [optimizer_2,metric_2] = imregconfig('multimodal');
    %edge_MSOT = double(edge(MSOT_reg_mask_result_1,'canny'));
    %edge_MRI = double(edge(obj.MRI_reg_slice,'canny'));
    obj.MSOT_reg_slice_result =imregister(MSOT_reg_mask_result_1,obj.MRI_reg_slice,'rigid',optimizer_2,metric_2);
    disp('registration done')
    %% original version%%%%%%%%%
    %reg_slice_result = registerImages(obj.MSOT_reg_slice,obj.MRI_reg_slice);
    %disp('registration done')
    %obj.MSOT_reg_slice_result = reg_slice_result.RegisteredImage;
    %% original version%%%%%%%%%
end