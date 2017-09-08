clc, clear

% Generate signal
f = 440; % Singal Frequency
Fs = 44000; % F-sampling Hz. Sample Rate
T = 1; % Seconds
t = 1/Fs:1/Fs:T; % Time
A = 1; % Amplitude
S = A * cos(2 * pi * f * t); % Signal right here

% Play back the signal
player = audioplayer(S,Fs)
play(player)