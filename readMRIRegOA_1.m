function obj = readMRIRegOA_1(obj)
    if isempty(obj.MSOT_folder_name)
        defaul_open_folder = obj.cur_folder;
    else
        defaul_open_folder = obj.MSOT_folder_name;
    end
    [MRI_file_name,MRI_folder_name] =  uigetfile({'*.tif';'*.tiff'},...
        'Select MRI raw image stack in tif', defaul_open_folder); % MSOT file name + MSOT folder name
    info = imfinfo([MRI_folder_name MRI_file_name]);
    n_z = numel(info);
    obj.MRI_n_z = n_z;
    obj.MRI_file_name = MRI_file_name;
    obj.MRI_folder_name = MRI_folder_name;
    obj.MRI_dataset = zeros(obj.image_size, obj.image_size, n_z);
    for i = 1 : n_z
        tempimg_rgb = imread([MRI_folder_name MRI_file_name], i);
        tempimg = tempimg_rgb(:,:,1);
        tempimg_resized = double(imresize(tempimg, [obj.image_size obj.image_size]));
        obj.MRI_dataset(:,:,i) = tempimg_resized;
        obj.MRI_dataset(:,:,i) = tempimg_resized/max(max(tempimg_resized)); % normalize the array
    end    
    disp('MRI dataset loaded')
end