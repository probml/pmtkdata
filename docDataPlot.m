% docDataPlot

load docdata
spy(xtrain);colormap(gray);
xlabel('words');ylabel('documents');title('training set')
