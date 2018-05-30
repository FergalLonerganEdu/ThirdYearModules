%Part i

num = [12040 600550];
den = [1 127.2 3657.4 209500 600550];

H2 = tf(num,den);

step = 0.001;
fplot = [0:step:30-step];

jomega = (i)*2*pi*fplot;                     %create a variable = i*omega

N = polyval(num,jomega);
D =  polyval(den, jomega);

H3 = N./D;                               %the transfer function = numerator/denominator

figure
hold on
plot(abs(jomega), abs(H3));                       %Plot the absolute value of the tranfer 
                                        %function over the frequencies in the 
                                        %spectrum of the signal
xlabel('Frequency (rads/sec)');
ylabel('Magnitude of Frequency Response');
title('Frequency Response of the Plotter')
hold off

%--------Part ii ----------

format long
d = [1 127.2 3657.4 209500];
[r,p,k] = residue(num, [den 0])

qs = [1 127.2 3657.4 209500];
[r2, p2, k2] = residue(qs, den)

%------Part iii -------------

omega = [0:3]*2*pi;

H4 = polyval (num,i*omega)./polyval(den,i*omega);
abs(H4)
angle(H4)

