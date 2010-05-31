function refreshZipFiles(list)
%% Refreh the contents of the individual zip files in each folder in list.
% If list is not specified, do this for every data directory.
%
% *** requires PMTK3 ***
%
%% Examples
%
% refreshZipFiles()
% refreshZipFiles('alarmNetwork')
% refreshZipFiles({'alarmNetwork', 'anscombe'});
%%
if nargin == 0
    datasets = dirs(pmtkDataRoot());
else
    datasets = cellwrap(list);
end
%% Check that all of the directories exist
for i=1:numel(datasets)
    assert(exist(fullfile(pmtkDataRoot(), datasets{i}), 'file') == 7);
end
%%
tmproot = fullfile(pmtkDataRoot(), 'tmp');
mkdir(tmproot);
for i=1:numel(datasets)
    d = datasets{i};
    p = fullfile(pmtkDataRoot(), d);
    tmp = fullfile(tmproot, d);
    system(sprintf('svn export %s %s', p, tmp));
    z = fullfile(tmp, [d, '.zip']); 
    if exist(z, 'file')
        delete(z); % remove the old zip file
    end
    zip(fullfile(pmtkDataRoot(), d, [d, '.zip']), tmp);
    system(sprintf('rmdir /Q /S %s', tmp));
end
system(sprintf('rmdir /Q /S %s', tmproot));
end