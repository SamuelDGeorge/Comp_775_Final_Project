cd C:\Users\sdgeo\Dropbox\Own\Graduate-School\First_Semester\COMP_775\Workspace\Final_Project\Comp_775_Final_Project;
correct_pdms = load('data\raw_matlab\correctpdms.mat');
grey_images = load('data\raw_matlab\greyimages.mat');

cd C:\Users\sdgeo\Dropbox\Own\Graduate-School\First_Semester\COMP_775\Workspace\Final_Project\Comp_775_Final_Project\data\raw_images\;

data = print_image_data(grey_images,correct_pdms);
writetable(data,'image_table_data.csv','Delimiter',',') 


