function u = Utility(x1, x2, a)
%------------------------------------------------
% PURPOSE: calculate utility: 2 good Cobb-Douglas
%          specification for a given alpha. 
%------------------------------------------------
% USAGE: u  : Utility(x1, x2)
% where: x1 : quantity of q1
%        x2 : quantity of q2
%        a  : consumer preferences
%------------------------------------------------
% OUTPUT: u : overall utility
%------------------------------------------------

u  =  (x1.^a) .* (x2.^(1-a)); 

return
