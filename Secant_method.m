clear
clc
xa = 1; fa = expression(xa);%����[a,b]
xb = 2; fb = expression(xb);
count = 9;%��������
iter = 1;
a = [];
xk = xa;x0 = xb;
fk = fa;f0 = fb;
while(iter<=count)
    xkk = xk -((xk - x0)/(fk - f0)*fk);
    x0 = xk;            %˫���ҽط���ȱ������������ܳ�����xk��Nan,9��
    f0 = expression(x0);
    xk = xkk;           %���㣺12--15��
    fk = expression(xk);
%     a = [a xkk];      %��¼
    iter = iter + 1;
end
xk
function y = expression(x)
y = x^3 - x - 1;
end