N = 1024^2;
dt = pi/N;

t=[0:dt:pi-dt];
f = cos(t);
FF = fft(f)/N;


% frequency spectrum of transfer function

N = 1;
D = [1 3.236 5.2359 5.2359 3.236 1];
H=tf(N,D);
bode(H)

freq = (0:1/2048:2);

f = 1./polyval(D,1i*freq*2*pi);
plot(freq,abs(f));
f = 1./polyval(D,i*4*pi)

[R P K] = residue(N,[D 0])

%Q3 z stuff

N = [-0.333 2/3];
D=[0.0741 -0.1111 0.6667 1]

[R P K] = residue(N,D)

%ccheck out example 8.1


