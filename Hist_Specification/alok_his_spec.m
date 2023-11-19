close all;
clear;
clc;


% Load the input and reference images

input_image = imread('image4.jpg');
reference_image = imread('image1.png');

% Perform histogram specification
histogram_specification(input_image, reference_image);

function histogram_specification(input_image, reference_image)

    % Get the histograms of the input and reference images
    input_histogram = custom_imhist(input_image);
    reference_histogram = custom_imhist(reference_image);
    
    % Create a lookup table (LUT) for mapping pixels to new values
    LUT = zeros(256, 1);
    for i = 1:256
        % Calculate the cumulative sum of the input histogram
        cumulative_sum = sum(input_histogram(1:i));
        
        % Calculate the corresponding index in the reference histogram
        reference_index = find(reference_histogram >= cumulative_sum, 1, 'first');
        
        % Check if the reference index is valid
        if isempty(reference_index)
            % If not, set it to the last index
            reference_index = 256;
        end
        
        % Set the LUT value for the current pixel
        LUT(i) = reference_index;
    end
    
    % Apply the LUT to the input image to get the new image
    new_image = input_image;
    for i = 1:size(input_image, 1)
        for j = 1:size(input_image, 2)
            new_image(i, j) = LUT(input_image(i, j) + 1);
        end
    end
    
    % Display the input and new images
    figure;
    subplot(2, 2, 1);
    imshow(input_image);
    title('Input Image');
    
    subplot(2, 2, 2);
    imhist(input_image);
    title('Input Image Histogram');
    
    subplot(2, 2, 3);
    imshow(new_image);
    title('New Image');
    
    subplot(2, 2, 4);
    imhist(new_image);
    title('New Image Histogram');

end
function histogram = custom_imhist(image)

    % Initialize the histogram array
    histogram = zeros(256, 1);

    % Count the occurrences of each pixel intensity value
    for row = 1:size(image, 1)
        for col = 1:size(image, 2)
            intensity_value = image(row, col) + 1;
            histogram(intensity_value) = histogram(intensity_value) + 1;
        end
    end

    % Normalize the histogram values
    histogram = histogram / numel(image);

end
