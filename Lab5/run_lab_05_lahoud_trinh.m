% Lab 05 - Fayez LAHOUD, Christophe TRINH - 23th November 2016

clc
clear all
close all

% Loading data
load('data/codec_lut.mat')
load('data/content_lut.mat')
load('data/bitrate_lut.mat')
load('data/bitrate_values.mat')
load('data/raw_scores.mat')
metrics = load('data/metrics.mat');

codecs = {'JPEG', 'HEVC', 'JPEG 2000 (PSNR)', 'JPEG 2000 (visual)', 'Daala',...
    'JPEG XR (444)', 'WebP', 'JPEG (PSNR)', 'JPEG (visual)', 'JPEG XR (420)'};
contents = {'bike', 'cafe', 'honolulu_zoo', 'p08', 'p26', 'woman'};
bitrates = {'R1', 'R2', 'R3', 'R4'};

metrics_names = fieldnames(metrics);
content_types = unique(content_lut);
codec_types = unique(codec_lut);

%% Plotting MOS values with CI vs bitrates for each content
[mos, ci] = MOS(raw_scores);
figure('Name', 'MOS vs bitrate per content')
for i=1:length(content_types)
    content = content_types(i);
    indices = find(content_lut == content);
    subplot(2, 3, i)
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
    title(contents(i))
end
legend(gca, 'show');

%% Plotting objectives metrics
for i=1:length(content_types)
    content = content_types(i);
    indices = find(content_lut == content);
    figure('Name', contents{i})
    for j=1:length(metrics_names)
        for index_codec = 1:length(codec_types)
            codec = codec_types(index_codec);
            codec_indices = find(codec_lut == codec);
            bit_indices = intersect(indices, codec_indices);
            metrics_values = getfield(metrics,metrics_names{j});
            subplot(3,3,j)
            plot(bitrate_values(bit_indices),metrics_values(bit_indices),'DisplayName',codecs{index_codec});
            hold on
        end
        hold off
        xlabel('Bitrates')
        ylabel(strrep(metrics_names{j},'_',''))
    end
    legend(gca, 'show');
end


%% Plotting MOS values with CI vs metrics for each metric
[mos, ci] = MOS(raw_scores);
    figure('Name', 'MOS vs Metrics comparison')
for m=1:length(metrics_names)
    subplot(3, 3, m)
    title(metrics_names{m})
    current_metric = getfield(metrics, metrics_names{m});

    for i=1:length(content_types)
        content = content_types(i);
        indices = find(content_lut == content);
        errorbar(current_metric(indices), mos(indices), ci(indices), 'o', 'DisplayName', contents{i})
        hold on
    end
    
    [sorted, sort_indices] = sort(current_metric);
    sorted_mos = mos(sort_indices);
    % Linear fit
    p = polyfit(current_metric, sorted_mos, 1);
    y_fit = polyval(p, sorted);
    plot(sorted, y_fit, 'k--', 'DisplayName', 'Linear Fit')
    hold on
    
    pearson = corr(sorted_mos, y_fit);
    spearman = corr(sorted_mos, y_fit, 'type', 'Spearman');    
    rmse = sqrt(sum((sorted_mos(:) - y_fit(:)).^2) / length(sorted_mos));
    
    % Cubic fit
    p = polyfit(current_metric, sorted_mos, 3);
    y_fit = polyval(p, sorted);
    plot(sorted, y_fit, 'k-.', 'DisplayName', 'Cubic fit')
    hold on
    
    pearson = corr(sorted_mos, y_fit);
    spearman = corr(sorted_mos, y_fit, 'type', 'Spearman');    
    rmse = sqrt(sum((sorted_mos(:) - y_fit(:)).^2) / length(sorted_mos));
    
    xlabel(strrep(metrics_names{m}, '_', ' '))
    ylabel('MOS')
    hold off
end
legend(gca, 'show');
