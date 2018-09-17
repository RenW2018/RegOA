function obj = outputRegOA_1(obj)
    disp('name your output folder (nii): ')
    obj.Output_folder = input(' ','s');
    mkdir(obj.Output_folder);
    if obj.Output_nii(1,1)
        niftiwrite(obj.MSOT_mask,[obj.Output_folder '/MSOT_mask.nii']);
    end
    if obj.Output_nii(1,2)
        niftiwrite(obj.MSOT_seg,[obj.Output_folder '/MSOT_seg.nii']);
    end 
    if obj.Output_nii(1,3)
        niftiwrite(obj.MSOT_reg_slice,[obj.Output_folder '/MSOT_reg_slice.nii']);
    end  
    if obj.Output_nii(1,4)
        niftiwrite(obj.MSOT_reg_slice_result,[obj.Output_folder '/MSOT_reg_slice_result.nii']);
    end 
    if obj.Output_nii(2,1)
        niftiwrite(obj.MRI_mask,[obj.Output_folder '/MRI_mask.nii']);
    end
    if obj.Output_nii(2,2)
        niftiwrite(obj.MRI_seg,[obj.Output_folder '/MRI_seg.nii']);
    end 
    if obj.Output_nii(2,3)
        niftiwrite(obj.MRI_reg_slice,[obj.Output_folder '/MRI_reg_slice.nii']);
    end  
    if obj.Output_nii(2,4)
        niftiwrite(obj.MRI_reg_slice_result,[obj.Output_folder '/MRI_reg_slice_result.nii']);
    end 
end