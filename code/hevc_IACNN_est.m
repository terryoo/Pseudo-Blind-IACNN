clear;

%% Add Path
addpath '/home/data2/terryoo/caffe/matlab/';
addpath 'function';

% caffe.reset_all();
%% Caffe Configuration
use_gpu=1;
%Set caffe mode
if exist('use_gpu', 'var') && use_gpu
    caffe.set_mode_gpu();
    gpu_id = 1;
    caffe.set_device(gpu_id);
else
    caffe.set_mode_cpu();
end

%% Estimation Parameter Setting
Est_Par.mbSize = 64;
Est_Par.stride = 64;
Est_Par.net_model = 'deploy/Est_hevc_deploy.prototxt';
Est_Par.net_weights = 'model_hevc/hevc_est.caffemodel';
Est_Par.sort_size = 96;
Est_Par.buffer_size = 10;
Est_Par.top1 = 1;
Est_Par.top2 = 2;


%% Load CNN Models
Par.net_model = 'deploy/inception_deploy2.prototxt';
Net_est = caffe.Net(Est_Par.net_model, Est_Par.net_weights, 'test');
Net34 = caffe.Net(Par.net_model, 'model_hevc/34.caffemodel', 'test');
Net37 = caffe.Net(Par.net_model, 'model_hevc/37.caffemodel', 'test');
Net42 = caffe.Net(Par.net_model, 'model_hevc/42.caffemodel', 'test');
Net47 = caffe.Net(Par.net_model, 'model_hevc/47.caffemodel', 'test');

%% Test Sets & Save Folder 
testfolder = './testset/hevc/comp47/BQTerrace/';
GTfoler = './testset/original/BQTerrace/';
save_folder = './results/';
imglist = dir(fullfile(testfolder,'*.png'));

if (~exist(save_folder, 'dir'))
    mkdir(save_folder); 
end
buffer_mat = [];

%% Framewise Process
tic;
estmat = zeros(length(imglist));
sum_psnr_comp = 0;
sum_psnr_proposed = 0;
for i=1:length(imglist)    
    if(i == 1)
        postframe_Y = im2double(imread([testfolder,imglist(i+1).name]));
        currframe_Y = im2double(imread([testfolder,imglist(i).name]));                
        prevframe_Y = currframe_Y;                

    elseif(i==length(imglist))
        prevframe_Y = currframe_Y;                
        currframe_Y = postframe_Y;              
    else
        prevframe_Y = currframe_Y;                
        currframe_Y = postframe_Y;               
        postframe_Y = im2double(imread([testfolder,imglist(i+1).name]));
    end
    
    % QP Estimation
    [est_QP,buffer_mat] = QPetimation(currframe_Y,postframe_Y,buffer_mat,Est_Par,Net_est,i);
    
    % QP-wise Artifacts Removal
    if(est_QP == 34)
        imgout = IACNN(currframe_Y,Net34);   
        estmat(i) = 34;
    elseif(est_QP ==37)
        imgout = IACNN(currframe_Y,Net37);         
        estmat(i) = 37;
    elseif(est_QP == 42)
        imgout = IACNN(currframe_Y,Net42);     
        estmat(i) = 42;
    else
        imgout = IACNN(currframe_Y,Net47);     
        estmat(i) = 47;
    end 
    
    gt_frame = imread([GTfoler,imglist(i).name]);  
    psnr_comp = psnr(im2uint8(currframe_Y),gt_frame);
    sum_psnr_comp = sum_psnr_comp + psnr_comp;
    psnr_proposed = psnr(im2uint8(imgout),gt_frame); 
    sum_psnr_proposed = sum_psnr_proposed + psnr_proposed;
    
    imwrite(imgout,[save_folder,imglist(i).name]);        
end
toc;
fprintf('compression psnr:%0.2f, processed psnr:%0.2f \n',sum_psnr_comp/length(imglist),sum_psnr_proposed/length(imglist));
caffe.reset_all();
            






            
            

           