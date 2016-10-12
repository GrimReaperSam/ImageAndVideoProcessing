function dithered = stucki_ed(image)
    min_v = min(image(:));
    max_v = max(image(:));
    threshold = (min_v + max_v) / 2;
    [X, Y] = size(image);
    for y=1:Y-2
        for x=3:X-2
            oldPx = image(x, y);
            if oldPx > threshold
                image(x, y) = 255;
            else
                image(x, y) = 0;
            end
            error = oldPx - image(x, y);
            image(x+1, y) = image(x+1, y) + 8 / 42 * error;
            image(x+2, y) = image(x+2, y) + 4 / 42 * error;
            
            image(x-2, y+1) = image(x-2, y+1) + 2 / 42 * error;
            image(x-1, y+1) = image(x-1, y+1) + 4 / 42 * error;
            image(x  , y+1) = image(x  , y+1) + 8 / 16 * error;
            image(x+1, y+1) = image(x+1, y+1) + 4 / 16 * error;
            image(x+2, y+1) = image(x+2, y+1) + 2 / 16 * error;
            
            image(x-2, y+2) = image(x-2, y+2) + 1 / 42 * error;
            image(x-1, y+2) = image(x-1, y+2) + 2 / 42 * error;
            image(x  , y+2) = image(x  , y+2) + 4 / 16 * error;
            image(x+1, y+2) = image(x+1, y+2) + 2 / 16 * error;
            image(x+2, y+2) = image(x+2, y+2) + 1 / 16 * error;
        end
    end
    dithered = image;
end

