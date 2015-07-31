# caffe-googlenet-bn

This model is a re-implementation of [Batch Normalization](http://arxiv.org/abs/1502.03167) publication, and the model is trained with [a customized caffe-dev](https://github.com/lim0606/caffe-dev). 

The network definition and solver prototxt files are modified from https://github.com/BVLC/caffe/tree/master/models/bvlc_googlenet 

Notes:
- training with random crop;
- training without any data-augmentation except random crop;
- uses "xavier" to initialize the weights;
- training with real-time shuffle with a modified [data_layer.cpp](https://github.com/lim0606/caffe-dev/blob/master/src/caffe/layers/data_layer.cpp);
- batch normalization layer is modified version of https://github.com/ChenglongChen/batch_normalization. The modified bn layer supports batch normalization for inference. (See [neuron_layers.hpp](https://github.com/lim0606/caffe-dev/blob/master/include/caffe/neuron_layers.hpp), [bn_layer.cpp](https://github.com/lim0606/caffe-dev/blob/master/src/caffe/layers/bn_layer.cpp), and [bn_layer.cu](https://github.com/lim0606/caffe-dev/blob/master/src/caffe/layers/bn_layer.cu))
- use [test_bn.cpp](https://github.com/lim0606/caffe-dev/blob/master/tools/test_bn.cpp) and [predict_bn.cpp](https://github.com/lim0606/caffe-dev/blob/master/tools/predict_bn.cpp) for inference. 

The uploaded caffemodel is the snapshot of 1,200,000 iteration (30 epochs) using solver_stepsize_6400.prototxt

The uploaded model achieves a top-1 accuracy 71.64% (28.36% error) and a top-5 accuracy 90.83% (9.17% error) on the validation set, using a single random crop.

Thank John Lee for helping me training this model. 

# Refs
[1] http://arxiv.org/abs/1409.4842

[2] http://arxiv.org/abs/1502.03167


## License

This model is released for unrestricted use.

