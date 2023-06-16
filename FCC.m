function [CCoutput, chord] = FCC(G)
%find a cycle with a chord, modified findCycle.m
N = max(G, [], 'all');
V = zeros(N, 1);%ith element 1 if ith vertex visited, 0 otherwise

A = adjacency(G, N);
parents = zeros(N, 1);
cycle = [];
cycle2 = [];
for i = 1:N
    if V(i) == 0
        V(i) = 1;
        [cycle, ~, B] = FCCR(i, V, A, -1, cycle, parents);
        if B == 1
            %once a cycle is found, for each edge of the cycle, delete cycle
            %from adjacency matrix except for that edge, and check if there is
            %another cycle to that edge, if not, B = 0.
            for j = 1:size(cycle, 1)
                V2 = zeros(N, 1);%ith element 1 if ith vertex visited by second search
                parents2 = zeros(N, 1);
                e = cycle(j, :);
                
                Acopy = deleteEdges(A, cycle, e);
                Acopy(e(1), e(2)) = 1;
                Acopy(e(2), e(1)) = 1;
                parents2(e(2)) = -1;
                V2(e(2)) = 1;
                [cycle2, ~, B2] = FCCR(e(1), V2, Acopy, e(2), cycle2, parents2);
                
                if B2 == 1
                    CCoutput = [cycle;cycle2];
                    %remove edge e
                    
                    for k = size(CCoutput, 1):-1:1
                        if sort(CCoutput(k, :)) == sort(e)
                            CCoutput(k, :) = [];
                        end
                    end
                    chord = e;
                    return
                    
                end

            end
            
            %if no neighbour cycle, then it must itself be a cycle with
            %chord
            %so find the chord and return the cycle
            CCoutput = cycle;
            
            
        end
    end
end


end

