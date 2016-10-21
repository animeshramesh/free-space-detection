img = imread('data_road/training/gt_image_2/um_lane_000000.png');
img = im2double(img);
map = zeros(size(img,1), size(img, 2));

% histogram(x);
for i = 1:size(img,1)
   for j = 1:size(img, 2)
      if img(i,j,2) > 0.9
          map(i,j) = 255;
      end
   end
end

imshow(map);