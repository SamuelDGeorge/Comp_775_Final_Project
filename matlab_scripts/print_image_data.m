function [pdm_image_table] = print_image_data(grey_images, correct_pdms, number_of_points_in_pdm, num_versions)
pdm_image_table = table({'Filename'}, {[]});
image = grey_images.greyimages(:,1);
for i = 1:32
    grey_image = grey_images.greyimages(:,i);
    pdms_values = correct_pdms.correctpdms(:,i);
    image_square = reshape(grey_image,256,256);
    x = pdms_values(1:2:end);
    y = pdms_values(2:2:end);
    points = [x,y];
    
    for j = 1:num_versions
        name = ['corpus_image_' 'original_' int2str(i) '_' 'version_' int2str(j) '.jpg'];
        image_name = {name};
        imwrite(mat2gray(image_square), name)

        abbreviated_point_array = get_point_array(points,number_of_points_in_pdm,j);


        next_row = {image_name,{abbreviated_point_array}};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(image_square,90);
    rotated_points_1 = rotate_pdm_values(points);
    
    for j = 1:num_versions
        name = ['corpus_image_' '90_' int2str(i) '_' 'version_' int2str(j) '.jpg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,number_of_points_in_pdm,j);

        next_row = {image_name,{abbreviated_point_array}};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(grey_rotated_1,90);
    rotated_points_1 = rotate_pdm_values(rotated_points_1);
    
    for j = 1:num_versions
        name = ['corpus_image_' '180_' int2str(i) '_' 'version_' int2str(j) '.jpg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,number_of_points_in_pdm,j);

        next_row = {image_name,{abbreviated_point_array}};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(grey_rotated_1,90);
    rotated_points_1 = rotate_pdm_values(rotated_points_1);
    
    for j = 1:num_versions
        name = ['corpus_image_' '270_' int2str(i) '_' 'version_' int2str(j) '.jpg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,number_of_points_in_pdm,j);

        next_row = {image_name,{abbreviated_point_array}};
        pdm_image_table = [pdm_image_table;next_row];
    end
end
    
end