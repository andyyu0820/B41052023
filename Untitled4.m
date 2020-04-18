%余鎮宏
%B41052023

echo on
t0=.15;
ts=0.001;
fc=250;
snr=20;
fs=1/ts;
df=0.3;
t=[0:ts:t0];
snr_lin=10^(snr/10);

m=[ones(1,t0/(3*ts)),-2*ones(1,t0/(3*ts)),zeros(1,t0/(3*ts)+1)];
c=cos(2*pi*fc.*t);
u=m.*c;
[M,m,df1]=fftseq(m,ts,df);
M=M/fs;
[U,u,df1]=fftseq(u,ts,df);
U=U/fs;
[C,c,df1]=fftseq(c,ts,df);
f=[0:df1:df1*(length(m)-1)]-fs/2;
signal_power=spower(u(1:length(t)));
noise_power=signal_power/snr_lin;
noise_std=sqrt(noise_power);
noise=noise_std*randn(1,length(u));
r=u+noise;
[R,r,df1]=fftseq(r,ts,df);
R=R/fs;
pause
singal_power
pause
clf
subplot(2,2,1)
plot(t,m(1:length(t)))
xlabel('Time')
title('The message signal')
pause
subplot(2,2,2)
plot(t,c(1:length(t)))
xlabel('Time')
title('The carrier')
pause
su
pause
