function detectPeople(file_name)
peopleDetector = vision.PeopleDetector;
I = imread(file_name);
[bboxes,scores] = step(peopleDetector,I);
I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I)
title('Detected people and detection scores');
end