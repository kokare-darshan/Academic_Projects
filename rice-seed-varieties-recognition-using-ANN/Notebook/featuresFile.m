function [featurePattern] = featuresFile(imgRGB)

[M N P] = size(imgRGB);
if P == 3
    grayImg = rgb2gray(imgRGB);
else
    grayImg = (imgRGB);
end

resizedIm = imresize(grayImg, [512 512]);
figure, imshow(resizedIm); title('Resized Gray Image');

pairs = 0;
GLCM2 = graycomatrix(resizedIm,'Offset',[2 0;0 2]);
textureFeat = glcmFeatures(GLCM2,pairs);

shapeFeat = cannyedgeFeat(resizedIm);

featurePattern = [textureFeat shapeFeat];

