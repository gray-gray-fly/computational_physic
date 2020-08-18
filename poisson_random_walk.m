clc
clear
x = 0;
y = 0;
N = 50;                       %������
num(N,N) = 0;
number = 100;                  %����
for count = 1:number
    for i = 1:N
        for j = 1:N
            x = i-1;
            y = j-1;
            mark = 3;            %���λ
            mark = boundary(x,y);%�ж��Ƿ�ʱ�߽磬Ȼ�������Ӧ�ķ���ֵ
            if mark==2
               mark = site(x,y); %����λ�ø���x��y
            end
            num(i,j) = num(i,j) + mark;
        end
    end
end
for row = 1:N
    for col = 1:N
        X(col,row) = col;
        Y(row,col) = col;
    end
end

figure;
surf(X/N,Y/N,num/number)
view(2);
xlabel('x')
ylabel('y')
function z=boundary(x,y)
N = 50;
        if x==0 || x==N-1
           z = 1;
        elseif (y==0 && x~=0 && x~=N-1) || (y==N-1 && x~=0 && x~=N-1)
           z = 0;
        else
           z = 2;
        end
end

function out=site(x,y)
N = 50;
    while x~=0 && y~=0 && x~=N-1 && y~=N-1
        n = rand();
        if n<1/4
            x = x+1;
        elseif n<1/2 && n>1/4
            x = x-1;
        elseif n<3/4 && n>1/2
            y = y+1;
        else
            y = y-1;
        end
    end
    out = boundary(x,y);
end
            