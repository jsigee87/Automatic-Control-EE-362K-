function cprime = mysystem(t,x)

%units in L
Vb = 48;  

%units in L
Vl = 0.6;

%units in L/min
q = 1.5; 

%units mmol/min
qmax = 2.75;

%units mmol/L
co = 0.1;   

% qgi is 12 g oral dose of alcohol over 1 minute
% 12 grams ethanol -> 0.26048 moles ethanol
% units mmol/min
qgi = 0.26048;

% qiv is 40 g oral dose of alcohol over 1 minute
% 40 grams ethanol -> 0.86827 moles ethanol
% units mmol/min
qiv = 0.86827;


% Compute concentration in blood for:
% oral dose of 12 g in 1 minute
% intravenous dose of 40 g in 1 minute
% cb = x(1)
% cl = x(2)

cprime = [(q*(x(2) - x(1)) +qiv)/Vb; (q*(x(1)-x(2))-qmax*(x(2)/(co+x(2))) + qgi)/Vl];
