import nn

class PerceptronModel(object):
    def __init__(self, dimensions):
        """
        Initialize a new Perceptron instance.

        A perceptron classifies data points as either belonging to a particular
        class (+1) or not (-1). `dimensions` is the dimensionality of the data.
        For example, dimensions=2 would mean that the perceptron must classify
        2D points.
        """
        self.w = nn.Parameter(1, dimensions)

    def get_weights(self):
        """
        Return a Parameter instance with the current weights of the perceptron.
        """
        return self.w

    def run(self, x):
        """
        Calculates the score assigned by the perceptron to a data point x.

        Inputs:
            x: a node with shape (1 x dimensions)
        Returns: a node containing a single number (the score)
        """
        "*** YOUR CODE HERE ***"
        return nn.DotProduct(self.w, x)

    def get_prediction(self, x):
        """
        Calculates the predicted class for a single data point `x`.

        Returns: 1 or -1
        """
        "*** YOUR CODE HERE ***"
        node = self.run(x)
        value = nn.as_scalar(node)
        if value >= 0:
            return 1
        else:
            return -1
    def train(self, dataset):
        """
        Train the perceptron until convergence.
        """
        "*** YOUR CODE HERE ***"
        
        
        # iterate and get the predicted data
        for x, y in dataset.iterate_once(batch_size=1):
            #if the prediction is not match, the parameter will be updated
            if nn.as_scalar(y) != self.get_prediction(x):
                self.w.update(nn.as_scalar(y),x)
                self.train(dataset)

                    
       
           
              
class RegressionModel(object):
    """
    A neural network model for approximating a function that maps from real
    numbers to real numbers. The network should be sufficiently large to be able
    to approximate sin(x) on the interval [-2pi, 2pi] to reasonable precision.
    """
                  
class RegressionModel(object):
    """
    A neural network model for approximating a function that maps from real
    numbers to real numbers. The network should be sufficiently large to be able
    to approximate sin(x) on the interval [-2pi, 2pi] to reasonable precision.
    """
    def __init__(self):
        # Initialize your model parameters here
        "*** YOUR CODE HERE ***"
        self.w1 = nn.Parameter(1, 35)
        self.w2 = nn.Parameter(35, 1)
        self.b1 = nn.Parameter(1,35)
        self.b2 = nn.Parameter(1,1)
        self.batch_size = 1
        # the learning rate we choose is 0.003  
        self.learningRate = 0.003

    def run(self, x):
        """
        Runs the model for a batch of examples.
        Inputs:
            x: a node with shape (batch_size x 1)
        Returns:
            A node with shape (batch_size x 1) containing predicted y-values
        """
        "*** YOUR CODE HERE ***"
        # mapping an iuput row vector x to an output vector f(x)
        # the function is f(x) = relu(x * W1 + b1)*W2+b2
        xw1 = nn.Linear(x, self.w1)
        predicted_y1 = nn.AddBias(xw1, self.b1)
        reLU = nn.ReLU(predicted_y1)
        xw2 = nn.Linear(reLU, self.w2)
        predicted_y2 = nn.AddBias(xw2, self.b2)
        return predicted_y2
       

       

    def get_loss(self, x, y):
        """
        Computes the loss for a batch of examples.
        Inputs:
            x: a node with shape (batch_size x 1)
            y: a node with shape (batch_size x 1), containing the true y-values
                to be used for training
        Returns: a loss node
        """
        "*** YOUR CODE HERE ***"
        return (nn.SquareLoss(self.run(x),y))
    
    def train(self, dataset):
        """
        Trains the model.
        """
        "*** YOUR CODE HERE ***"
        
        lossValue = inf
        # set a thershold of loss no more than 0.02
        while lossValue >= 0.01:
            for x, y in dataset.iterate_once(self.batch_size):
                # calculate the gradients
                grad_w1,grad_b1,grad_w2,grad_b2 = nn.gradients([self.w1,self.b1,self.w2,self.b2],self.get_loss(x,y))
                # update the weights and bias
                self.w1.update(-self.learningRate, grad_w1)
                self.b1.update(-self.learningRate, grad_b1)
                self.w2.update(-self.learningRate, grad_w2)
                self.b2.update(-self.learningRate, grad_b2)
                lossValue = nn.as_scalar(self.get_loss(x,y)) 

