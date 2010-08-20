function r = pmtkDataRoot()
% Return directory name where pmtkData is stored
w = which(mfilename());
if w(1) == '.'
    w = fullfile(pwd, w(3:end));
end
r = fileparts(w);
end