clear all;
clc;

% Get the sample array
[audio, fs] = audioread('pianoC.mp3');
plot(audio);
