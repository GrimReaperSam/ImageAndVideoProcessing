function dithered = floyd_ed(image)
    min_v = min(image(:));
    max_v = max(image(:));
    threshold = (min_v + max_v) / 2;
    [X, Y] = size(image);
    for y=1:Y-1
        for x=2:X-1
            oldPx = image(x, y);
            if oldPx > threshold
                image(x, y) = 255;
            else
                image(x, y) = 0;
            end
            error = oldPx - image(x, y);
            image(x+1, y) = image(x+1, y) + 7 / 16 * error;
            image(x-1, y+1) = image(x-1, y+1) + 3 / 16 * error;
            image(x, y+1) = image(x, y+1) + 5 / 16 * error;
            image(x+1, y+1) = image(x+1, y+1) + 1 / 16 * error;
        end
    end
    dithered = image;
end

