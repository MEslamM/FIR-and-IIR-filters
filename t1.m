clear
clc

[song,fs]=audioread("s4.wav");

f=0:1:100;
f2=0:1:22050;
a=1;
fremoved = 60;
Wo = ((fremoved)/(fs))*2*pi;

h=[1, -2*cos(Wo) ,1]; % Calculated in Analytic impulse response

load("FIR_T1.mat");

filteredSong = filter(h,1,FIR_T1);
sound(filteredSong,fs);

H=freqz(h,a,f,fs); % response
plot(f,20*log10(abs(H)));

H=freqz(h,a,f2,fs);
plot(f2, 20*log10(abs(H)) );
