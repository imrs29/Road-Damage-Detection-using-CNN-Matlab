function final_feature_data=resnet_process_full(img_data_pre)


load('resnet_data.mat');
img_data_pre=img_data_pre/255;
%% 1
convoltion_process_layer_out1=convoltion_process(img_data_pre,...
                                            convoltion_process1Kernels,convoltion_process1Bias, 1, 1, 0, 1);
rectified_linear_unit1=rectified_linear_unit(convoltion_process_layer_out1);

%% 2
convoltion_process_layer_out2=convoltion_process(rectified_linear_unit1,...
                                            convoltion_process2Kernels,convoltion_process2Bias, 1, 1, 0, 1);
rectified_linear_unit2=rectified_linear_unit(convoltion_process_layer_out2);
pool_layer_out1=maxpool_layer(rectified_linear_unit2,2,2);
%%  3
convoltion_process_layer_out3=convoltion_process(pool_layer_out1,...
                                            convoltion_process3Kernels,convoltion_process3Bias, 1, 1, 0, 1);
rectified_linear_unit3=rectified_linear_unit(convoltion_process_layer_out3);

%% 4 
convoltion_process_layer_out4=convoltion_process(rectified_linear_unit3,...
                                            convoltion_process4Kernels,convoltion_process4Bias, 1, 1, 0, 1);
rectified_linear_unit4=rectified_linear_unit(convoltion_process_layer_out4);
pool_layer_out2=maxpool_layer(rectified_linear_unit4,2,2);
%% 5
convoltion_process_layer_out5=convoltion_process(pool_layer_out2,...
                                            convoltion_process5Kernels,convoltion_process5Bias, 1, 1, 0, 1);
rectified_linear_unit5=rectified_linear_unit(convoltion_process_layer_out5);

%% 6
convoltion_process_layer_out6=convoltion_process(rectified_linear_unit5,...
                                            convoltion_process6Kernels,convoltion_process6Bias, 1, 1, 0, 1);
fully_train_value_out=rectified_linear_unit(convoltion_process_layer_out6);

%% 7
convoltion_process_layer_out7=convoltion_process(fully_train_value_out,...
                                            convoltion_process7Kernels,convoltion_process7Bias, 1, 1, 0, 1);
rectified_linear_unit7=rectified_linear_unit(convoltion_process_layer_out7);
pool_layer_out3=maxpool_layer(rectified_linear_unit7,2,2);
[rr,cc,zz]=size(pool_layer_out3);
pool_layer_out5t=reshape(pool_layer_out3,[rr*cc*zz 1]);
wgtval_fullycnt1=wgtval_fullycnt(1,1,1:zz,1:200);
bias_fullycnt1=bias_fullycnt(1,1,1,1:200);
fully_train_value=fully_connect_layer_process(pool_layer_out5t,wgtval_fullycnt1,bias_fullycnt1);
final_feature_datax=double(rectified_linear_unit(fully_train_value));
locv=find(final_feature_datax);final_feature_data=final_feature_datax;
