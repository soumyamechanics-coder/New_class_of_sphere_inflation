%% Finite deformation of Anisotropic implicit spheres

xmesh=linspace(1,2,300);
solinit=bvpinit(xmesh,[-1,1])
options = odeset('RelTol',1e-9,'AbsTol',1e-9);
sol=bvp5c(@func,@bcfun,solinit,options)
figure(1)
hold on
plot(sol.x,sol.y(1,:))
plot(sol.x,sol.y(2,:),'k')
YY=sol.y(1,:);
YYY=sol.y(2,:);
l_r_sq=(beta1+beta2*YY+beta3*YY.^2)./(1-(beta4+2*beta5.*YY+2*beta6*YY.^2));
l_t_sq=beta1+beta2*YYY+beta3*YYY.^2;%+l_r_sq*(beta4+2*beta5*Trr+2*beta6*Trr^2);
l_r=sqrt(l_r_sq);
l_t=sqrt(l_t_sq)

figure(2)
hold on
plot(sol.x,l_r,'r')
plot(sol.x,l_t)
comp_sat=diff(l_t)./diff(sol.x)+(l_t(1,1:299)-l_r(1,1:299))./sol.x(1,1:299)

figure(3)
plot(sol.x(1,1:299),comp_sat)

%diff(YY)./diff(sol.x)+2*

%(alpha1 + 3*alpha6 + Tr*alpha2 + 6*Tr*alpha9 + Tr^2*alpha3 + 6*Tr^2*alpha10 - 1)/(2*alpha1 + 4*alpha6 + 2*Tr*alpha2 + 8*Tr*alpha9 + 2*Tr^2*alpha3 + 8*Tr^2*alpha10 - 1)
%plot(sol.x,20*(sol.y(1,:)+sol.x.*sol.y(2,:)))