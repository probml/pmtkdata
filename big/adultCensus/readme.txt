http://research.microsoft.com/en-us/projects/svm/default.aspx
http://research.microsoft.com/en-us/projects/svm/default.aspx

This archive contains a nested set of training data for the UCI "adult"
benchmark. Each file is in .dst format, which will be described below. The
benchmark task is to predict whether a household has >$50K income based on
14 other fields in a census form. Eight of those fields are categorical,
while six are continuous. The six fields are quantized into quintiles,
which yields a total of 123 sparse binary features.

There are 9 training files, each with a different number of training
examples:

   Filename          Number of Examples
   ========          ==================
   adult-1a.dst             1605
   adult-2a.dst             2265
   adult-3a.dst             3185
   adult-4a.dst             4781
   adult-5a.dst             6414
   adult-6a.dst            11221
   adult-7a.dst            16101
   adult-8a.dst            22697
   adult-a.dst             32562

There are two benchmarks in the technical report. The first is to train a
linear SVM with C = 0.05. The second is to train a Gaussian SVM with C = 1,
with Gaussian variance of 10. These parameters were chosen to maximize
performance on a validation set. The timing results are given in the technical
report.

To make sure that the benchmark is run properly, check the number of bound
and number of non-bound Lagrange multipliers on the tables listed in the
technical report. Another check is to print out the threshold (b) for the
trained SVM. The thresholds should be very close to the following numbers:

Linear SVM:

   Filename          Threshold
   ========          =========
   adult-1a.dst      0.884999
   adult-2a.dst      1.12781
   adult-3a.dst      1.17302
   adult-4a.dst      1.24946
   adult-5a.dst      1.26737
   adult-6a.dst      1.32441
   adult-7a.dst      1.47331
   adult-8a.dst      1.39797
   adult-a.dst       1.41408

Gaussian SVM:

   Filename          Threshold
   ========          =========
   adult-1a.dst      0.428453
   adult-2a.dst      0.28563
   adult-3a.dst      0.243414
   adult-4a.dst      0.2599
   adult-5a.dst      0.159936
   adult-6a.dst      0.0901603
   adult-7a.dst      0.211704
   adult-8a.dst      0.302583
   adult-a.dst       0.371348

===========
.DST FORMAT
===========

The .dst file format is very simple: comma delimited lines of text.

Lines that start with "A" describe a variable, whose id number is the
second field in the line. The third field in the line is either 101 (if the
variable is a class label) or 1 (if the variable is not). For this
benchmark, all you need to use is that variable id 1000 is the class
label, while variable ids from 1001 to 1123 are input attributes.

Lines that start with "C" indicate the start of a new training example. The
rest of the line identifies the training example.

Lines that start with "V" are attributes of the current example. The second
field is the variable id (see "A" lines above), and the third field is the
value of the variable. If a variable is not specified by a "V" line, its
value defaults to 0. 

For example, in this benchmark, if an example has a line that says 

    V,1000,0

it means that the example has a negative label. If the following line
appears:

    V,1015,1

it means that input attribute #15 is true (1). If no such line appears
before the next "C" line, it means that input attribute #15 is false (0).

