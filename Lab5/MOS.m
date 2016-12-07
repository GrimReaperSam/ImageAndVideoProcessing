function [ score,CI ] = MOS( results )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    score = mean(results);
    N = len(results);
    CI = icdf('t',0.1:0.2:0.9,1-0.05/2,N) * std(results)/sqrt(N);
    
end

