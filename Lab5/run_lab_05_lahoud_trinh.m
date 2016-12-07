clc
clear all
close all

% Loading data
load('data/codec_lut.mat')
load('data/content_lut.mat')
load('data/bitrate_lut.mat')
load('data/bitrate_values.mat')
load('data/raw_scores.mat')
load('data/metrics.mat')

codecs = {'JPEG', 'HEVC', 'JPEG 2000 (PSNR)', 'JPEG 2000 (visual)', 'Daala',...
    'JPEG XR (444)', 'WebP', 'JPEG (PSNR)', 'JPEG (visual)', 'JPEG XR (420)'};
contents = {'bike', 'cafe', 'honolulu_zoo', 'p08', 'p26', 'woman'};
bitrates = {'R1', 'R2', 'R3', 'R4'};

% Lab 05 - Fayez LAHOUD, Christophe TRINH - 23th November 2016
%% Plotting MOS values with CI for each content
[mos, ci] = MOS(raw_scores);
content_types = unique(content_lut);
codec_types = unique(codec_lut);
for i=1:length(content_types)
    content = content_types(i);
    indices = find(content_lut == content);
    figure('Name', contents{i})
    for j=1:length(codec_types)
       codec = codec_types(j);
       codec_indices = find(codec_lut == codec);
       bit_indices = intersect(indices, codec_indices);
       errorbar(bitrate_values(bit_indices), mos(bit_indices), ci(bit_indices), 'DisplayName', codecs{j})
       hold on
    end
    hold off
    xlabel('Bitrates')
    ylabel('MOS')
    legend('show')
    legend('location', 'southeast')
    legend('boxoff')
end

