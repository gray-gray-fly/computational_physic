clear
clc
xa = 1; fa = expression(xa);%区间[a,b]
xb = 2; fb = expression(xb);
count = 9;%迭代次数
iter = 1;
a = [];
xk = xa;x0 = xb;
fk = fa;f0 = fb;
while(iter<=count)
    xkk = xk -((xk - x0)/(fk - f0)*fk);
    x0 = xk;            %双点弦截法，缺点迭代次数不能超过，xk会Nan,9次
    f0 = expression(x0);
    xk = xkk;           %单点：12--15次
    fk = expression(xk);
%     a = [a xkk];      %记录
    iter = iter + 1;
end
xk
function y = expression(x)
y = x^3 - x - 1;
end