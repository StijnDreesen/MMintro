% Revenue function: R(a,b) = 7a + 12 where a is trout and b salmon.

f = [-7, -12] % Since we are actually minimizing the objective function.
A = [1,2; 2,3] 
b = [1000; 1600]
% Since a+2b<=1000 and 2a+3b<=1600.
lb = zeros(2,1);

[fish, obj, exitflag] = linprog(f, A, b, [], [], lb)

% The fisherwoman must catch 200 trout and 400 salmon. She then has a
% revenue of 6200 dollars. Exitflag = 1, so a solution has been found.