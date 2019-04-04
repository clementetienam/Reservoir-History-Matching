function [ output ] = field2Metric( input, key )
% psi2Pa
% Author: Vilius Cepaitis
% Converts field (imperial) units to metric units
switch key
    case 'psi' % psi to Pa
        output = input*6894.757293168;
    case 'lbft3' % lb/ft3 to kg/m3
        output = input*16.0184634;
    case 'ms' % m/s to ft/s
        output = input*3.2808399;
    case 'ft' % ft/s to m
        output = input/3.2808399;
    otherwise
        error('Please choose a correct unit!');
end
end

