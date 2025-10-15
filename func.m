
function Ydot=func(R,Y)
beta1=1;
beta2=0.013;%1;
beta3=4.3e-5;%1;
beta4=0;%1;
beta5=-0.013/16;%1;
beta6=1e-6;%1;

Ydot=zeros(2,1);

Trr=Y(1);
Ttt=Y(2);
l_r_sq=(beta1+beta2*Y(1)+beta3*Y(1)^2)/(1-(beta4+2*beta5*Y(1)+2*beta6*Y(1)^2));
l_t_sq=beta1+beta2*Y(2)+beta3*Y(2)^2;%+l_r_sq*(beta4+2*beta5*Trr+2*beta6*Trr^2);
l_r=(sqrt((beta1+beta2*Y(1)+beta3*Y(1)^2)/(1-(beta4+2*beta5*Y(1)+2*beta6*Y(1)^2))));
l_t=(sqrt(beta1+beta2*Y(2)+beta3*Y(2)^2));

Ydot(1)=2*(Y(2)-Y(1))*((sqrt((beta1+beta2*Y(1)+beta3*Y(1)^2)/(1-(beta4+2*beta5*Y(1)+2*beta6*Y(1)^2)))))/((sqrt(beta1+beta2*Y(2)+beta3*Y(2)^2))*R);
Ydot(2)=2*(sqrt(beta1+beta2*Y(2)+beta3*Y(2)^2))*((sqrt((beta1+beta2*Y(1)+beta3*Y(1)^2)/(1-(beta4+2*beta5*Y(1)+2*beta6*Y(1)^2))))-(sqrt(beta1+beta2*Y(2)+beta3*Y(2)^2)))/(R*(beta1+2*beta3*Y(2)));
%Ydot(2)=(l_r+l_t-l_t_sq)/(beta1+2*beta3*Ttt);
end

