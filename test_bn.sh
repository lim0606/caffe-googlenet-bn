#!/bin/bash

CAFFE_ROOT=/home/jaehyun/github/caffe-dev

$CAFFE_ROOT/build/tools/test_bn -train_model train_val_inception_bn.prototxt -test_model train_val_inception_bn.prototxt -weights snapshots/inception_bn_solver_stepsize_6400_iter_1200000.caffemodel -train_iterations 1000 -gpu 0
