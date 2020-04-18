%余鎮宏
%B41052023

echo on
n=[-20:1:20];
x=.5*(sinc(n/2)).^2;
ts=1/40;
t=[-.5*ts:1.5];
fs=1/ts;
h=[zeros(1,20),t(21:61),zeros(1.20)];
H=fft(h)/fs;
df=fs/80;
f=[0:df:fs]-fs/2;
H1=fftshift(H);
Y=X.*H1(21:61);
pause
stem(n,abs(x))
puse
stem(n,abs(y))