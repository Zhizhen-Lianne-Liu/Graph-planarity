clear

%[G, firstVio] = generatePlanarG(10);

graphs = {};
FV = [];
for i = 1:30
    tic;
    [graphs{i}, FV(i)] = generatePlanarG(45);
    toc;
end
   

