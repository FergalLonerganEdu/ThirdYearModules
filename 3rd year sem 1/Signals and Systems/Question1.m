%Part i

T = 1; %period is one
N = (2048); %big ass N
step = T/N;
t1 = [-0.2:step:0]; %from -0.2 to 0
t2 = [0:step:0.8-step]; %from 0 to 0.8
t3 = [0:step:1-step]; %one whole period starting at 0
f1 = ones(1,length(t1)).*-1;    %from -0.2 to 0 the function is -1
f2 = ((13.75).*t2)-1;       %from 0 to 0.8 le function is this
f3 = [f2 f1];       %the function over one period staring at t=0

t4 = [t3 t3+1 t3+2];    %three periods
f4 = [f3 f3 f3];        %signal over three periods

figure
hold on
plot(t4, f4,'.');       %plot them without joining up the points at 0.8
hold off


%Part ii
%function has discontinuities at t = 0.8+nT
%Suitable value for N??
N2 = 2048^2;

%Find first 8 non zero Fourier coeffs
%Need to change your signal so that it starts at t=0
tstep = 1/N2;
tplus = [0:tstep: 0.8-tstep];
fplus = -1 + ((11/0.8)*tplus);
tminus = [0.8:tstep:1-tstep];
fminus = -ones(1, length(tminus));
ffour = [fplus fminus];
tfour = [tplus tminus];

FF = fft(ffour)/N2;

figure
hold on
plot([0:12],abs(FF(1:13)), 'o') 
xlabel('Coeffiecient Number')
ylabel('Coefficient Value')
title('Fourier Coefficients')
hold off

for n =1:13
   FF(n) 
end