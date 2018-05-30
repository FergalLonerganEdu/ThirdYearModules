num3 = conv([0.25 0.25 0], [0.0009483 0.08987 0.0581 .3135 0]);
den3 = [.000002991 -.1943 -.1151 -.2301 1];
format long
[r,p,k] = residue(num3,den3)
r(2)
r(3)
r(4)
abs(r(2:3))
angle(r(2:3))

abs(p(2:3))
angle(p(2:3))

%part ii

%get the fourier transform of the input, x(n)
f = [0 0.25 0.25 zeros(1,4)];
FF = fft(f)/9;
FF(1)

for n=2:7
    2*FF(n)
end

%polynomials for transfer function of the system
num4 = [0.0001 0.0024 0.0013 0];
den4 = [-0.5917 2.1157 -2.501 1];

%frequencies to be evaluated
omega = [0:3]*((2*pi)/7);

%evaluate transfer function at these points
H_omega = polyval(num4,exp(-i*omega))./polyval(den4,exp(-i*omega))


