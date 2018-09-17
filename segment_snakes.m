function [mask_image, segmented_image] = segment_snakes(filtered_image, z_image, maxIterations)
% This function segments a 3D image with an active contour model (snake).
% Inputs
%     filtered_image:	the filtered 3D image
%     z_image:          number of slices in the image
%     maxIterations:    maximum iteration number
% Outputs
%     mask_image:       the mask of the image as a 3D array
%     segmented_image:  the segmented image

    str = 'Click to select initial contour location. Double-click to confirm and proceed.';
    str2 = 'Note: Click close to object boundaries for more accurate results.';
    figure('Name', 'Mask', 'Units', 'normalized', 'Position', [0 0 1 1])
    imagesc(filtered_image(:,:,ceil(z_image/2))); axis image; %colormap gray
    title(str, 'Color', 'b')%, 'FontSize', 12);
    xlabel(str2, 'Color', 'b')%, 'FontSize', 12)
    mask = roipoly;
    close('Mask')
    mask_image = zeros(size(filtered_image));
    for i = 1:z_image
        mask_image(:,:,i) = activecontour(filtered_image(:,:,i), mask, maxIterations);% maxIterations = 50 or 400
    end
    segmented_image = mask_image.*filtered_image;
    
end