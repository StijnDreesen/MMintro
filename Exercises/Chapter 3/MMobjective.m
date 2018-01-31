function m = MMobjective(Beta,y,X)  

N = length(y);
K = size(X,2);
u = y - X*Beta;
m = 1/N*u'*X;

return