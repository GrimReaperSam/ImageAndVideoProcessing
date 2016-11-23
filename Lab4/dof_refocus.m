function Iout = dof_refocus(lightField, slope, A)
    lightField = double(lightField);
    Iout = zeros([size(lightField,3) size(lightField,4) 3]);
    
    [XX, YY] = meshgrid(1:size(lightField,4), 1:size(lightField,3));
    N = size(lightField, 1); % Same as size(lightField, 2) also as a given
    R = 1:N;
    index = ceil(length(R)/2) - floor(A/2);
    indices = R(index: index + A - 1);
    for sub_ky=1:A
        for sub_kx=1:A
            ky = indices(sub_ky);
            kx = indices(sub_kx);
            II = squeeze(lightField(ky,kx,:,:,:));
            for k=1:3
                Iout(:,:,k) = Iout(:, :, k) + interp2(XX,YY,II(:,:,k), XX + slope*(-1/2+(ky-1)/(N-1)), YY + slope*(-1/2+(kx-1)/(N-1)), 'linear', 1);
            end
        end
    end
    Iout = uint8(Iout / (A * A));
end