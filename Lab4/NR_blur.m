function [blur_index_ver, blur_index_hor] = NR_blur(Y)    
    % Vertical edges
    v_edges = edge(Y, 'Sobel', 'vertical');
    
    % Finding the positions of the edges
    [row, col] = find(v_edges);
    width_array = zeros(size(row));
    
    for i=1:length(row)
        width_array(i) = calculate_width(Y(row(i), :), col(i));
    end
    blur_index_ver = mean(width_array);

    
    % Horizontal edges
    h_edges = edge(Y, 'Sobel', 'horizontal');
    
    % Finding the positions of the edges
    [row, col] = find(h_edges);
    width_array = zeros(size(col));
    
    for i=1:length(col)
        width_array(i) = calculate_width(Y(:, col(i)), row(i));
    end
    blur_index_hor = mean(width_array);
end


function width = calculate_width(array, point)
    L = length(array);

    a_start = inf;
    a_end = inf;

    % Moving backwards
    if point == 1
        a_start = 1;
    else
        % Check increase or decrease
        if array(point) > array(point - 1) % Local Maximum search
            j = max(1, point - 1);
            while 1
                if j == 1 % Can't go back anymore
                    a_start = j;
                    break;
                end

                if array(j) < array(j - 1) % Stopped increasing
                    a_start = j;
                    break;
                end
                j = j - 1;
            end
        else % Local Minimum search
            j = max(1, point - 1);
            while 1
                if j == 1 % Can't go back anymore
                    a_start = j;
                    break;
                end

                if array(j) > array(j - 1) % Stopped decreasing
                    a_start = j;
                    break;
                end
                j = j - 1;
            end
        end
    end

    % Moving forwards
    if point == L
        a_end = L;
    else
        % Check increase or decrease
        if array(point) < array(point + 1) % Local Maximum search
            j = min(L, point + 1);
            while 1
                if j == L % Can't go back anymore
                    a_end = j;
                    break;
                end

                if array(j) > array(j + 1) % Stopped increasing
                    a_end = j;
                    break;
                end
                j = j + 1;
            end
        else % Local Minimum search
            j = min(L, point + 1);
            while 1
                if j == L % Can't go back anymore
                    a_end = j;
                    break;
                end

                if array(j) < array(j + 1) % Stopped decreasing
                    a_end = j;
                    break;
                end
                j = j + 1;
            end
        end
    end
    width = a_end - a_start;
end