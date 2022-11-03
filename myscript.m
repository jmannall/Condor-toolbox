
clc;
clear;
close all;

addpath('/mnt/fast/nobackup/users/jm01527/scripts')

HelloWorld()
func = @(x)XORNeuralNetwork(x);
NeuralNetwork(func)

