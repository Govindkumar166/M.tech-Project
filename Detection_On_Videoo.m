addpath("C:\Govind1")
% addpath("C:\Users\Ram\Downloads")
% load("detectorYolo2_1")
% load("C:\Users\Ram\Downloads\detectorYolo2_f")
detector1=load("C:\Govind1\detectorYolo2_2")
videoFileReader=VideoReader('C:\Govind1\video3.m4v');
myVideo=VideoWriter('outputvideo3.avi');
open(myVideo);
depVideoPlayer = vision.DeployableVideoPlayer;
i=1;
size=10;
results = table('size',[10 3],...
    'VariableTypes',{'cell','cell','cell'},...
    'VariableNames',{'Boxes','Scores','Label'});

while hasFrame(videoFileReader)
    videoFrame = readFrame(videoFileReader);
%     bbox = detect(detectorYolo2,videoFrame);
%     videoFrame = insertShape(videoFrame,'Rectangle',bbox);
    [bboxes,scores,labels] = detect(detector1.detectorYolo2,videoFrame);
    if(~isempty(bboxes))
        videoFrame = insertObjectAnnotation(videoFrame,'rectangle',bboxes,cellstr(labels));
        results.Boxes{i} = floor(bboxes);
        results.Scores{i} = scores;
        results.Label{i} = labels;
        i =i+1;
%         IAnnotated = insertObjectAnnotation(I,'rectangle',bboxes,[labels ' - ' num2str(scores)])
%         out = imcrop(videoFrame,bboxes);
% %         imshow(out);
%         labels = cellstr(labels)
%         colors = autumn(numel(labels))
% 
%         for ii = 1:numel(bboxes)
%             labelidx = find(props(ii).Area > sizes,1,'last')
%             bw = insertObjectAnnotation(bw,'rectangle',...
%             props(ii).BoundingBox,labels{labelidx},...'Color',colors(labelidx,:),'FontSize',32);
%             videoFrame = insertObjectAnnotation(videoFrame,'rectangle',bboxes,labels{labelidx},'Color',colors(labelidx,:),'FontSize',22);
            
%     end
       % imshow(bw);
       
    end
    
    
    %Display Video
    depVideoPlayer(videoFrame);
    
    writeVideo(myVideo,videoFrame)
    %n=1;
    %imwrite(videoFrame,['C:\Govind1\image_' int2str(n)],'jpg');
    %n=n+1;
    pause(1/videoFileReader.FrameRate);
end
close(myVideo)