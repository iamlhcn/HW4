%%%%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h1 = 1;
h2 = 4.2;

%Explixit Euler

y_exp_h1(1) = 1;
y_exp_h2(1) = 1;

for n = 1:40
    y_exp_h1(n+1) = (1 - 0.5*h1)*y_exp_h1(n);
end

for n = 1:40
    y_exp_h2(n+1) = (1 - 0.5*h2)*y_exp_h2(n);
end

%Implicit Euler
y_imp_h1(1) = 1;
y_imp_h2(1) = 1;

for n = 1:40
    y_imp_h1(n+1) = y_imp_h1(n)/(1 + 0.5*h1);
end

for n = 1:40
    y_imp_h2(n+1) = y_imp_h2(n)/(1 + 0.5*h2);
end

%Exact Solution 
f = inline('exp(-0.5*x)', 'x');
AA = feval(f,0:40);
n = 0:40;
plot(n,y_exp_h1, 'm', 'LineWidth', 2)
hold on 
plot(n,y_exp_h2, 'b', 'LineWidth', 2)
hold on
plot(n, y_imp_h1, 'g', 'LineWidth', 2)
hold on
plot(n, y_exp_h2, 'k', 'LineWidth', 2)
hold on 
plot(n, AA, 'r', 'LineWidth', 2)
legend('Explicit h = 1','Explicit h = 4.2', 'Implicit h = 1', 'Implicit h = 4.2', 'Exact')
xlabel('n')
ylabel('y')

 












