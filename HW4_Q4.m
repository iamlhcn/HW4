%%%%%%% discretization error %%%%%%%%


y0 = -10^-5;
h = 0.2;

t(1) = h;
y(1) = y0;


% for n = 1:20
%     t(n+1) = t(n) + h;
%     y(n+1) = y(n) + ((h*exp( y(n) - t(n) ) )/( 1 - h*exp( y(n)- t(n+1) )));   
% end

for n = 1:20
    t(n+1) = t(n) + h;
    y(n+1) = y(n) + h*exp(y(n)- t(n+1));   
end


m = 0:20;
plot(m,y, 'r', 'LineWidth', 2)

%%%%% Exact %%%%%%%%
hold on
f = inline('-log( exp(10^-5) + exp(-x) -1 )', 'x');
x = 0:20;
AA = feval(f,0:20);
plot(x,AA, 'LineWidth', 2)

legend('Fully Implicit', 'Exact')
title('Fully Implicit , h = 0.2, y_0 = -10^{-5}')














