% We now focus on non-linear problems, such as the CD function in Chapter
% 1. We then need a generalized optimization method, the fmincon. We also
% allow for non-linear constraints (as can be seen in (2.6.). Note that
% fmincon now DOES require us to feed an initial guess (x0) to the
% algorithm. 

I = 100; % The income to spend on both goods.
P = [4,7]; % First good costs 4$ and 7$. 
G = [15,5]; % An initial guess (economic intuition would indeed suggest she buys more of the cheaper good).
lb = [0,0]; % We cannot buy a negative amount of goods.


[consumption, u, exitflag] = fmincon(@CobbDouglas,G,P,I,[],[],lb) % We feed fmincon objective function, the initial values, the prices, the income we can spend on these prices and a lower bound).

% Again, pay attention that u is now negative. The exitflag is 1, meaning
% that the optimality conditions of the first order conditions are
% satisfied.


% We can now tell fmincon to optimize using the sequential quadratic
% programming algorithm. Define options:

opts= optimset('Algorithm','sqp');

% We can repeat the code from line 13, now specifying different options:

[consumption,u,exitflag]= fmincon(@CobbDouglas,G,P,I,[],[],lb,[],[],opts) % Note that we now HAVE to insert twice [] for the upper bound and the non-linear constraints, which do not exist.

% The same results as above are reported. 
