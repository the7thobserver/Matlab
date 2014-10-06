% Jared Leung
% UC Irvine
% 1/23/2014

% Method 1 - Hamming Window
x = 60;
n=[-x:x] + 0.0000000001;
delta = [zeros(1,x) 1 zeros(1,x)];

hlp = 1.1 * sin(0.265 * pi*n)./(pi*n);
hhp = delta - (sin(0.72499 * pi * n) ./ (pi*n));
h = hlp + hhp;

win=hamming(2*x + 1)';
hw = h .* win;

fvtool(hw);

% Method 2 - Parks-McClellan Algorithm
% filter length
length = 90;
% Cut off frequencies
F = [0, 0.25, 0.3, 0.7, 0.75, 1];
% Amplitude
A = [1, 1, 0,0,1,1];
% Weights
W = [50, 50, 50];

hf = firpm(length, F, A, W);

fvtool(hf)
% Draw lines
hold on
plot([0,.25],[1.1,1.1], 'r');
plot([0,.25],[-1,-1], 'r');
plot([.3,.7],[-40,-40], 'r');
plot([.75,1],[0.1,0.1], 'r');
plot([.75,1],[-0.1,-0.1], 'r');
plot([0.3,0.3],[0,-100], 'r');
plot([0.7,0.7],[0,-100], 'r');
hold off
