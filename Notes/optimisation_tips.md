# Advice from Michael Allen
 on training neural networks; we covered much of this in the NN session but I think this is a nice way to summarise a good approach :
“It made me remember Francois Chollet's advice on how to 'optimise' a neural net very quickly. This is in his Bible on Python Deep Learning. I'm not sure if you want to cover it in HSMA at any point, but it is very simple advice that I always follow:

1.  Use Adam as the optimiser (it adapts learning speed as necessary; usually a learning rate of 0.01 is good - Adam will effectively make that the maximum learning rate applied)
2.  Use ReLU as the activation function throughout until the end (then use sigmoid for binary classification, or SOFTMAX for 3+ classes)
3.  Start with no Dropout or early stopping (or any other regularisation)
4.  Increase the size of the net (nodes per layer and/or layers) until the model clearly over-fits training data  (can often approach 100% training accuracy). At this point the model is able to cope with all the complexity in the data.

Now you have an over-fitting model it is time to 'regularise' in some way to reduce the over-fitting. Usually using Dropout (usually 0.5) and early stopping is enough (and they are the two methods Chollet recommends)

Job done :slightly_smiling_face:

A nice description of Dropout I saw is that you are effectively training an ensemble of models within the same larger network structure. The when you make predictions (which don't use Dropout) you are effectively getting the average of all those different models.”