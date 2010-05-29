function zipData()
%% Zip up each of the data sets individually.


datasets = dirs(pmtkDataRoot()); 
for i=1:numel(datasets)
    d = datasets{i};
    p = fullfile(pmtkDataRoot(), d); 
    z = fullfile(p, [d, '.zip']); 
    if exist(z, 'file')
       delete(z);  
    end
    zip(fullfile(pmtkDataRoot(), [d, '.zip']), p);
    movefile(fullfile(pmtkDataRoot(), [d, '.zip']), z); 
end


end