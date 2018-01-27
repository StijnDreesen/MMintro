% The file UtilitySimple returns the correct answers:

UtilitySimple(1, 4)
UtilitySimple(3, 3)
% Any reasons it shows all these zeroes? for line 4?

x1 = [1:10]';
x2 = 5;

% UtilitySimple(x1, x2) This code does not work, because UtilitySimple is
% not equipped to handle anything else but scalars. 

% We can now instead use the more complex version, able to handle vectors and
% matrices. We first redefine x1 and x2 to a meshgrid: 

[x1, x2] = meshgrid([0:3], [0:3])

u = Utility(x1, x2)

surfc(x1, x2, u) % This visualizes all utilities for the two-dimensional space [0,3] x [0, 3]. As basic input, it simply needs values X, Y and Z.

% Finetuning the grid is easy:

[x1, x2] = meshgrid([0:.1:3], [0:.1:3]); % Note we now use intervals 0.1.

u = Utility(x1, x2);
surfc(x1, x2, u)



