%%%%%%%%%%%%%%% Problem 3 %%%%%%%%%%%%%%%%%
h = 0.1;
m = 0:20;

%%%%%%% Explicit Euler method %%%%%%%%%%%
y_ex(1) = 1;

for n = 1:20
    y_ex(n+1) = (1 + j*h)*y_ex(n);
end

plot(m,abs(y_ex), 'LineWidth', 2)
hold on
%%%%%%%%%%%% 2nd Order Runge Kutta%%%%%%%%%%%

y_rk2(1) = 1;
for n = 1:20
    k1 = j*h*y_rk2(n);
    k2 = j*h*(y_rk2(n) + k1/2);
    y_rk2(n+1) = y_rk2(n) + k2;
end

plot(m,abs(y_rk2), 'r', 'LineWidth', 2)


%%%%%%%%%%%% 4th Order Runge Kutta%%%%%%%%%%%

y_rk4(1) = 1;
for n = 1:20
    k1 = j*y_rk4(n);
    k2 = j*(y_rk4(n) + k1*(h/2));
    k3 = j*(y_rk4(n) + k2*(h/2));
    k4 = j*(y_rk4(n) + k3*h);
    y_rk4(n+1) = y_rk4(n) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end
hold on 
plot(m,abs(y_rk4), 'k', 'LineWidth', 2)

%%%%%%%%%%%%%%%% Leapfrog Method %%%%%%%%%%%%%%%%%

y_lf(1) = 1;
y_lf(2) = y_lf(1) + j*h*y_lf(1);
for n = 2:20
    y_lf(n + 1) = y_lf(n - 1) + j*2*h*y_lf(n);         
end

hold on

plot(m,abs(y_lf), 'g', 'LineWidth', 2)


%%%%%%%%%%% Adams Bashforth Method %%%%%%%%%

y_ab(1) = 1;
y_ab(2) = y_ab(1) + j*h*y_ab(1);
for n = 1:19
    y_ab(n+2) = y_ab(n+1) + ((3*h)/2)*j*y_ab(n+1) - (h/2)*j*y_ab(n);
end
    
plot(m,abs(y_ab), 'y', 'LineWidth', 2)


%%%%%%%%% Exact Solution %%%%%%%%%%%%
exact = ones(1,length(m));
plot(m, exact, 'm', 'LineWidth', 2);




legend('Explicit Euler','2nd Runge-Kutta', '4th Runge-Kutta', 'Leapfrog', 'Adams Bashforth', 'Exact');

xlabel('n')
ylabel('|y|')
title('h = 0.1')

% exact solution is y = 1 ( abs(exp(ix) = 1);






