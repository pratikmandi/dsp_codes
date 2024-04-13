clc;	
clear;
close all;	
imtool close all;
workspace;
fontSize = 15;
folder = fullfile(matlabroot, '\toolbox\images\imdemos');
baseFileName = 'cameraman.tif';

fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
	
	fullFileName = baseFileName;
	if ~exist(fullFileName, 'file')
		
		errorMessage = sprintf('Error: %s does not exist.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
grayImage = imread(fullFileName);

[rows ,columns, numberOfColorBands] = size(grayImage);

subplot(2, 2, 1);
imshow(grayImage);
title('Original Gray Scale Image', 'FontSize', fontSize);

set( gcf,'PaperSize',[29.7 21.0], 'PaperPosition',[0 0 29.7 21.0])


noisyImage = imnoise(grayImage,'salt & pepper', 0.05);
subplot(2, 2, 2);
imshow(noisyImage);
title('Image with Salt and Pepper Noise', 'FontSize', fontSize);


medianFilteredImage = medfilt2(noisyImage, [3 3]);


noiseImage = (noisyImage == 0 | noisyImage == 255);

noiseFreeImage = noisyImage; 
noiseFreeImage(noiseImage) = medianFilteredImage(noiseImage); 

subplot(2, 2, 3);
imshow(noiseFreeImage);
title('Restored Image', 'FontSize', fontSize);