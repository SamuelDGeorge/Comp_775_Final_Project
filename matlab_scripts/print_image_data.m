function [pdm_image_table] = print_image_data(grey_images, correct_pdms)
pdm_image_table = table({'Filename'}, 0,0, 0,0,0,0,0,0);
image = grey_images.greyimages(:,1);
for i = 1:32
    grey_image = grey_images.greyimages(:,i);
    pdms_values = correct_pdms.correctpdms(:,i);
    image_square = reshape(grey_image,256,256);
    x = pdms_values(1:2:end);
    y = pdms_values(2:2:end);
    points = [x,y];
    
    for j = 1:10
        name = ['corpus_image_' 'original_' int2str(i) '_' 'version_' int2str(j) '.jpeg'];
        image_name = {name};
        imwrite(mat2gray(image_square), name)

        abbreviated_point_array = get_point_array(points,4,j);
        x1 = abbreviated_point_array(1);
        y1 = abbreviated_point_array(2);
        x2 = abbreviated_point_array(3);
        y2 = abbreviated_point_array(4);
        x3 = abbreviated_point_array(5);
        y3 = abbreviated_point_array(6);
        x4 = abbreviated_point_array(7);
        y4 = abbreviated_point_array(8);

        next_row = {image_name,x1,y1,x2,y2,x3,y3,x4,y4};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(image_square,90);
    rotated_points_1 = rotate_pdm_values(points);
    
    for j = 1:10
        name = ['corpus_image_' '90_' int2str(i) '_' 'version_' int2str(j) '.jpeg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,4,j);
        x1 = abbreviated_point_array(1);
        y1 = abbreviated_point_array(2);
        x2 = abbreviated_point_array(3);
        y2 = abbreviated_point_array(4);
        x3 = abbreviated_point_array(5);
        y3 = abbreviated_point_array(6);
        x4 = abbreviated_point_array(7);
        y4 = abbreviated_point_array(8);

        next_row = {image_name,x1,y1,x2,y2,x3,y3,x4,y4};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(grey_rotated_1,90);
    rotated_points_1 = rotate_pdm_values(rotated_points_1);
    
    for j = 1:10
        name = ['corpus_image_' '180_' int2str(i) '_' 'version_' int2str(j) '.jpeg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,4,j);
        x1 = abbreviated_point_array(1);
        y1 = abbreviated_point_array(2);
        x2 = abbreviated_point_array(3);
        y2 = abbreviated_point_array(4);
        x3 = abbreviated_point_array(5);
        y3 = abbreviated_point_array(6);
        x4 = abbreviated_point_array(7);
        y4 = abbreviated_point_array(8);

        next_row = {image_name,x1,y1,x2,y2,x3,y3,x4,y4};
        pdm_image_table = [pdm_image_table;next_row];
    end
    
    grey_rotated_1 = imrotate(grey_rotated_1,90);
    rotated_points_1 = rotate_pdm_values(rotated_points_1);
    
    for j = 1:10
        name = ['corpus_image_' '270_' int2str(i) '_' 'version_' int2str(j) '.jpeg'];
        image_name = {name};
        imwrite(mat2gray(grey_rotated_1), name)

        abbreviated_point_array = get_point_array(rotated_points_1,4,j);
        x1 = abbreviated_point_array(1);
        y1 = abbreviated_point_array(2);
        x2 = abbreviated_point_array(3);
        y2 = abbreviated_point_array(4);
        x3 = abbreviated_point_array(5);
        y3 = abbreviated_point_array(6);
        x4 = abbreviated_point_array(7);
        y4 = abbreviated_point_array(8);

        next_row = {image_name,x1,y1,x2,y2,x3,y3,x4,y4};
        pdm_image_table = [pdm_image_table;next_row];
    end
end
    
end