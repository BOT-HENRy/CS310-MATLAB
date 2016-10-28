function newImage = posterize(origImage)
% posterize
%
% Creates and returns a new image that is the image that results from 
% applying the posterize filter to the original image. The posterize  
% filter creates a poster-like effect by reducing the number of possible  
% pixel values to 4: black, white, light gray, and dark gray.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the posterize filter to  
%         the original image
%

% convert  original image from jpg matrix format to "regular" matrix format
origPixels = jpg2matrix(origImage);

% create a new image matrix (in "regular" format) the same size as the  
% original matrix
[row, col] = size(origPixels);
newPixels = zeros(row, col);

for r = 1:row            % for each row r in the image matrix
    for c = 1:col        %     for each row c in row r in the image matrix
        if origPixels(r, c) >=0 && origPixels(r, c) <= 71
            newPixels(r, c) = 0;
        elseif origPixels(r, c) >=72 && origPixels(r, c) <= 127
            newPixels(r, c) = 72;
        elseif origPixels(r, c) >=128 && origPixels(r, c) <= 183
            newPixels(r, c) = 183;
        else
            newPixels(r, c) =  255;
        end
    end
end

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);
    