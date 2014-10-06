% n = [-75:75] + 0.00000001;
% h1 = 2*cos(0.125*pi*n).*sin(0.125*pi*n)./(pi*n);
% h2 = (1/(100*10^(1/10)))*2*cos(0.5*pi*n).*sin(0.2*pi*n)./(pi*n);
% h3 = 2*cos(0.875*pi*n).*sin(0.125*pi*n)./(pi*n);
% h = h1+h2+h3;
% 
% win = hamming(151)';
% hw = win.*h;
% %fvtool(h)
% fvtool(hw)

%d = 0-2*cos(0.5*pi*n).*sin(0.25*pi*n)./(pi*n)+.01*2*cos(0.5*pi*n).*sin(0.2*pi*n)./(pi*n);
%fvtool(d)

% Parks McCellelen
F=[0 0.25 0.27 0.28 0.3  0.7 0.72 0.73 0.75 1];
    
A=[1 1 0 0 (1/(100000*10^(1/10))) (1/(100000*10^(1/10))) 0 0 1 1];

W=[10 80 1000 100 80];

hf=firpm(170,F,A,W);
fvtool(hf)
