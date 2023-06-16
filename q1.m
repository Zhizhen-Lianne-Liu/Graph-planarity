clear
p4 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_4.txt');
p6 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_6.txt');
p8 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_8.txt');
p12 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_12.txt');
p20 = readmatrix('https://www.maths.cam.ac.uk/undergrad/catam/data/II-17-7-Platonic_20.txt');

KP = [[1, 2];[3, 4];[4, 5];[5, 6];[6, 7];[1, 3];[1, 4];[1, 5];[1, 6];[1, 7];[2, 3]; [2, 4]; [2, 5];[2, 6];[2, 7]];

C = [[1, 2]; [2, 3]; [3, 1]];
C6 = [[1, 2]; [2, 3]; [3, 4]; [4, 1]];
C8 = C;
C12 = [[1, 2]; [2, 3]; [3, 4]; [4, 5]; [5, 1]];
C20 = C;


% drawgraphq1(p4, C);
% drawgraphq1(p6, C6);
% drawgraphq1(p8, C8);
% drawgraphq1(p12, C12);
% drawgraphq1(p20, C20);
% drawgraphq1(KP, C);

% G = [17,42;12,35;3,39;12,31;30,32;24,37;3,15;23,32;5,9;9,18;18,41;16,17;39,41;11,12;34,42;21,30;8,15;6,40;7,39;21,23;1,33;19,23;10,11;11,24;1,41;1,23;12,43;37,43;29,35;7,19;8,24;19,33;5,10;15,35;1,35;23,44;24,38;19,26;4,27;25,41;20,33;9,28;23,30;3,8;21,36;17,33;22,31;29,40;8,22;4,45;9,10;25,29;23,42;14,40;41,44;11,25;3,7;4,21;3,35;24,28;5,25;20,27;3,28;26,42;27,32;13,26;15,22;1,36;1,7;7,23;27,42;11,35;17,26;2,13;1,4;25,35;17,27;2,26;8,31;5,11;6,14;8,12;23,34;27,34;22,35;23,26;10,28;12,24;6,25;11,40;16,20;23,41;23,36;11,14;30,45;14,25;26,33;4,32;9,25;10,38;15,31;32,45;8,43;16,27;4,20;11,29;12,37;10,24;8,37;13,42;4,30;7,41;3,9;9,39;2,42;2,17;7,44;3,24;9,41;28,38;12,22;7,33;25,40;17,20;35,41;4,36;1,20;7,35;23,27];
% C = findCycle(G);
% %[1,20;20,4;4,1]
% drawgraphq1(G, C);

% G = [12,27;2,41;21,31;12,43;2,42;9,15;2,8;23,37;19,30;36,38;21,39;4,25;4,18;11,27;24,33;4,8;26,45;7,27;12,32;20,41;16,44;2,45;6,10;17,36;5,28;22,45;6,44;1,14;12,36;4,43;20,21;24,31;5,36;4,22;11,15;18,25;21,35;9,34;18,23;5,14;5,6;15,16;12,18;15,37;27,37;14,34;17,41;16,45;22,30;20,35;2,12;6,34;34,36;16,28;9,13;41,42;3,36;29,43;10,13;2,21;31,35;16,40;31,45;9,36;16,17;34,38;2,43;15,26;6,9;4,29;10,44;14,36;16,41;12,25;8,22;39,42;3,12;12,17;13,40;23,27;2,22;2,4;12,15;21,24;1,38;18,30;19,26;21,45;2,17;32,36;6,14;35,41;26,37;19,22;15,45;23,26;26,30;3,9;6,13;4,30;1,36;13,15;3,15;20,39;6,16;33,35;7,12;16,36;25,29;41,45;12,29;3,32;40,44;31,41;15,27;12,23;13,16;7,23;5,16;13,44;6,28;39,41;11,26;23,30;22,26;14,38;21,33;21,42;24,35];
% C = findCycle(G);
% drawgraphq1(G, C)

G = [11,41;18,24;12,15;20,39;3,10;22,38;2,35;15,41;8,44;5,36;21,24;9,34;1,39;3,20;29,30;10,26;1,2;28,40;8,33;37,40;7,20;15,35;24,29;11,29;13,32;7,24;5,29;26,39;6,10;16,18;15,23;9,36;6,17;6,18;15,24;11,42;4,31;6,40;30,45;22,37;9,41;5,9;15,31;12,21;16,23;27,29;17,38;35,37;25,36;5,16;1,43;2,12;3,8;29,32;6,37;16,19;4,41;34,42;14,26;38,40;12,20;15,16;9,19;28,38;26,35;22,28;30,32;35,39;12,43;11,27;10,37;13,24;9,15;1,12;12,39;3,18;16,35;6,38;20,44;24,44;9,11;18,40;17,40;6,22;10,35;11,31;19,36;7,44;5,18;4,15;2,43;8,24;13,45;20,26;14,39;5,42;7,12;10,18;7,21;9,16;29,31;20,33;19,25;33,44;9,42;9,23;1,35;24,45;13,30;22,40;29,45;5,11;16,37;16,25;13,31;5,25;18,29;31,32;13,15;31,41;2,15;15,21;5,27;3,33;11,34;8,18;14,20;3,26;16,40]
C = findCycle(G);
drawgraphq1(G, C);


