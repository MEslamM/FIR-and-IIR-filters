[song,fs]=audioread("s4.wav");
f=0:1:100;
f2=0:1:22050;
a=1;
fremoved = 60;

L=1001;%1001 101 501 2001
n=-L/2:1:L/2;

F1=700;
W1=2*pi*F1;
F2=900;
W2=2*pi*F2;

T=( 2.*sin(W1.*n).*(F1).*( 1./(n.*W1) ) )-(2.*sin(W2.*n).*(F2).*(1./(n.*W2)));

h=[1, T ,1]; % Calculated in Analytic impulse response

load("FIR_T2_1.mat");

filteredSong = filter(h,1,FIR_T2);
sound(filteredSong,fs);

H=freqz(h,a,f,fs); % response
plot(f,20*log10(abs(H)));

H=freqz(h,a,f2,fs);
plot(f2, 20*log10(abs(H)) );