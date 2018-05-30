[y,fs,bits]=wavread('CorruptedAudio.wav');
t = [0: 1/fs :length(y)/fs-1/fs];
plot(t,y)
xlabel Time(seconds)
ylabel Amplitude
L=length(y);
FF=fft(y);
FF=abs(FF)/fs;

P1 = FF(1:length(y)/2+1);
f = fs*(0:(L/2))/L;
xlabel Frequency(Hz)
ylabel Magnitude
hold on
plot(f,P1)


%Question 5
x= 1*(800*pi).^2
x1=4*800*pi
top = [1 0 x]
bottom = [1 x1 x]
w = [0:0.0001:4]*10000;

H = polyval(top,1i*w)./polyval(bottom,1i*w);
plot(w/(2*pi),abs(H))
xlabel Frequency(Hz)
ylabel Magnitude

%Question 6
H=tf(top.*10,bottom)
t = [0: 1/fs :length(y)/fs-1/fs];
y=lsim(H,y,t)
plot(t,y);
xlabel Time(seconds)
ylabel Amplitude
title 'Filtered Audio in Time domain Gain 10'

L=length(y);
FF=fft(y);
FF=abs(FF)/fs;

P1 = FF(1:length(y)/2+1);
f = fs*(0:(L/2))/L;

hold off
plot(f,P1)
xlabel Frequency(Hz)
ylabel Magnitude