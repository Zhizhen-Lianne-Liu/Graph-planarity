function B = drawgraphq1(G, C)
    
    N = max(G, [], 'all'); %number of vertices of graph
    A = adjacency(G, N);%adjacency matrix
    K = [];%to equal the vertices not in cycle
    inC = [];%to equal vertices in cycle
    for i = 1:N
        if ismember(i, C) == 0
            K = [K; i];
        else
            inC = [inC; i];
        end
    end
    
    %l is length of cycle (which is equal to number of vertices in cycle)
    l = size(C, 1);
    points = [[1, 0]];%points will define the polygon
    %remember let points also be the position of new vertices 1, ..., l.
    for i = 1:l-1
        points = [points; [cos((2*pi)*i/l), sin((2*pi)*i/l)]];
    end

    %plot the lines:
    hold on;
    axis equal;
    
    for i = 1:l
        plot(points(i, 1), points(i, 2), 'b.')
        point1 = int64(mod(i-1, l) + 1);
        point2 = int64(mod(i, l) + 1);
        plot([points(point1, 1), points(point2, 1)], [points(point1, 2), points(point2, 2)], 'Color', 'r')
    end
    
    %Now we want to solve the simultaneous equations for verties in K as
    %variables:
    deg = sum(A, 2); %find degree of each vertex by summing each row of adj
    %now want to create the corresponding matrix and vector for solving the
    %simultaneous equations:
    %first matrix:
    k = size(K, 1);
    M = zeros(k, k);
    for i = 1:k
        M(i, i) = -1*deg(K(i));
        for j = 1:k
            if A(K(i), K(j)) == 1
                M(i, j) = 1;
            end
        end
    end
    
    %vector for x pos
    b_x = zeros(k, 1);
    for i = 1:k
        for j = 1:size(inC, 1)
            if A(K(i), inC(j)) == 1
                b_x(i) = b_x(i) - points(j, 1);
            end
        end
    end
    
    %vector for y pos
    b_y = zeros(k, 1);
    for i = 1:k
        for j = 1:size(inC, 1)
            if A(K(i), inC(j)) == 1
                b_y(i) = b_y(i) - points(j, 2);
            end
        end
    end
    
    %deduce points for their average positions and add them to points, then
    %plot.
    
    x_pos = M\b_x;
    y_pos = M\b_y;
    
    middlepoints = []; %points not in cycle to be plotted
    for i = 1:k
        middlepoints = [middlepoints; [x_pos(i), y_pos(i)]];
    end
    
    %plotting
    for i = 1:k
       plot(middlepoints(i, 1), middlepoints(i, 2), 'b.')
       for j = 1:k
          if A(K(i), K(j)) == 1
              plot([middlepoints(i, 1), middlepoints(j, 1)],[middlepoints(i, 2), middlepoints(j, 2)],'Color', 'r')
          end
       end
       
       for m = 1:size(inC, 1)
           if A(K(i), inC(m)) == 1
                plot([middlepoints(i, 1), points(m, 1) ], [middlepoints(i, 2), points(m, 2)], 'Color', 'r')
           end
       end
    end
    
end