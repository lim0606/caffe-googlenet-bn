# caffe-googlenet-bn

This model is a re-implementation of [Batch Normalization](http://arxiv.org/abs/1502.03167) publication, and the model is trained with [a customized caffe](https://github.com/lim0606/caffe); however, the modifications are minor. Thus, you can run this with the currently available official caffe version, including cudnn v4 support and multigpu support.  

The network definition and solver prototxt files are modified from https://github.com/BVLC/caffe/tree/master/models/bvlc_googlenet 

Notes:
- training with random crop;
- training without any data-augmentation except random crop;
- uses "xavier" to initialize the weights;
- training with real-time shuffle with a modified [data_reader.cpp](https://github.com/lim0606/caffe/blob/master/src/caffe/data_reader.cpp);
- ~~batch normalization layer is modified version of https://github.com/ChenglongChen/batch_normalization. The modified bn layer supports batch normalization for inference. (See [neuron_layers.hpp](https://github.com/lim0606/caffe-dev/blob/master/include/caffe/neuron_layers.hpp), [bn_layer.cpp](https://github.com/lim0606/caffe-dev/blob/master/src/caffe/layers/bn_layer.cpp), and [bn_layer.cu](https://github.com/lim0606/caffe-dev/blob/master/src/caffe/layers/bn_layer.cu))~~
- the official batch normalization layer is used and the usage of it is adopted from https://github.com/KaimingHe/deep-residual-networks.
- use [test_bn.cpp](https://github.com/lim0606/caffe/blob/master/tools/test_bn.cpp) and [predict_bn.cpp](https://github.com/lim0606/caffe/blob/master/tools/predict_bn.cpp) for inference. 
- use a mini-batch of 64 on 2 GPUs, i.e. 32 per GPU
- use ILSVRC2015 labels, instead of 12' label.
- Data (images) are resized with 256 x 256 [convert_imageset.cpp](https://github.com/lim0606/caffe/blob/master/tools/convert_imageset.cpp).

The uploaded caffemodel is the snapshot of 1,200,000 iteration (30 epochs) using solver_stepsize_6400.prototxt

The uploaded model achieves a top-1 accuracy 72.05% (27.95% error) and a top-5 accuracy 90.87% (9.13% error) on the validation set, using a single center crop.

Thank John Lee for helping me training this model. 


# Tips for performance 

1. Real-time data shuffling is important
2. Data augmentation during training should improve the accuracy.
3. Change interpolation method (default is bilinear) of opencv to bicubic when you convert image will give you minor improvement.   

# To-do

1. Data augmentation

# References

[1] http://arxiv.org/abs/1409.4842

[2] http://arxiv.org/abs/1502.03167


## License

This model is released for unrestricted use.

