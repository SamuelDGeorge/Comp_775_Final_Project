cd C:\Users\sdgeo\Dropbox\Own\Graduate-School\First_Semester\COMP_775\Workspace\Final_Project\Comp_775_Final_Project;
correct_pdms = load('data\raw_matlab\correctpdms.mat');
grey_images = load('data\raw_matlab\greyimages.mat');

cd D:\Machine_Learning\Datasets\corpus_learning\raw_data;

data = print_image_data(grey_images,correct_pdms,4,72);
writetable(data,'image_table_data.csv','Delimiter',',') 


