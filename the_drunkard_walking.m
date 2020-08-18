clc
clear

x = zeros(500,100);
msquare =zeros(100,1);
L = 1;
for eg=1:500
    walk = 0;
    for step = 1:100
        p = randsample([0,1],1,true,[0.5,0.5]);
        q = 1 - p;
        walk = walk + (p-q)*L;
        x(eg,step) = walk;
        msquare(step) = msquare(step) + x(eg,step).^2;
    end
end
subplot(1,2,1)
title('醉汉位置与时间的关系图')
xlabel('Step')
ylabel('x')
hold on
for i=1:5
    plot(x(i,:))
    hold on
end
t = 1:100;
subplot(1,2,2)
box on
plot(t,msquare/500,'ob')
hold on
tsquare = 1:100;
plot(tsquare,'-k')
title('醉汉位置均方值与时间关系图，500个醉汉')
xlabel('Step')
ylabel('<x^2>')
text(10,60,'均方值<x^2> t')