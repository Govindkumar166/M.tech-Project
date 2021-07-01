addpath(".\")
data = load('TestData3_080009~7.mat');
testDataa97 = data.gTruth;
dataSource=groundTruthDataSource('VID_20210406_080009~7.mp4')
data.gTruth.DataSource=dataSource
if ~exist('training_data2','dir')
 mkdir training_data1
end
 addpath("training_data2")
testDataa97= objectDetectorTrainingData(testDataa97,"SamplingFactor",1,"WriteLocation",".\training_data2");
testDataa97(1:4,:)

% Add the fullpath to the local vehicle data folder.
testDataa97.imageFilename = fullfile(pwd,testDataa97.imageFilename);

%vehicleDataset_Multi_Final2=[vehicleDataset1;vehicleDataset2;vehicleDataset3;vehicleDataset4;vehicleDataset5;vehicleDataset6;vehicleDataset7;vehicleDataset8;vehicleDataset9;vehicleDataset10;vehicleDataset11;vehicleDataset12;vehicleDataset13;vehicleDataset14;vehicleDataset15;vehicleDataset16;vehicleDataset17;vehicleDataset18;vehicleDataset20;vehicleDataset21;vehicleDataset22;vehicleDataset23;vehicleDataset24;vehicleDataset25;vehicleDataset26;vehicleDataset27;vehicleDataset28;vehicleDataset29;vehicleDataset30]