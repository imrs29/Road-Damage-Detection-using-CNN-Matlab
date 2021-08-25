function final_feature_data=inception_process_full(img_data_pre)

load('inception_data.mat');
img_data_pre=img_data_pre/255;
%% block 1
convoltion_process_layer_out1=convoltion_process(img_data_pre,...
                                            convoltion_process1Kernels,convoltion_process1Bias, 1, 1, 0, 1);
rectified_linear_unit1=rectified_linear_unit(convoltion_process_layer_out1);

pool_layer_out1=maxpool_layer(rectified_linear_unit1,3,1);

%%
convoltion_process_layer_out2=convoltion_process(pool_layer_out1,...
                                            convoltion_process2Kernels,convoltion_process2Bias, 1, 1, 0, 1);
rectified_linear_unit2=rectified_linear_unit(convoltion_process_layer_out2);

%%
convoltion_process_layer_out3=convoltion_process(rectified_linear_unit2,...
                                            convoltion_process3Kernels,convoltion_process3Bias, 1, 1, 0, 1);
rectified_linear_unit3=rectified_linear_unit(convoltion_process_layer_out3);

pool_layer_out2=maxpool_layer(rectified_linear_unit3,3,1);

%% block path 1
convoltion_process_layer_outp1=convoltion_process(pool_layer_out2,...
                                            convoltion_processp1Kernels,convoltion_processp1Bias, 1, 1, 0, 1);
rectified_linear_unitp1=rectified_linear_unit(convoltion_process_layer_outp1);

%
convoltion_process_layer_outp2=convoltion_process(pool_layer_out2,...
                                            convoltion_processp2Kernels,convoltion_processp2Bias, 1, 1, 0, 1);
rectified_linear_unitp2=rectified_linear_unit(convoltion_process_layer_outp2);


convoltion_process_layer_outp22=convoltion_process(rectified_linear_unitp2,...
                                            convoltion_processp22Kernels,convoltion_processp22Bias, 1, 1, 0, 1);
rectified_linear_unitp22=rectified_linear_unit(convoltion_process_layer_outp22);

%
convoltion_process_layer_outp3=convoltion_process(pool_layer_out2,...
                                            convoltion_processp3Kernels,convoltion_processp3Bias, 1, 1, 0, 1);
rectified_linear_unitp3=rectified_linear_unit(convoltion_process_layer_outp3);

convoltion_process_layer_outp33=convoltion_process(rectified_linear_unitp3,...
                                            convoltion_processp33Kernels,convoltion_processp33Bias, 1, 1, 0, 1);
rectified_linear_unitp33=rectified_linear_unit(convoltion_process_layer_outp33);
%

pool_layer_out3=maxpool_layer(pool_layer_out2,3,1);

convoltion_process_layer_outp4=convoltion_process(pool_layer_out3,...
                                            convoltion_processp4Kernels,convoltion_processp4Bias, 1, 1, 0, 1);
rectified_linear_unitp4=rectified_linear_unit(convoltion_process_layer_outp4);

path1_value=cat(3,rectified_linear_unitp1,rectified_linear_unitp22,rectified_linear_unitp33);


%% block path 2

convoltion_process_layer_outb2p1=convoltion_process(path1_value,...
                                            convoltion_processb2p1Kernels,convoltion_processb2p1Bias, 1, 1, 0, 1);
rectified_linear_unitb2p1=rectified_linear_unit(convoltion_process_layer_outb2p1);

convoltion_process_layer_outb2p2=convoltion_process(path1_value,...
                                            convoltion_processb2p2Kernels,convoltion_processb2p2Bias, 1, 1, 0, 1);
rectified_linear_unitb2p2=rectified_linear_unit(convoltion_process_layer_outb2p2);

convoltion_process_layer_outb2p22=convoltion_process(rectified_linear_unitb2p2,...
                                            convoltion_processb2p22Kernels,convoltion_processb2p22Bias, 1, 1, 0, 1);
rectified_linear_unitb2p22=rectified_linear_unit(convoltion_process_layer_outb2p22);

%
convoltion_process_layer_outb2p3=convoltion_process(path1_value,...
                                            convoltion_processb2p3Kernels,convoltion_processb2p3Bias, 1, 1, 0, 1);
rectified_linear_unitb2p3=rectified_linear_unit(convoltion_process_layer_outb2p3);


convoltion_process_layer_outb2p33=convoltion_process(rectified_linear_unitb2p3,...
                                            convoltion_processb2p33Kernels,convoltion_processb2p33Bias, 1, 1, 0, 1);
rectified_linear_unitb2p33=rectified_linear_unit(convoltion_process_layer_outb2p33);
%

pool_layer_out3=maxpool_layer(path1_value,3,1);

