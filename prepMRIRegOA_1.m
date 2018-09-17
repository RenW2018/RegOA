function obj = prepMRIRegOA_1(obj)
    %% Step 1: De-noise using a pixelwise adaptive low-pass Wiener filter.
    filt_image = zeros(size(obj.MRI_dataset));
    for i = 1:obj.MRI_n_z
        filt_image(:,:,i) = wiener2(obj.MRI_dataset(:,:,i), obj.MRI_wiener_window);
    end
     %% Step 2: use snake to further segment the image
    [obj.MRI_mask, obj.MRI_seg] = segment_snakes(filt_image,...
        obj.MRI_n_z,obj.MRI_seg_MaxIteration);   
    
end 