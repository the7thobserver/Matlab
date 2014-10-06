% LMS Algorithm
function error = anc(signal, noise, filterLength, mu)
    % Number of samples the filter goes over, in this case the entire signal
    N = length(signal);                     
    % Create delay, adaptive, and error vectors
    delayed = zeros(1,filterLength);
    h = zeros(1,filterLength);
    error = zeros(1, N);

    % Loop over the samples
    for i = 1:N
        % Input the current value
        delayed(1) = noise(i);
        % Multiple the delay vector with the transpose of the adaptive
        % vector to get a value
        z =  delayed * h';
        % Subtract it against the signal to get the error
        error(i) = signal(i) - z;
        % Update the adaptive vector
        h = h + mu * error(i) .* delayed;
        % Shift the delayed vector to the right once
        delayed(2:filterLength) = delayed(1:filterLength-1);
    end
end