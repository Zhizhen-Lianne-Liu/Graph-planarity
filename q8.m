clear 
p4 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_4.txt');
p6 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_6.txt');
p8 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_8.txt');
p12 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_12.txt');
p20 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_20.txt');

KP = [[1, 2];[3, 4];[4, 5];[5, 6];[6, 7];[1, 3];[1, 4];[1, 5];[1, 6];[1, 7];[2, 3]; [2, 4]; [2, 5];[2, 6];[2, 7]];

G = [[1, 2]; [2, 4]; [4, 5]; [5, 6];[6, 3];[3, 1]; [5, 7]; [7, 8];[8, 2]; [6, 10];[10, 11];[11, 12];[12, 13];[13, 4];];

G = [p20;2,4;2,5;3,6;4,6];

G = [p6;1,6];
%cube with 1,6 added
B1 = checkGplanar(G); 
%if planar, expect B = 1. B should return 0 otherwise

B2 = checkGplanar(p4);

B3 = checkGplanar(p6);

B4 = checkGplanar(p8);

B5 = checkGplanar(p12);

B6 = checkGplanar(p20);

B7 = checkGplanar(KP);

G = [p12;7,14];
B8 = checkGplanar(G);

G = [2,3;6,9;1,7;8,10;1,5;6,7;5,6;6,8;6,10;5,9;1,3;5,7;2,9;7,9;4,5;3,8;7,8;2,7;2,8;2,10;3,4;3,10;1,2;1,6;1,4;2,5;3,5];
B9 = checkGplanar(G);

G = [1,9;6,7;3,4;2,4;5,8;8,10;2,3;5,10;5,7;7,8;2,6;3,6;1,7;4,6;2,8;7,9;2,5;1,2;1,4;1,8;7,10;2,7;4,9;4,7;6,9;3,9;1,10];
B10 = checkGplanar(G);

G = [2,8;2,7;1,8;3,6;6,9;5,10;4,5;1,7;7,9;3,7;1,5;6,7;7,10;4,10;2,3;1,10;3,9;7,8;6,8;1,4;3,8;];
B11 = checkGplanar(G);%expect 1


%dodecahedron with edge 1, 2 removed
G = [2,3;3,4;4,5;5,1;1,12;2,14;3,6;4,8;5,10;6,7;7,8;8,9;9,10;10,11;11,12;12,13;13,14;14,15;15,6;15,16;7,17;9,18;11,19;13,20;16,17;17,18;18,19;19,20;20,16]
B12 = checkGplanar(G);

%icosahedron with edge 2, 3 removed
G = [1,2;1,3;1,4;1,5;1,6;3,4;4,5;5,6;6,2;2,11;2,7;3,7;3,8;4,8;4,9;5,9;5,10;6,10;6,11;7,8;8,9;9,10;10,11;11,7;7,12;8,12;9,12;10,12;11,12]
B13 = checkGplanar(G);

%icosahedron with edge 4, 11 added
G = [1,2;4, 11;1,3;1,4;1,5;1,6;2,3;3,4;4,5;5,6;6,2;2,11;2,7;3,7;3,8;4,8;4,9;5,9;5,10;6,10;6,11;7,8;8,9;9,10;10,11;11,7;7,12;8,12;9,12;10,12;11,12];
B14 = checkGplanar(G);

%octahedron with 3, 4 removed
G = [1,2;1,3;1,4;1,5;2,3;4,5;5,2;6,2;6,3;6,4;6,5];
B15 = checkGplanar(G);

%cube with edge 2, 7 removed
G = [1,2;1,4;1,8;2,3;3,4;3,6;4,5;5,6;5,8;6,7;7,8];
B16 = checkGplanar(G);
