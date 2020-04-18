
row1 = [1 2 3];
row2 = [4 5 6];
col1 = [1; 2; 3];
col2 = [4; 5; 6];

row1
row2
col1
col2

disp('Transpose of row 1 is');
transpose(row1)
disp('Transpose of col 2 is');
col2'

disp('Addition of row1 and row2 is : ');
rowadd = row1 + row2
disp('Addition of col1 and col2 is : ');
coladd = col1 + col2

disp('Subtraction of row1 and row2 is : ');
rowsub = row2 - row1
disp('Subtraction of col1 and col2 is : ');
colsub = col1 - col2

disp('Addition of all elements in row21 is : ');
sum(row2)

disp('Multiplication of all elements of col 2 is : ');
prod(col2)

rowcol1 = [1 2 3; 4 5 6; 7 8 9;];
rowcol2 = [10 11 12; 13 14 15; 16 17 18;];

rowcol1
rowcol2

disp('Multiplication of 3 Dimensional Matrix is :');
rowcol1 * rowcol2

disp('Exponent on square matrix : ')
rowcol1 ^ 2

disp('Initializing 2x3 Matrix will all 0, 1, nan and random number');
o = ones(2,3)
z = zeros(2,3)
n = nan(2,3)
r = rand(2,3)

disp('Use of linspace and : and logspace in range 0 to 10 with 5 values');
a = linspace(0, 10, 5)
b = 0:2:10
c = logspace(0,2,5)
