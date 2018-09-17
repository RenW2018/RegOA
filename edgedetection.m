function [mask_image, segmented_image] = edgedetection(image, z_image, method)
% This function segments a 3D image by finding the edges in each slice.
% Inputs
%     image:              a 3D grayscale image 
%     z_image:            number of slices in the image (could use 
%                         size(image,3))
%     method:             the edge detection method ("Sobel", "Prewitt", 
%                         "Roberts", "log", "Canny")
%     fudgeFactor:        lowering the calculated threshold by a factor
% Outputs
%     mask_image:         the mask of the image as a 3D array
%     segmented_image:    the segmented image

mask_image = false(size(image));
se90 = strel('line', 5, 90);
se0 = strel('line', 5, 0);
for i = 1:z_image
    %[~, threshold] = edge(image(:,:,i), method);
    %mask_image(:,:,i) = edge(image(:,:,i), method, threshold* fudgeFactor);
    mask_image(:,:,i) = edge(image(:,:,i), method);
    mask_image(:,:,i) = imdilate(mask_image(:,:,i), [se90 se0]);
    mask_image(:,:,i) = imfill(mask_image(:,:,i), 'holes');
end
segmented_image = mask_image .* image;
end