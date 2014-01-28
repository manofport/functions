function [pred, prob,Theta1,Theta2] = mainNNProbabilities(X,y,input_layer_size,hidden_layer_size,num_labels,iterations,lambda)

if nargin() == 0
    fprintf('Expecting: X,y,input_layer_size,hidden_layer_size,num_labels,iterations,lambda.\n');
    return;
endif

%% Setup the parameters you will use for this exercise
%input_layer_size  = 400;  % 20x20 Input Images of Digits
%hidden_layer_size = 25;   % 25 hidden units
%num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

m = size(X, 1);

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =================== Part 8: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', iterations);


% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunctionProbabilities(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

warning('off', 'Octave:possible-matlab-short-circuit-operator');
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

warning('on', 'Octave:possible-matlab-short-circuit-operator');

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');

%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

[pred, prob] = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