convoltion_process_layer_outb2p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb2p4Kernels,convoltion_processb2p4Bias, 1, 1, 0, 1);
rectified_linear_unitb2p4=rectified_linear_unit(convoltion_process_layer_outb2p4);

path2_value=cat(3,rectified_linear_unitb2p1,rectified_linear_unitb2p22,rectified_linear_unitb2p33);

path2_value=maxpool_layer(path2_value,3,1);


%% block path 3
convoltion_process_layer_outb3p1=convoltion_process(path2_value,...
                                            convoltion_processb3p1Kernels,convoltion_processb3p1Bias, 1, 1, 0, 1);
rectified_linear_unitb3p1=rectified_linear_unit(convoltion_process_layer_outb3p1);

%
convoltion_process_layer_outb3p2=convoltion_process(path2_value,...
                                            convoltion_processb3p2Kernels,convoltion_processb3p2Bias, 1, 1, 0, 1);
rectified_linear_unitb3p2=rectified_linear_unit(convoltion_process_layer_outb3p2);

convoltion_process_layer_outb3p22=convoltion_process(rectified_linear_unitb3p2,...
                                            convoltion_processb3p22Kernels,convoltion_processb3p22Bias, 1, 1, 0, 1);
rectified_linear_unitb3p22=rectified_linear_unit(convoltion_process_layer_outb3p22);

%
convoltion_process_layer_outb3p3=convoltion_process(path2_value,...
                                            convoltion_processb3p3Kernels,convoltion_processb3p3Bias, 1, 1, 0, 1);
rectified_linear_unitb3p3=rectified_linear_unit(convoltion_process_layer_outb3p3);


convoltion_process_layer_outb3p33=convoltion_process(rectified_linear_unitb3p3,...
                                            convoltion_processb3p33Kernels,convoltion_processb3p33Bias, 1, 1, 0, 1);
rectified_linear_unitb3p33=rectified_linear_unit(convoltion_process_layer_outb3p33);

pool_layer_out3=maxpool_layer(path2_value,3,1);

convoltion_process_layer_outb3p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb3p4Kernels,convoltion_processb3p4Bias, 1, 1, 0, 1);
rectified_linear_unitb3p4=rectified_linear_unit(convoltion_process_layer_outb3p4);

path3_value=cat(3,rectified_linear_unitb3p1,rectified_linear_unitb3p22,rectified_linear_unitb3p33);


%% block path 4

convoltion_process_layer_outb4p1=convoltion_process(path3_value,...
                                            convoltion_processb4p1Kernels,convoltion_processb4p1Bias, 1, 1, 0, 1);
rectified_linear_unitb4p1=rectified_linear_unit(convoltion_process_layer_outb4p1);
%
convoltion_process_layer_outb4p2=convoltion_process(path3_value,...
                                            convoltion_processb4p2Kernels,convoltion_processb4p2Bias, 1, 1, 0, 1);
rectified_linear_unitb4p2=rectified_linear_unit(convoltion_process_layer_outb4p2);


convoltion_process_layer_outb4p22=convoltion_process(rectified_linear_unitb4p2,...
                                            convoltion_processb4p22Kernels,convoltion_processb4p22Bias, 1, 1, 0, 1);
rectified_linear_unitb4p22=rectified_linear_unit(convoltion_process_layer_outb4p22);

%

convoltion_process_layer_outb4p3=convoltion_process(path3_value,...
                                            convoltion_processb4p3Kernels,convoltion_processb4p3Bias, 1, 1, 0, 1);
rectified_linear_unitb4p3=rectified_linear_unit(convoltion_process_layer_outb4p3);

convoltion_process_layer_outb4p33=convoltion_process(rectified_linear_unitb4p3,...
                                            convoltion_processb4p33Kernels,convoltion_processb4p33Bias, 1, 1, 0, 1);
rectified_linear_unitb4p33=rectified_linear_unit(convoltion_process_layer_outb4p33);
%

pool_layer_out3=maxpool_layer(path3_value,3,1);
convoltion_process_layer_outb4p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb4p4Kernels,convoltion_processb4p4Bias, 1, 1, 0, 1);
rectified_linear_unitb4p4=rectified_linear_unit(convoltion_process_layer_outb4p4);

path4_value=cat(3,rectified_linear_unitb4p1,rectified_linear_unitb4p22,rectified_linear_unitb4p33);


%% block path 5
[rr,cc,zz]=size(path4_value);
convoltion_process_layer_outb5p1=convoltion_process(path4_value,...
                                            convoltion_processb5p1Kernels,convoltion_processb5p1Bias, 1, 1, 0, 1);
rectified_linear_unitb5p1=rectified_linear_unit(convoltion_process_layer_outb5p1);
%
convoltion_process_layer_outb5p2=convoltion_process(path4_value,...
                                            convoltion_processb5p2Kernels,convoltion_processb5p2Bias, 1, 1, 0, 1);
