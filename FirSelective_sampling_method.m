clc
clear

klen = 50;
nmax = 1000000;
prok = zeros(klen,1);

i = rand(nmax,1);
j = rand(nmax,1);
x = zeros(klen,1);
for n =  1:nmax
    Max = max(i(n),j(n));
    k = fix(Max/0.02) + 1;
    prok(k) = prok(k) + 1;
    x(k) = Max;
end
nn = 0.02:0.02:1;
subplot(1,2,1)
plot(nn,prok/nmax,'-*g')
F=zeros(klen,1);
t = 0;
for m =1:klen
    t = t + prok(m);
    F(m) = t/nmax;    
end
subplot(1,2,2)
plot(nn,F,'-.b')