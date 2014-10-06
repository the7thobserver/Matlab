format compact

% Filter design
stop = 50;

[N,w] = ellipord(0.25,0.31,0.95,stop);
N
[b1, a1] = ellip(N, 0.95, stop, 0.25);

stop2 = 41;

[N,w] = ellipord(0.75,0.7,0.08,stop2);
N
[b2,a2] = ellip(N,0.08,stop2, 0.75, 'high');

% fvtool(b1,a1)
% fvtool(b2,a2)

% conv same as multiplying two polynomials together
a = conv(a1, a2);
b12 = conv(b1, a2);
b21 = conv(b2, a1);

b = b12 + b21;
fvtool(b,a);

hold on
plot([0,.25],[1.1,1.1], 'r');
plot([0,.25],[-1,-1], 'r');
plot([.3,.7],[-40,-40], 'r');
plot([.75,1],[0.1,0.1], 'r');
plot([.75,1],[-0.1,-0.1], 'r');
plot([0.25,0.25],[0,-100],'r');
plot([0.75,0.75],[0,-100],'r');
plot([0.3,0.3],[0,-100], 'r');
plot([0.7,0.7],[0,-100], 'r');
hold off

% Quanitization
aq = round(a * 100) / 100;
bq = round(b * 100) / 100;
fvtool(bq,aq)

hold on
plot([0,.25],[1.1,1.1], 'r');
plot([0,.25],[-1,-1], 'r');
plot([.3,.7],[-40,-40], 'r');
plot([.75,1],[0.1,0.1], 'r');
plot([.75,1],[-0.1,-0.1], 'r');
plot([0.25,0.25],[0,-100],'r');
plot([0.75,0.75],[0,-100],'r');
plot([0.3,0.3],[0,-100], 'r');
plot([0.7,0.7],[0,-100], 'r');
hold off

% % Using second order systems
% [sos,g]=tf2sos(b,a);
% sosq = round(sos * 100) / 100;
% gq = 0.030;
% [bq,aq]=sos2tf(sosq,gq);
% fvtool(bq,aq)
% 
% hold on
% plot([0,.25],[1.1,1.1], 'r');
% plot([0,.25],[-1,-1], 'r');
% plot([.3,.7],[-40,-40], 'r');
% plot([.75,1],[0.1,0.1], 'r');
% plot([.75,1],[-0.1,-0.1], 'r');
% plot([0.25,0.25],[0,-100],'r');
% plot([0.75,0.75],[0,-100],'r');
% plot([0.3,0.3],[0,-100], 'r');
% plot([0.7,0.7],[0,-100], 'r');
% hold off