class DigitClassificationModel(object):
    """
    A model for handwritten digit classification using the MNIST dataset.

    Each handwritten digit is a 28x28 pixel grayscale image, which is flattened
    into a 784-dimensional vector for the purposes of this model. Each entry in
    the vector is a floating point number between 0 and 1.

    The goal is to sort each digit into one of 10 classes (number 0 through 9).

    (See RegressionModel for more information about the APIs of different
    methods here. We recommend that you implement the RegressionModel before
    working on this part of the project.)
    """
    def __init__(self):
        # Initialize your model parameters here
        "*** YOUR CODE HERE ***"
        self.w1 = nn.Parameter(784, 85)
        self.w2 = nn.Parameter(85, 35)
        self.w3 = nn.Parameter(35, 10)
        self.b1 = nn.Parameter(1,85)
        self.b2 = nn.Parameter(1,35)
        self.b3 = nn.Parameter(1,10)
        
        self.batch_size = 150
        self.learningRate = 0.25
    def run(self, x):
        """
        Runs the model for a batch of examples.

        Your model should predict a node with shape (batch_size x 10),
        containing scores. Higher scores correspond to greater probability of
        the image belonging to a particular class.

        Inputs:
            x: a node with shape (batch_size x 784)
        Output:
            A node with shape (batch_size x 10) containing predicted scores
                (also called logits)
        """
        "*** YOUR CODE HERE ***"
        # the given function is: f(x) = relu( relu(x * W1 + b1) * W2 + b2) * W3 + b3
        # first layer and the function is: L1 = relu(x * W1 + b1)
        xw1 = nn.Linear(x, self.w1)
        predicted_y1 = nn.AddBias(xw1, self.b1)
        reLU1 = nn.ReLU(predicted_y1)
        # second layer
        xw2 = nn.Linear(reLU1, self.w2)
        predicted_y2 = nn.AddBias(xw2, self.b2)
        reLU2 = nn.ReLU(predicted_y2)
        # third layer
        xw3 = nn.Linear(reLU2, self.w3)
        predicted_y3 = nn.AddBias(xw3, self.b3)
        return predicted_y3

    def get_loss(self, x, y):
        """
        Computes the loss for a batch of examples.

        The correct labels `y` are represented as a node with shape
        (batch_size x 10). Each row is a one-hot vector encoding the correct
        digit class (0-9).

        Inputs:
            x: a node with shape (batch_size x 784)
            y: a node with shape (batch_size x 10)
        Returns: a loss node
        """
        "*** YOUR CODE HERE ***"
        return (nn.SoftmaxLoss(self.run(x),y))
    
    def train(self, dataset):
        """
        Trains the model.
        """
        "*** YOUR CODE HERE ***"
        accurancy = 0
        # set the threshold of accuracy 0.975 or higher
        while accurancy < 0.975:
            for x, y in dataset.iterate_once(self.batch_size):
                # calculate the gradients
                grad_w1,grad_b1,grad_w2,grad_b2,grad_w3,grad_b3 = nn.gradients([self.w1,self.b1,self.w2,self.b2, self.w3,self.b3],self.get_loss(x,y))
                # update the weights and bias
                self.w1.update(-self.learningRate, grad_w1)
                self.b1.update(-self.learningRate, grad_b1)
                self.w2.update(-self.learningRate, grad_w2)
                self.b2.update(-self.learningRate, grad_b2)
                self.w3.update(-self.learningRate, grad_w3)
                self.b3.update(-self.learningRate, grad_b3)
                accurancy = dataset.get_validation_accuracy()  
