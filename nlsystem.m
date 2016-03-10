function F = nlsystem(x)
% trova gli istanti incogniti t1 e t2 
% inputs: funzione uOpt e tutti i suoi parametri,N
% outputs: t1, t2,...tN-1

% comandi per utilizzare la funzione (esempio) :
%   x0=[0.33 0.66];
%   fun = @nlsystem;
%   x = fsolve(fun,x0)

x_0=1;
t_f=1;
N=3;

% Sistema del primo ordine
A=1;
Q=8;
uOpt = @(t)-(A+sqrt(A*A+Q)).*exp(-sqrt(A*A+Q)*t); 
%uOpt=@(t)2*exp(-2.*t).*cos(10.*t)
%uOpt = @(t) sin(t.^2);


f1(1) = quad(uOpt,0,x(1))./x(1)-uOpt(x(1));
f2(1) =  1./(x(2)-x(1)).*quad(uOpt,x(1),x(2))-uOpt(x(1));
F(1)  =  f1(1).^2-f2(1).^2;

for i=2:N-2
    f1(i) = 1./(x(i)-x(i-1)).*quad(uOpt,x(i-1),x(i))-uOpt(x(i));
    f2(i) = 1./(x(i+1)-x(i)).*quad(uOpt,x(i),x(i+1))-uOpt(x(i));
    F(i)  = f1(i).^2-f2(i).^2;
end
    
f1(N-1) = 1./(x(N-1)-x(N-2)).*quad(uOpt,x(N-2),x(N-1))-uOpt(x(N-1));
f2(N-1) = 1./(t_f-x(N-1)).*quad(uOpt,x(N-1),t_f)-uOpt(x(N-1));
F(N-1)  = f1(N-1).^2-f2(N-1).^2;