rectified_linear_unitb5p2=rectified_linear_unit(convoltion_process_layer_outb5p2);


convoltion_process_layer_outb5p22=convoltion_process(rectified_linear_unitb5p2,...
                                            convoltion_processb5p22Kernels,convoltion_processb5p22Bias, 1, 1, 0, 1);
rectified_linear_unitb5p22=rectified_linear_unit(convoltion_process_layer_outb5p22);

%
convoltion_process_layer_outb5p3=convoltion_process(path4_value,...
                                            convoltion_processb5p3Kernels,convoltion_processb5p3Bias, 1, 1, 0, 1);
rectified_linear_unitb5p3=rectified_linear_unit(convoltion_process_layer_outb5p3);

convoltion_process_layer_outb5p33=convoltion_process(rectified_linear_unitb5p3,...
                                            convoltion_processb5p33Kernels,convoltion_processb5p33Bias, 1, 1, 0, 1);
rectified_linear_unitb5p33=rectified_linear_unit(convoltion_process_layer_outb5p33);
%

pool_layer_out3=maxpool_layer(path4_value,3,1);
convoltion_process_layer_outb5p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb5p4Kernels,convoltion_processb5p4Bias, 1, 1, 0, 1);
rectified_linear_unitb5p4=rectified_linear_unit(convoltion_process_layer_outb5p4);

path5_value=cat(3,rectified_linear_unitb5p1,rectified_linear_unitb5p22,rectified_linear_unitb5p33);

%% block path 6
[rr,cc,zz]=size(path5_value);
convoltion_process_layer_outb6p1=convoltion_process(path5_value,...
                                            convoltion_processb6p1Kernels,convoltion_processb6p1Bias, 1, 1, 0, 1);
rectified_linear_unitb6p1=rectified_linear_unit(convoltion_process_layer_outb6p1);

%
convoltion_process_layer_outb6p2=convoltion_process(path5_value,...
                                            convoltion_processb6p2Kernels,convoltion_processb6p2Bias, 1, 1, 0, 1);
rectified_linear_unitb6p2=rectified_linear_unit(convoltion_process_layer_outb6p2);


convoltion_process_layer_outb6p22=convoltion_process(rectified_linear_unitb6p2,...
                                            convoltion_processb6p22Kernels,convoltion_processb6p22Bias, 1, 1, 0, 1);
rectified_linear_unitb6p22=rectified_linear_unit(convoltion_process_layer_outb6p22);

%

convoltion_process_layer_outb6p3=convoltion_process(path5_value,...
                                            convoltion_processb6p3Kernels,convoltion_processb6p3Bias, 1, 1, 0, 1);
rectified_linear_unitb6p3=rectified_linear_unit(convoltion_process_layer_outb6p3);

convoltion_process_layer_outb6p33=convoltion_process(rectified_linear_unitb6p3,...
                                            convoltion_processb6p33Kernels,convoltion_processb6p33Bias, 1, 1, 0, 1);
rectified_linear_unitb6p33=rectified_linear_unit(convoltion_process_layer_outb6p33);
%

pool_layer_out3=maxpool_layer(path5_value,3,1);

convoltion_process_layer_outb6p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb6p4Kernels,convoltion_processb6p4Bias, 1, 1, 0, 1);
rectified_linear_unitb6p4=rectified_linear_unit(convoltion_process_layer_outb6p4);

path6_value=cat(3,rectified_linear_unitb6p1,rectified_linear_unitb6p22,rectified_linear_unitb6p33);

%% block path 7
convoltion_process_layer_outb7p1=convoltion_process(path6_value,...
                                            convoltion_processb7p1Kernels,convoltion_processb7p1Bias, 1, 1, 0, 1);
rectified_linear_unitb7p1=rectified_linear_unit(convoltion_process_layer_outb7p1);

%
convoltion_process_layer_outb7p2=convoltion_process(path6_value,...
                                            convoltion_processb7p2Kernels,convoltion_processb7p2Bias, 1, 1, 0, 1);
rectified_linear_unitb7p2=rectified_linear_unit(convoltion_process_layer_outb7p2);


convoltion_process_layer_outb7p22=convoltion_process(rectified_linear_unitb7p2,...
                                            convoltion_processb7p22Kernels,convoltion_processb7p22Bias, 1, 1, 0, 1);
rectified_linear_unitb7p22=rectified_linear_unit(convoltion_process_layer_outb7p22);

%

convoltion_process_layer_outb7p3=convoltion_process(path6_value,...
                                            convoltion_processb7p3Kernels,convoltion_processb7p3Bias, 1, 1, 0, 1);
rectified_linear_unitb7p3=rectified_linear_unit(convoltion_process_layer_outb7p3);

