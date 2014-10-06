x = 63;
n = [-x:x]+0.000001;
delta=[zeros(1,x),1,zeros(1,x)];

hlp=((10^(1/20)))*sin(0.25*pi*n)./(pi*n);
hbp=2*cos(0.5*pi*n).*(sin(0.2*pi*n)./(pi*n));
hhp=(10^(3/20) * (delta-sin(0.75*pi*n)./(pi*n)));

h = hlp+hbp+hhp;

hw = h .* hamming(2*x+1)';
fvtool(hw);

% %FIR
q=100000000;
n = [-q:q] + 0.00000001;
delta = [zeros(1,q) 1 zeros(1,q)];


hlp = sin(0.25*pi*n)./(pi*n);
hhp = delta - (sin(0.75*pi*n)./(pi*n));

h = hlp + hhp;

win=hamming(2*q + 1)';
hw = h .* win;

fvtool(hw);

%PM
% Method 2 - Parks-McClellan Algorithm
[N,Fo,Ao,W] = firpmord(F,A,DEV,Fs)
N - order
Fo - normalized frequency - [0.25 0.3 0.7 0.75]
Ao = band magnitudes - [1 0 3]
W = weights - [0.01, 0.01, 0.01]


F = vector of cutoff frequencies - do not count 0 or 1
A = desired amplitudes
DEV = maximum deviation of ripples

% filter length
length = 90;
% Cut off frequencies
F = [0, 0.25, 0.3, 0.7, 0.75, 1];
% Amplitude - solve 20 log base 10 of A[i]
A = [1, 1, 0,0,1,1];
% Weights on each 2 points
W = [50, 50, 50];

hf = firpm(length, F, A, W);

fvtool(hf)

%IIR

[N,w] = ellipord(0.25,0.31,1,40);
[b1, a1] = ellip(N, 1, 40, 0.25, 'low');
[N, w] = ellipord(0.75, 0.7, 1, 40);
[b2,a2]=ellip(N,1,30,0.75,'high');
b11 = conv(a2, b1);
b22 = conv(a1, b2);
a = conv(a1, a2);

b = b11+ b22;

fvtool(b,a);