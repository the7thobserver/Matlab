% LMS Algorithm
%function big_L = anc(signal, noise, length, mu)
%clear
load('lab3data.mat')

% n=(1:length(voice));
% x = sin(n);
% x = x';
% ref = x;
% fref = x * 10;

noise = 100*ref;
signal = voice + 100 * fref;

%N = length(signal);
N = 1000000 / 2;
filterLength = 5;
%    0.0000005
mu = 0.0001;
L = 10;
delayed = zeros(1,filterLength);
h = zeros(1,filterLength);
big_L = zeros(1, N);    %big_LSig
 
 for k = 1:N
     delayed(1) = noise(k);
     
     z =  delayed * h';
     
     big_L(k) = signal(k) - z;
     
     y = big_L(k) .* delayed;
     
     if(k - L > 1)
         y = y + big_L(k - L) .* delayed;
     end
     
     h = h + (mu / L) * y;
     
     delayed(2:filterLength) = delayed(1:filterLength-1);
 end
 
 plot(big_L)
 
% Generalized LMS Algorithm

% clear
% load('lab3data.mat')
% 
% noise = 5 * ref;
% signal = voice + 5 * fref;
% 
% %N = length(signal);
% N = 1000000 / 5;
% filterLength = 3;
% lambda = 0.9;
% delayed = zeros(1,filterLength);    %inBUffer
% h = zeros(1,filterLength);
% big_L = zeros(1, N);    %big_LSig
% 
%  for k = 1:N
%      delayed(1) = noise(k);
%      mu = 1 / (delayed * delayed');
%      
%      z =  delayed * h';
%      
%      big_L(k) = signal(k) - z;
%      h = h + lambda * mu * big_L(k) .* delayed;
%      delayed(2:filterLength) = delayed(1:filterLength-1);
%  end
%  
%  plot(big_L, 'r')
%  