convoltion_process_layer_outb7p33=convoltion_process(rectified_linear_unitb7p3,...
                                            convoltion_processb7p33Kernels,convoltion_processb7p33Bias, 1, 1, 0, 1);
rectified_linear_unitb7p33=rectified_linear_unit(convoltion_process_layer_outb7p33);
%

pool_layer_out3=maxpool_layer(path6_value,3,1);
convoltion_process_layer_outb7p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb7p4Kernels,convoltion_processb7p4Bias, 1, 1, 0, 1);
rectified_linear_unitb7p4=rectified_linear_unit(convoltion_process_layer_outb7p4);

path7_value=cat(3,rectified_linear_unitb7p1,rectified_linear_unitb7p22,rectified_linear_unitb7p33);
path7_value=maxpool_layer(path7_value,3,1);
%% block path 8
convoltion_process_layer_outb8p1=convoltion_process(path7_value,...
                                            convoltion_processb8p1Kernels,convoltion_processb8p1Bias, 1, 1, 0, 1);
rectified_linear_unitb8p1=rectified_linear_unit(convoltion_process_layer_outb8p1);


convoltion_process_layer_outb8p2=convoltion_process(path7_value,...
                                            convoltion_processb8p2Kernels,convoltion_processb8p2Bias, 1, 1, 0, 1);
rectified_linear_unitb8p2=rectified_linear_unit(convoltion_process_layer_outb8p2);

convoltion_process_layer_outb8p22=convoltion_process(rectified_linear_unitb8p2,...
                                            convoltion_processb8p22Kernels,convoltion_processb8p22Bias, 1, 1, 0, 1);
rectified_linear_unitb8p22=rectified_linear_unit(convoltion_process_layer_outb8p22);

convoltion_process_layer_outb8p3=convoltion_process(path7_value,...
                                            convoltion_processb8p3Kernels,convoltion_processb8p3Bias, 1, 1, 0, 1);
rectified_linear_unitb8p3=rectified_linear_unit(convoltion_process_layer_outb8p3);


convoltion_process_layer_outb8p33=convoltion_process(rectified_linear_unitb8p3,...
                                            convoltion_processb8p33Kernels,convoltion_processb8p33Bias, 1, 1, 0, 1);
rectified_linear_unitb8p33=rectified_linear_unit(convoltion_process_layer_outb8p33);
%

pool_layer_out3=maxpool_layer(path7_value,3,1);
convoltion_process_layer_outb8p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb8p4Kernels,convoltion_processb8p4Bias, 1, 1, 0, 1);
rectified_linear_unitb8p4=rectified_linear_unit(convoltion_process_layer_outb8p4);

path8_value=cat(3,rectified_linear_unitb8p1,rectified_linear_unitb8p22,rectified_linear_unitb8p33);

%% block path 9
convoltion_process_layer_outb9p1=convoltion_process(path8_value,...
                                            convoltion_processb9p1Kernels,convoltion_processb9p1Bias, 1, 1, 0, 1);
rectified_linear_unitb9p1=rectified_linear_unit(convoltion_process_layer_outb9p1);

convoltion_process_layer_outb9p2=convoltion_process(path8_value,...
                                            convoltion_processb9p2Kernels,convoltion_processb9p2Bias, 1, 1, 0, 1);
rectified_linear_unitb9p2=rectified_linear_unit(convoltion_process_layer_outb9p2);

convoltion_process_layer_outb9p22=convoltion_process(rectified_linear_unitb9p2,...
                                            convoltion_processb9p22Kernels,convoltion_processb9p22Bias, 1, 1, 0, 1);
rectified_linear_unitb9p22=rectified_linear_unit(convoltion_process_layer_outb9p22);

%
convoltion_process_layer_outb9p3=convoltion_process(path8_value,...
                                            convoltion_processb9p3Kernels,convoltion_processb9p3Bias, 1, 1, 0, 1);
rectified_linear_unitb9p3=rectified_linear_unit(convoltion_process_layer_outb9p3);

convoltion_process_layer_outb9p33=convoltion_process(rectified_linear_unitb9p3,...
                                            convoltion_processb9p33Kernels,convoltion_processb9p33Bias, 1, 1, 0, 1);
rectified_linear_unitb9p33=rectified_linear_unit(convoltion_process_layer_outb9p33);
%

pool_layer_out3=maxpool_layer(path8_value,3,1);
convoltion_process_layer_outb9p4=convoltion_process(pool_layer_out3,...
                                            convoltion_processb9p4Kernels,convoltion_processb9p4Bias, 1, 1, 0, 1);
rectified_linear_unitb9p4=rectified_linear_unit(convoltion_process_layer_outb9p4);

path9_value=cat(3,rectified_linear_unitb9p1,rectified_linear_unitb9p22,rectified_linear_unitb9p33);
final_feature_datax=path9_value(:).';
final_feature_data=final_feature_datax(1:500).';







