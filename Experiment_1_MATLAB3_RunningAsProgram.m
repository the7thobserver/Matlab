%Author* Nicholas Bennett
%Matlab3 Assignment

% To load data files containing test data
%load('C:\Users\Nick\Desktop\Matlab3_LabFile\lab3data.mat')
N = 5;
numSamples = 1000000;
mu = 0.0000005;
% initialize everything
% -------------------------------------------------------------------------
%h = [ 1 0 0 0 0 ]; % test with filter w/ 5-taps


inSig = voice + 100*fref;
refSig = ref*100;


 % use LMSfilter(ref, voice, 5, u)
 
 % set up mixed signal combining voice and amplified noise
  
 errSig = zeros([numSamples,1]);              %Creates 1 column, 1,000,000 rows 
 inBuffer = zeros([1,N]);                  %Creates a 1 row, N columns
 h = zeros([1,N]);                           %Creates a 1 row, N columns 
 %h(1,1) = 1;                               %Initializes the first element of h to 1 
                    
 for i = 1:numSamples,                        %For 1 million samples, run the adaptive filter algorithm
     
     %s = x(i,1) + d(i,1);  
     %x = refSig(i,1);                      %Temp storage for the next reference signal sample
     inBuffer(1) = refSig(i,1);                       %Take the current input sample
     e = inSig(i,1) - dot(h,inBuffer);               %Calculate error as   
     errSig(i,1) = e;                      %Store present error value in memory to output later
     
     %Recalculate the filter coefficients using LMS
     h = h + (mu*errSig(i).*inBuffer);
     
     
     inBuffer = circshift(inBuffer, [0,1]);  %Shift input buffer to the right, shifting out the oldest value
    % inBuffer(1,1) = refSig(i,1);                %Store the most recent inputSample
 end
% end of function  
plot(errSig)

