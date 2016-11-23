function Iout = refocus(lightField, slope)
    lightField = double(lightField);
    Iout = zeros([size(lightField,3) size(lightField,4) 3]);
    
    [XX, YY] = meshgrid(1:size(lightField,4), 1:size(lightField,3));
    N = size(lightField, 1); % Same as size(lightField, 2) also as a given
    
    for ky=1:N
        for kx=1:N
            II = squeeze(lightField(ky,kx,:,:,:));
            for k=1:3
                Iout(:,:,k) = Iout(:, :, k) + interp2(XX,YY,II(:,:,k), XX + slope*(-1/2+(ky-1)/(N-1)), YY + slope*(-1/2+(kx-1)/(N-1)), 'linear', 1);
            end
        end
    end
    Iout = uint8(Iout / (N * N));
end