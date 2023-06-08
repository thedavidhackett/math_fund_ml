% deblurring
clear 
%close all

rng(0) % initialize random seed

n = 500;
k = 30;
sigma = 0.01;

% generate random piecewise constant signal
w = zeros(n,1);
w(1) = randn;
for i=2:n
    if (rand < .95)
        w(i) = w(i-1);
    else
        w(i) = randn;
    end
end
    
% generate k-point averaging function
h = ones(1,k)/k;

% make X matrix for blurring 
m = n+k-1;
for i=1:m
    if i<=k
        X(i,1:i) = h(1:i);
    else
        X(i,i-k+1:i) = h;
    end
end
X = X(:,1:n);

% blurred signal + noise
y = X*w+sigma*randn(m,1);

% plot
figure(1)
subplot(211)
plot([w])
title('signal')

subplot(212)
plot(y(1:n))
axis('tight')
title('blurred and noisy version')


