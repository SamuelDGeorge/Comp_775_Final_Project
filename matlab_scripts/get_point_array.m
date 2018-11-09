function [point_array] = get_point_array(points,number_of_points,start_number)
point_array = [];
jump_length = size(points,1)/number_of_points;
current_number = start_number;
for i = 1:number_of_points
    current_position = mod(current_number,size(points,1));
    point = points(current_position,:);
    point_array = [point_array,point];
    current_number = current_number + jump_length;
end
end