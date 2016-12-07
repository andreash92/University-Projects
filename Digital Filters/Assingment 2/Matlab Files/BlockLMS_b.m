% implementation of Block-LMS algorithm with 1 loop and Matrix multiplications

clear all
close all
tic     % start timer

% initialize
M = 3000;   % set filter factors
L = M;      % set lenght L = M
s2d = 0.27; % variance
n = 1.2e6;  % set step
mu = 0.0005;
kmax = floor(n/L);    % set the max Block index
    

% allocate
average_J = zeros(kmax-1);  % Average errors for Graph
u = zeros(n,1);
w = zeros(M,1);
y = zeros(n,1);
e = zeros(n,1);
J = zeros(n,1);

% adding noise
v = sqrt(s2d)*randn(n,1); % Add gaussian noise 
v = v - mean(v);
u(1) = v(1);
for i=2:n
    u(i) = (-0.18*u(i-1))+v(i); % noisy signal
end

d = plant(u')';


for k=1:kmax-1
    f = zeros(M,1);
    u_pair = zeros(M,M);

    % Read/Generate a new data pair (u,d)
    for m=0:M-1
        u_pair(m+1,:) = u((k*M)+m:-1:((k*M)+m-M+1));
    end
    d_pair = d(k*M:1:(k+1)*M-1);


    y = u_pair*w;     % filter output
    e = d_pair-y;     % output error
    f = mu*u_pair'*e;   % accumulate
    w = w+f;

    average_J(k) = sum(e.*e)/M;

end     

toc     % stop timer


% generate figure
figure(2)
semilogy(average_J);
xlabel('k (Block Iterations)')
ylabel('Ee^{2}(n)');
legend({sprintf('mu=%f',mu)});
title('Learning curves - Implementation B');


