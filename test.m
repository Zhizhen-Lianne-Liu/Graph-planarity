C = [2,6;6,5;5,4;4,2];
G = [2,4;2,5;2,6;4,5;4,6;5,6;7,8;8,9;9,7];

[bridges, av] = findBridges(G,C);

B = checkChasChord(G, C);

C = [1,6;6,5;5,3;3,2;2,1];
G = [1,2;2,3;4,5;5,6;6,1;3,5];

[bridges, av] = findBridges(G,C);

B = checkChasChord(G, C);