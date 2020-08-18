clc
clear

klen = 50;
nmax = 10000;
prok = zeros(klen,1);

i = rand(nmax,1);
j = rand(nmax,1);
x = zeros(klen,1);
mm = 1 ;
for n =  1:nmax
    eta = -log(i(n));
    geta = 0.5*exp(-0.5*(eta-1.0)*(eta-1));
    if j(n) <= geta
        x = eta;
    end
    k = fix(eta/0.2)+1;
    if k >= klen
        k = klen -1;
    end
    prok(k) = prok(k)+1;
end
tt = 0.1:0.1:10;
f = 1/sqrt(2*pi)*exp(-0.5*(tt).*(tt));
nn = 0:0.2:9.8;
% subplot(1,2,1)
figure;
plot(nn,prok/nmax,'-ro','MarkerFaceColor','r')
hold on
F=zeros(klen,1);
t = 0;
for m =1:klen
    t = t + prok(m);
    F(m) = prok(m);    
end
% subplot(1,2,2)
plot(tt,f,'-om')