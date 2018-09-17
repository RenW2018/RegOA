function obj = readMSOTRegOA_1(obj)
    if isempty(obj.MRI_folder_name)
        defaul_open_folder = obj.cur_folder;
    else
        defaul_open_folder = obj.MRI_folder_name;
    end
    [MSOT_file_name,MSOT_folder_name] =  uigetfile({'*.tiff';'*.tif'},...
        'Select MSOT raw image stack in tif',defaul_open_folder); % MSOT file name + MSOT folder name
    info = imfinfo([MSOT_folder_name MSOT_file_name]);
    n_z = numel(info);
    obj.MSOT_n_z = n_z;
    obj.MSOT_file_name = MSOT_file_name;
    obj.MSOT_folder_name = MSOT_folder_name;
    obj.MSOT_dataset = zeros(obj.image_size, obj.image_size, n_z);
    disp('Do you need to truncate the colorbar:Y/[N]')
    reply = input(' ','s');
    truncate_flag = strcmp(reply,'y') || strcmp(reply,'Y');
    if truncate_flag
       disp('colorbar removed')
    end
    for i = 1 : n_z
        tempimg_rgb = imread([MSOT_folder_name MSOT_file_name], i);
        tempimg = tempimg_rgb(:,:,1);
        if truncate_flag
            tempimg = tempimg(1:end-150, 1:end-100); % remove the colorbar on the right hand side 
        end
        tempimg_resized = double(imresize(tempimg, [obj.image_size obj.image_size]));
        obj.MSOT_dataset(:,:,i) = tempimg_resized;
        obj.MSOT_dataset(:,:,i) = tempimg_resized/max(max(tempimg_resized)); % normalize the array
    end 
    disp('MSOT dataset loaded')
end