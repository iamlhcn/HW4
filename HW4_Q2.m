 %%%%%%%%%%%%%%%%%%% Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y(1) = 0.5;
m = 0:50;
h = [1 0.1 0.01 0.001 0.0001];
C = {'k','b','r','g' 'y'};

% %% 
% % 1 - Linearized Tripezoidal Method


% for i = 1:length(h)
%     for n = 1:50
%         y(n + 1) = y(n) + h(i)*y(n)*(y(n) - 1)./(1 - (h(i)/2)*(2*y(n) -1));
%     end
%     plot(m,y,'color',C{i}, 'LineWidth', 2)
%     hold on
% end
% 
% % %Exact Solution
% f = inline('1./(1 + exp(x))', 'x');
% x = 0:0.1:50;
% AA = feval(f,0:0.1:50);
% plot(x,AA, 'LineWidth', 2)
% 
% legend('h = 1','h = 0.1', 'h = 0.01', 'h = 0.001', 'h = 0.0001', 'Exact');
% 
% xlabel('n')
% ylabel('y')
%% 

%2 - direct trapezoidal method
y_e(1) = 0.5;
for i = 1:length(h)
    for n = 1:50
        y_e(n+1) = y_e(n) + h(i)*( -y_e(n)*(1 - y_e(n)) );
        y(n + 1) = y(n) + (h(i)/2)*(-y_e(n+1)*(1 - y_e(n+1)) - y(n)*(1 - y(n)) );
    end
    plot(m,y,'color',C{i}, 'LineWidth', 2)
    hold on
end


%Exact Solution
f = inline('1./(1 + exp(x))', 'x');
x = 0:50;
AA = feval(f,0:50);
plot(x,AA, 'LineWidth', 2)

legend('h = 1','h = 0.1', 'h = 0.01', 'h = 0.001', 'h = 0.0001', 'Exact');

xlabel('n')
ylabel('y')

