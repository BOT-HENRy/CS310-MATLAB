function newImage = mirror(origImage)
% mirror
%
% Creates and returns a new image that is the image that results from 
% applying the mirror filter to the original image. The mirror filter
% creates a mirror image of the original image.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the mirror filter to the 
%         original image
%

% convert original image from jpg matrix format to "regular" matrix format
origPixels = jpg2matrix(origImage);

% create a new image matrix (in "regular" format) the same size as the 
% original matrix
[row, col] = size(origPixels);
newPixels = zeros(row, col);

for r = 1:row            % for each row r in the image matrix
    for c = 1:col        %     for each row c in row r in the image matrix
        newPixels(r, c) =  origPixels(r, col - c + 1);
    end
end    

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);
    