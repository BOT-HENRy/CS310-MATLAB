function result = insideCircle(point, center, radius)
    % This function determine whether a point is inside
    % a given circle whose center and radius are given 
    % 'point' is a 1 x 2 vector containing the x- and y-coordinates of a point
    % 'center' is a 1 x 2 vector containing the x- and y-coordinates of the center of the circle
    % 'radius' is the radius of the circle
    % The function returns 1 if the point is inside the circle, 
    %                      0 if the point is on the circle, 
    %                      -1 if the point is outside the circle.
    dif = radius.^2 - ((point(1)-center(1)).^2+(point(2)-center(2)).^2);
    result = sign(dif);
end
