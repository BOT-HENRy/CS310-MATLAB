function newImage = blur(origImage)
% blur
%
% Creates and returns a new image that is the image that results from 
% applying the blur filter to the original image. The blur filter  
% creates a blurred image by averaging pixel values.
% 
% Input:
%   origImage    the original image
%
% Output: the image that results from applying the blur filter to the 
%         original image
%

% convert  original image from jpg matrix format to "regular" matrix format
origPixels = jpg2matrix(origImage);

% create a new image matrix (in "regular" format) the same size as the 
% original  matrix
[row, col] = size(origPixels);
newPixels = zeros(row, col);

for r = 1:row            % for each row r in the image matrix
    for c = 1:col        %     for each row c in row r in the image matrix
        sumforBlur = 0;
        countforBlur = 0;
        for xBlur = r-2:r+2
            for yBlur = c-2:c+2
                if (xBlur > 0) && (xBlur < row) && (yBlur > 0) && (yBlur < col)
                    sumforBlur = sumforBlur + origPixels(xBlur, yBlur);
                    countforBlur = countforBlur + 1;
                end
            end
        end
        newPixels(r, c) = sumforBlur/countforBlur;
    end
end    

% convert new image from "regular" matrix format to jpg matrix format
newImage = matrix2jpg(newPixels);
    