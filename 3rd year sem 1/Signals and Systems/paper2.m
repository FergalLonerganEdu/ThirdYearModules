%find phase

N = (1024^2)*4;
dt = 1/N;

t = [0:(3E-3)*dt:3E-3 - dt];

f0 = sin(2*pi*1000*t);
f1 = sin(2*pi*2000*t);

f=[f0 f1 f0 f1];
t = (0:length(f)-1)*((12E-3)/length(f));

%c_0 = FF(1);
%Alpha = 2*real(FF(2:4));
%Beta = 2*imag(FF(2:4));



plot([t t+3E-3],[f0 f1]);

FF = fft([f0 f1])/(N*2);

plot((0:99)/(6E-3),abs(FF(1:100)))

commandwindow
 D=[1 0.2*2000*pi (2000*pi)^2];
 N = [1256 0];

inputs = [1000 1500 2000];
abs(polyval(N,1i*2*pi*inputs)./polyval(D, 1i*2*pi*inputs))

hz = (0:3000);
plot(hz,abs(polyval(N,1i*2*pi*hz)./polyval(D, 1i*2*pi*hz)))

H=tf(N,D);


t = [0:(3E-3)*dt:12E-3 - dt];

f0 = sin(2*pi*1000*t(1:floor(end/4)));
f1 = sin(2*pi*2000.*(t(ceil(end/4):floor(end/2))));
lsim(H,[f0 f1 f0 f1],t)


