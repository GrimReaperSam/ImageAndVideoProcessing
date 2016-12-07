function [ score,CI ] = MOS(raw_scores)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here    
    N = size(raw_scores, 2);
    score = mean(raw_scores, 2);
    CI = tinv(1-0.05/2, N - 1) * std(raw_scores, 0, 2) / sqrt(N);
end

