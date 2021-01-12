%%%%%%%%%%%%%%%code of generting random database of fingeprint
clear all;
close all;
clc;
Database_Name='FingerPrint_Synthetic_01_01'; ratio_xy=0.1; ratio_a=0.1;
Database_Name='FingerPrint_Synthetic_02_01'; ratio_xy=0.2; ratio_a=0.1;
Database_Name='FingerPrint_Synthetic_03_01'; ratio_xy=0.3; ratio_a=0.1;
% 
Database_Name='FingerPrint_Synthetic_01_02'; ratio_xy=0.1; ratio_a=0.2;
Database_Name='FingerPrint_Synthetic_02_02'; ratio_xy=0.2; ratio_a=0.2;
Database_Name='FingerPrint_Synthetic_03_02'; ratio_xy=0.3; ratio_a=0.2;
% 
Database_Name='FingerPrint_Synthetic_01_03'; ratio_xy=0.1; ratio_a=0.3;
Database_Name='FingerPrint_Synthetic_02_03'; ratio_xy=0.2; ratio_a=0.3;
Database_Name='FingerPrint_Synthetic_03_03'; ratio_xy=0.3; ratio_a=0.3;

Database_Name='FingerPrint_Synthetic_01_04'; ratio_xy=0.1; ratio_a=0.4;
%Database_Name='FingerPrint_Synthetic_02_04'; ratio_xy=0.2; ratio_a=0.4;
%Database_Name='FingerPrint_Synthetic_03_04'; ratio_xy=0.3; ratio_a=0.4;


num_class=20; %%%%%number of class
num_nodes=10;%%%%%number of nodes in each fingerprint
image_number=12; %%%number of images per each class: Multiple of 3
noisxy=ratio_xy*100;      %%%%%%%%%noise of x and y [0 50]
noisa=ratio_a*0.75*pi;   %%%%%%%%%%%%%%%noise of angle [0 pi]

Generate_Random_Fingerprint_Database(Database_Name,num_class,num_nodes,image_number,noisxy,noisa)
disp('Database created:'); disp(Database_Name);


