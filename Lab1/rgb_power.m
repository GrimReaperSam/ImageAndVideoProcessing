function [ new_colormap ] = rgb_power( colormap, power )
%to make element_wise power on rgb 
%   
    new_colormap = colormap.^power;

end

