clear
clc

load("FIR_T2_1.mat");
fs=48000;
f=0:fs/length(FIR_T2):fs-(fs/length(FIR_T2));

plot(f,abs(fft(FIR_T2)))


