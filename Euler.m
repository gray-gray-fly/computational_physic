clear
clc
t = 0:0.1:5;
Q0 = 1;
tao = 10;
dt = 1;
Q_1 = zeros(1,51);
Q_2 = zeros(1,51);
Q_0 = exp(-t);
for i = 1:51
    if i==1
        Q_1(i) = Q0;
        continue;
    end
    Q_1(i) = Q_1(i-1)-Q_1(i-1)/tao*dt;       %直接
end
for j = 1:51
    if j==1
        Q_2(j) = Q0;
        continue;
    end
    Q = Q_2(j-1)-Q_2(j-1)/tao*dt;             
    Q_2(j) = Q_2(j-1)-0.5*(Q_2(j-1)+Q)/tao*dt;%改良,Q,Q_2求平均
end
figure;
plot(t,Q_0,'-b','LineWidth',1)
hold on
plot(t,Q_1,'.r')
plot(t,Q_2,'og')
axis([-1,5,0,1])
legend('Analytical','Euler','Modified Euler')