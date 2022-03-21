clear
clc
load("IIR_T3_1.mat");
RHO=0.75;
outer=RemoveHum(IIR_T3,0,RHO);

function outer= RemoveHum(X,W0,RHO)

fs=48000;
f=0:1:fs/2;
W0=60;
b=[1,-2.*cos(W0),1];
a=[1,-2.*RHO.*cos(W0),power(RHO,2)];
h=freqz(b,a,f,fs);

figure
plot(f,abs(h));
outer=filter(b,a,X);
highpass(outer,80000,fs);
sound(outer,fs);

figure
plot(abs(fft(outer)));

end