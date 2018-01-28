clear; 

% Farmer has 75 acres to plant with two crops, wheat a or corn b. 
% If the farmer was unconstrained, revenue would be maximized by
% continuously growing crop a according to the revenue function:

% R(a,b) = 143a + 60b. 

% However, the farmer is in fact constrained: crop a requires more space
% than crop b and the farmer only has 4000 storage units for both:

% 110a + 30b <= 4000

% Furthermore, the farmer only has $15,000 to spend on both crops:

% 120a + 210b <= 15000

% We want to answer: 
%{
(i) How much crop a should she plant?
(ii) How much crop b should she plant?
(iii) What is her optimal revenue?
%}

% Linprog MINIMIZES the objective function:

f = [-143, -60]; % The coefficients in line 5.

% Furthermore, we have in fact three constraints, line 5, 10 and 25. 

A = [1, 1;110, 30;120, 210]

b = [75; 4000; 15000] % Note that the 75 refers to the 75 acres to be planted.

% Furthermoe, we cannot plant a negative amount of crops:

lb = zeros(2,1);

% We request the number of crops, the revenue obtained with those crops and
% the exitflag. Note we have two times [] since we do not have any strict
% equality constraints as defined in (2.1).

[crops, obj, exitflag] = linprog(f, A, b, [], [], lb)

% Note that the value of the objective function is negative, so we need its
% absolute value to determine the revenue obtained (about 632). The
% exitflag '1' means a solution has been reached. 



