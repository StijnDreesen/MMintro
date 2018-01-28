% We retake the code from Chapter 3.2:

clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta,Q] = fminsearch(@(B) GMMObjective(B,y,X), [10,0,0]', optimset('TolX',1e-9))

% Our weight matrix is not the optimal one. The covariance matrix is then:

% inv(G'WG)* (G'WVWG) * inv(G'WG)
