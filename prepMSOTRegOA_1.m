function obj = prepMSOTRegOA_1(obj)
    %% Step 1: segments a 3D image by finding the edges in each slice
    mask_image = false(size(obj.MSOT_dataset)); % creat a mask for edging
    se90 = strel('line', 5, 90);
    se0 = strel('line', 5, 0);
    for i = 1:obj.MSOT_n_z
        mask_image(:,:,i) = edge(obj.MSOT_dataset(:,:,i), obj.MSOT_edge_method);
        mask_image(:,:,i) = imdilate(mask_image(:,:,i), [se90 se0]);
        mask_image(:,:,i) = imfill(mask_image(:,:,i), 'holes');
    end
    edge_filt_image = mask_image.*obj.MSOT_dataset;
    
    %% Step 2: use snake to further segment the image
    [obj.MSOT_mask, obj.MSOT_seg] = segment_snakes(edge_filt_image,...
        obj.MSOT_n_z,obj.MSOT_seg_MaxIteration);
    
end