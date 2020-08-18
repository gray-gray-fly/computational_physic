clear
klen = 30;
nmax = 100000;
prok = zeros(klen,1);

i = rand(nmax,1);
for j =  1:nmax
    k = fix(-log(i(j))/5.0/0.1)+1;
    if k > klen
        k = klen;
    end
     prok(k) = prok(k) +1;
end
x = 0:0.1:2.9;
subplot(1,2,1)
plot(x,prok/nmax,'-*g')
F=zeros(klen,1);
t = 0;
for m =1:klen
    t = t + prok(m);
    F(m) = t/nmax;    
end
subplot(1,2,2)
plot(x,F,'-.b')
