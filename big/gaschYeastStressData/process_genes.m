load genes
load grouping
X=X';
num_genes = length(z);
num_groups = max(z);

Y=[];
istart=1;
iend  =0;
Z=[];
rev_ind=[];
for k=1:num_groups;
 [foo,ind] = find(z==k);
 istart    = iend+1;
 iend      = iend + length(ind); 
 comps{k}  = istart:iend;
 rev_ind(istart:iend) = ind;     
 Y         = [Y X(:,ind)];
 Z(istart:iend,k) = 1;
end
X=Y;

save processed_genes X comps
