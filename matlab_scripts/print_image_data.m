function [pdm_image_table] = print_image_data(grey_images, correct_pdms, number_of_points_in_pdm, num_angles)

%table for all results
pdm_image_table = table({'Filename'}, {[]});

for i = 1:32
    %Get current image and its pdm
    grey_image = grey_images.greyimages(:,i);
    pdms_values = correct_pdms.correctpdms(:,i);
    image_square = reshape(grey_image,256,256);
    x = pdms_values(1:2:end);
    y = pdms_values(2:2:end);
    points = [x,y];
    
    %intial setup for angles
    current_angle = 0;
    step_size = 360/num_angles;
    
    %print an image and PDM for every rotation of the image.
    for j = 1:num_angles
        name = ['corpus_image_' 'original_' int2str(i) '_' 'angle_' int2str(current_angle) '.jpg'];
        image_name = {name};
        
        current_image = imrotate(image_square,current_angle,'crop');
        rotated_points = rotate_pdm_values(points,current_angle);
        
        imwrite(mat2gray(current_image), name)

        abbreviated_point_array = get_point_array(rotated_points,number_of_points_in_pdm,1);


        next_row = {image_name,{abbreviated_point_array}};
        pdm_image_table = [pdm_image_table;next_row];
        current_angle = current_angle + step_size;
    end
    
end
    
end