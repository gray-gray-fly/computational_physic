clear
clc
a = 1;       %区间[a,b]
b = 2;
x = sqrt(2); %real solution
fa = expression(a);xa = a;
fb = expression(b);xb = b;
iterator = 1;f(1) = (xa+xb)/2;
err = expression(f(1));
while(abs(xa-xb)>1e-8)
    xc = (xa + xb)/2;
    fc = expression(xc);
    if fa*fc<0 
        xb = xc;
%         fb = expression(xb);
    else
        xa = xc;
        fa = expression(xa);
    end
    iterator = iterator + 1;
    f(iterator) = xc;
    err(iterator) = expression(xc)-expression(x);
end
plot(f,'-sr')
hold on
plot(abs(err),'-ob')
hold on
xx=get(gca,'xlim');
yy=x;
hold on
plot(xx,[yy yy],'--k')
h = gca;
set(h,'FontSize',14);
axis([0,16,0,2])
xlabel('Iteration'),ylabel('{\itx}')
legend('迭代结果','误差')
function y = expression(x)
     y = x^2 - 2;
end
