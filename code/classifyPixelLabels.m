function [predictPixelLabels] = classifyPixelLabels()

% Procedure: Attempt 1 - Classify image as road or not road using (deep) 
% neural network. 
% Network Structure 
% 1. input layer - all images (or more specifically, patches) transformed 
% into RGB channels.
% 2. a) convolution layer - 16 3x3(x3) convolution. stride [1 1] and padding
% [0 0]
%    b) ReLU layer 
%    c) maxpool Layer - (do we need maxpool since were giving 32x32
%    patches? which are reasonably small in the first place). 3x3 maxpool,
%    stride [1 1] and padding [0 0].
% 3. a) Fully connected layer. - same size as input patch (in vectorized form)
%    b) Softmax layer. 
end
