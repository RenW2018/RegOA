function [n_X,n_Z,height_map] = surface_map(mask_stack,drawing)
    dim_mask = size(mask_stack);
    if length(dim_mask)~=3
        disp('The mask stack is not 3D.')
        return
    else 
        n_Z = dim_mask(3);
    end
    n_X = dim_mask(2);
    height_map = zeros(n_X,n_Z);
    n_Y = dim_mask(1);
    for i = 1:n_Z
        cross_section = mask_stack(:,:,i);
        for j = 1:n_X
            y_profile = cross_section(:,j);
            if isempty(find(y_profile>0,1))
                height_map(j,i) = 0;
            else
                height_map(j,i) = n_Y - find(y_profile>0,1);
            end
        end
    end
    if drawing == 1
        figure,imagesc(height_map);
    end
end