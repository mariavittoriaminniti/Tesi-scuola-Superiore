
% trova gli istanti incogniti t1,t2,...tN-1

% inputs: funzione uOpt e tutti i suoi parametri,N, guess iniziale es.
% x0=[0.33 0.66]
% outputs: t1, t2,...tN-1

% comandi per utilizzare la funzione (esempio) :
%   x0=[0.33 0.66];
%   fun = @nlsystem;
%   x = fsolve(fun,x0)


x0=[0.33 0.66];
fun = @nlsystem;
x = fsolve(fun,x0)