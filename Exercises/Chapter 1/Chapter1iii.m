% In this exercise we test our user-written code Utility2.m. The only
% changes to its code compared to Utility2.m is the inclusion of a general
% alpha as an input (the consumer preferences). See also Varian's
% intermediate microeconomics, p. 63 (Cobb-Douglas preferences). 

% We first check the special case alpha=0.5. 

% Create a meshgrid covering the two-dimensional space [0,3] x [0,3].

[x1, x2] = meshgrid([0:3], [0:3])


u = Utility2(x1, x2, 0.5) % The utilities reported are the same as on page 16.
surfc(x1, x2, u) % The figure is the same as Figure 1.1 (a) on page 17.

% We can have more detailed results: 

[x1, x2] = meshgrid([0:0.1:3], [0:0.1:3])

u = Utility2(x1, x2, 0.5); % Output takes a lot of space in the Command Window, so it is supressed using the semicolon. 
surfc(x1, x2, u) % The figure is the same as Figure 1.1 (b) on page 17.

% Take alpha=1:

[x1, x2] = meshgrid([0:0.1:3], [0:0.1:3])
u = Utility2(x1, x2, 1) % Utilities are simply multiplied with eachother. (i.e. the utility function becomes u = x1*x2
surfc(x1, x2, u) 

% Take alpha=0.25

[x1, x2] = meshgrid([0:0.1:3], [0:0.1:3])
u = Utility2(x1, x2, 0.25) % u is overall much lower, but a lower consumption of goods already nears this maximum 5 (increasing returns)
surfc(x1, x2, u) 

% Take alpha=0.75

[x1, x2] = meshgrid([0:0.1:3], [0:0.1:3])
u = Utility2(x1, x2, 0.75) % u reaches maximum of 5, but the utilities are decreasing.
surfc(x1, x2, u) 