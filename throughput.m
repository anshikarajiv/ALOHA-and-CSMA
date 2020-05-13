set(0,'DefaultLegendAutoUpdate','off')

%initialising a and p
a=0.02;
p=0.04;

G = linspace(0,100,1000);

%Pure ALOHA
S1 = G.*exp(-2.*G);
semilogx(G,S1,"b")
hold on

%Slotted ALOHA
S2 = G.*exp(-G);
semilogx(G,S2,"r")
hold on

%Non-persistent CSMA
S3 = (a.*G.*exp(-a.*G))./((1-exp(-a.*G))+a);
semilogx(G,S3,"y")
hold on

%1-Persistent CSMA
S4 = (G.*(1+G+a.*G.*(1+G+a.*(G./2))).*exp(-G.*(1+2.*a)))./(G.*(1+2.*a)-(1-exp(-a.*G))+(1+a.*G).*exp(-G.*(1+a)));
semilogx(G,S4,"g")
hold on

%p-Persistent CSMA
q=1-p;
g=a.*G;

pi0=exp(-(1+a).*G);
pi01 = exp(-g);

p1=  ((pi0.^p - pi0)./(q.*(1-pi0)))- ((1-exp(-p.*g)).*(pi0.^(1-q.^2) - pi0))./((q.*(1-pi0))-q.*exp(-2.*g.*p).*(pi0.^p-pi0));
p2 = ((pi01.^p - pi01)./(q.*(1-pi01))) - ((1-exp(-p.*g)).*(pi01.^(1-q.^2) - pi01))./((q.*(1-pi01))-q.*exp(-2.*g.*p).*(pi01.^p-pi01));

t2=(pi01.^p-pi01)./(1-pi01-(pi01.^p - pi01).*exp(-p.*g));
t1=(pi0.^p-pi0)./(1-pi0-(pi0.^p - pi0).*exp(-p.*g));

S5=((1-exp(-a.*G)).*(p2.*pi0+p1.*(1-pi0)))./((1-exp(-a.*G)).*(a.*t2.*pi0+a.*t1.*(1-pi0)+1+a)+a.*pi0);
semilogx(G,S5,"k")

%legend('Slotted ALOHA','Pure ALOHA','Non-persistent CSMA','1-persistent CSMA','p-Persistent CSMA')

%setting the title and naming the axes
title('Throughput for various access modes', 'fontsize', 18)
xlabel('G(offered channel traffic)', 'fontsize', 16)
ylabel('S(throughput)', 'fontsize', 16)










