% Testing otsu's method thresholding.
clc; clear;
disp('Running test1 ...');
disp('------------------------------------------------------------------');

A = [0 1 1 2 2 3];
B = otsu_th(A, 5);

if isequal(B, A>1)
    disp('Basic test passed!');
else
    warning('Implementation failed on the basic test!');
end

A = uint8([1 2 3 4 5 6; 7 8 9 6 1 0]);
B = otsu_th(A, 10);
if isequal(B, A>4)
    disp('Intermediate test passed!');
else
    warning('Implementation failed on the intermediate test!');
end

A = uint8([88 99 77 25 67 41 25 68 47 88 52 54
     21 02 05 88 42 31 12 58 99 01 11 17]);
B = otsu_th(A, 10);
if isequal(B, A>49)
    disp('Advanced test passed!');
else
    warning('Implementation failed on the advanced test!');
end