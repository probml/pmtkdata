%% Process the tiny 20 newsgroup data 
% original data from http://www.cs.toronto.edu/~roweis/data.html

load 20news_w100 % documents, wordlist, newsgroups, groupnames
X = documents'; % 16,642 documents by 100 words  (sparse logical  matrix)
y = uint8(newsgroups); % class label, 1..4

N = size(X,1);
setSeed(0);
perm = randperm(N);
N2 = floor(N/2);
ndxTrain = perm(1:N2);
ndxTest = perm((N2+1):end);
Xtrain = X(ndxTrain,:);
ytrain = y(ndxTrain);
Xtest = X(ndxTest,:);
ytest = y(ndxTest);
classlabels = groupnames;
save('newsgroups.mat', 'X', 'y', 'classlabels', 'wordlist', 'Xtrain', 'ytrain', 'Xtest', 'ytest');


%{
% Let us filter out all documents with less than 5 words
nwords = sum(X,2);
ndx = find(nwords<5);
X(ndx,:) = []; % 10,992 documents by 100 words
%}

%{
% Let us filter out duplicate documents
[X,ndx] = unique(X, 'rows'); % 10,267 x 100
y = y(ndx);
save('newsgroupsUnique.mat', 'X', 'wordlist', 'y')
%}