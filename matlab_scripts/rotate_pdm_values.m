function [rotated_pdms] = rotate_pdm_values(original_points, degrees)
new_points = [];
rotation_matrix = [cosd(degrees),-sind(degrees);sind(degrees),cosd(degrees)];
x = original_points(:,1);
y = original_points(:,2);
x_norm = x - (256/2);
y_norm = y - (256/2);

centered_points = [x_norm,y_norm];

for i = 1:size(original_points,1)
    current_point = centered_points(i,:);
    new_point = current_point * rotation_matrix;
    new_points = [new_points;new_point];
end

x_cen = new_points(:,1);
y_cen = new_points(:,2);

x_cen = x_cen + (256/2);
y_cen = y_cen + (256/2);

rotated_pdms = [x_cen,y_cen];
end