clear
clc
a = 0;
b = 4;
N = 1;
x(1) = a;
x(end) = b;
h = (b-a)/N;
f1 = a*sin(a);
f2 = b*sin(b);
I1 = 0.5*(f1+f2)*h;
i = 1;
while(1)
    I2 = 0;
    for x = a:h:b
        f1 = x*sin(x);
        f2 = (x+h)*sin(x+h);
        I2 = I2 + 0.5*h*(f1+f2);
    end
    if (abs(I1-I2)<1e-4)        %直到达到这里的精度退出循环
        break;
    end
    I1 = I2;
    h = h*0.5;
    hh(i) = h;
    In(i) = I2;
    i = i+1;
end
figure;
semilogx(hh(2:end),In(2:end),'-o')
xlabel('step length')
ylabel('integral result')