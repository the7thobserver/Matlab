h = fir1(60,0.1);
n = [1:length(h)]; 
fvtool(h);
fvtool(cos(2*pi*n/5));
fvtool(cos(n));
h=h.*cos(2*pi*n/5);
fvtool(h);
fvtool(sin(n));

% n = [-75:75] + 0.00000001;.
% delta = [zeros(1,75) 1 zeros(1,75)];
% 
% hlp = sin(0.265*pi*n)./(pi*n);
% hhp = delta - (sin(0.73*pi*n)./(pi*n));
% 
% h = hlp + hhp;
% 
% win=hamming(2*75 + 1)';
% hw = h .* win;
% 
% fvtool(hw);
% % 
% % Method 2 - Parks-McClellan Algorithm
% % filter length
% % length = 90;
% % Cut off frequencies
% F = [0, 0.25, 0.3, 0.7, 0.75, 1];
% % Amplitude - solve 20 log base 10 of A[i]
% A = [1, 1, 0,0,10,10];
% % Weights on each 2 points
% W = [50, 50, 50];
% 
% hf = firpm(length, F, A, W);
% 
% fvtool(hf)
% 
% %butter, cheb, cehb2, ellip
% 
% % NOTE: Rs must be positive
% 
% % Ellip
% %[N, Wp] = ellipord(Wp, Ws, Rp, Rs);
% %[B,A] = ellip(N,Rp,Rs,Wp, 'high/low,stop')
% 
% % [N,w] = ellipord(0.25,0.31,1,40);
% % [b1, a1] = ellip(N, 1, 40, 0.25, 'low');
% % [N, w] = ellipord(0.75, 0.7, 1, 40);
% % [b2,a2]=ellip(N,1,30,0.75,'high');
% % 
% % Butter
% % [N, Wn] = buttord(Wp, Ws, Rp, Rs)
% % butter(N,Wn,'high')
% % [N, w] = buttord(0.25, 0.31,1,40);
% % [b1, a1] = butter(N,0.25, 'low');
% % [N, w] = buttord(0.75, 0.7, 1, 40);
% % [b2,a2]=butter(N,0.75,'high');
% % 
% % Cheby
% % [B,A] = cheby1(N,Rp,Wp)
% % [N, Wp] = cheb1ord(Wp, Ws, Rp, Rs)
% % [N, w] = cheb1ord(0.25, 0.31,1,40);
% % [b1, a1] = cheby1(N,1, 0.25, 'low');
% % [N, w] = cheb1ord(0.75, 0.7, 1, 40);
% % [b2,a2]=cheby1(N,1,0.75,'high');
% % 
% % Cheby2
% % [N, Wp] = cheb1ord(Wp, Ws, Rp, Rs)
% % [B,A] = cheby2(N,Rs,Wst)
% % [N, w] = cheb2ord(0.25, 0.31,1,40);
% % [b1, a1] = cheby2(N,40, 0.31, 'low');
% % [N, w] = cheb2ord(0.75, 0.7, 1, 40);
% % [b2,a2]=cheby2(N,40,0.7,'high');
% 
% b11 = conv(a2, b1);
% b22 = conv(a1, b2);
% a = conv(a1, a2);
% 
% b = b11+ b22;
% 
% fvtool(b,a);
% 
% Quanitization - round a, b
% aq = round(a * 100) / 100;
% bq = round(b * 100) / 100;
% 
% % Second Order Systems
% % Matrix SOS with gain G - each row is a SOS with b's first 
% % SOS = [ b01 b11 b21  1 a11 a21 
% %                 b02 b12 b22  1 a12 a22
% %                 ...
% %                 b0L b1L b2L  1 a1L a2L ]
% [sos,g]=tf2sos(b,a);
% See more robust design wrt quanitization
% sosq = round(sos * 100) / 100;
% gq = 0.030; % Quanititize GQ 
% [bq,aq]=sos2tf(sosq,gq);
% 
