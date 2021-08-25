function [finalres,MAT_CONFUSION,finalaccvalue]=result_process_final(train_data,train_class,...
    test_data,test_class,test_data_single,case_name,resize,display_opt,class_name,train_opt_set)


res_str=class_name;
rng=length(res_str);
[rr cc]=size(train_data);
insize2=10;insize1=cc/insize2;
train_label_pass=categorical(repmat(train_class,[1 1]));
train_image_pass=reshape(train_data,[insize1 insize2 1 rr]);
test_image_pass_single=reshape(test_data_single,[insize1 insize2 1 1]);
test_image_pass=reshape(test_data,[insize1 insize2 1 rr]);
layers=[imageInputLayer([insize1 insize2 1], 'Name', 'input')
    convolution2dLayer(5, 20, 'Name', 'conv_1')
    reluLayer('Name', 'relu_1')
    convolution2dLayer(3, 20, 'Padding', 1, 'Name', 'conv_2')
    reluLayer('Name', 'relu_2')
    convolution2dLayer(3, 20, 'Padding', 1, 'Name', 'conv_3')
    reluLayer('Name', 'relu_3')
    additionLayer(2,'Name', 'add')
    fullyConnectedLayer(rng, 'Name', 'fc')
    softmaxLayer('Name', 'softmax')
    classificationLayer('Name', 'classoutput')];
layer_flow_graph=layerGraph(layers);
layer_flow_graph=connectLayers(layer_flow_graph, 'relu_1', 'add/in2');
[train_network_final,info]=trainNetwork(train_image_pass,...
    train_label_pass,...
    layer_flow_graph,train_opt_set);
res_out=classify(train_network_final,test_image_pass);
res_out_single=classify(train_network_final,test_image_pass_single);
res_out=double(res_out);
res_out_single=double(res_out_single);
finalres=res_str(res_out_single);

for kw=1:length(test_class)
    confin_ori(kw,1:rng)=ismember(1:rng,test_class(kw));
end

for kw=1:length(res_out)
    confin_result(kw,1:rng)=ismember(1:rng,res_out(kw));
end
[C,MAT_CONFUSION,IND,per_val]=confusion(double(confin_ori.'),double(confin_result.'));


[rr cc]=size(MAT_CONFUSION);


final_accuracy=(sum(test_class ==res_out)/numel(res_out))*100;
finalaccvalue=final_accuracy;

if(display_opt==1)

%      plotconfusion(targets,outputs) plots a confusion matrix, using target
%   (true) and output (predicted) labels. Specify the labels as categorical
%   vectors, or in 1-of-N (one-hot) form.
%   
    figure,plotconfusion(double(confin_ori.'),double(confin_result.'));
    title(case_name);
    
    
   
    
    
end





end