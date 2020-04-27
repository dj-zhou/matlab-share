% giving an vector, mark the ranking based on the method
% for example, for a vector
% input_vec = [ 8     6    12     1    -3    17     9     8    -8    15]
% if the method is 'l2s' (large to small), the output is
%   ranking = [5     7     3     8     9     1     4     6    10     2]

function ranking = Mark_Ranking(input_vec, method)

% a = [8 6 12 1 -3 17 9 8 -8 15]
marking = zeros(1,length(input_vec));
ranking = zeros(1,length(input_vec));

for i = 1 : length(input_vec)
    for k = 1 : length(input_vec)
        if marking(k) == 0
            max_or_min = input_vec(k);
            max_index = k;
            break; % the for loop
        end
    end
    for j = 1 : length(input_vec)
        if (method == 'l2s')
            if (input_vec(j) > max_or_min) && (marking(j) == 0)
                max_or_min = input_vec(j);
                max_index = j;
            end
        elseif (method == 's2l')
            if (input_vec(j) < max_or_min) && (marking(j) == 0)
                max_or_min = input_vec(j);
                max_index = j;
            end
        end
    end
    marking(max_index) = 1;
    ranking(max_index) = i;
end