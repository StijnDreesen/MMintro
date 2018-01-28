function u = Surplus(g,r)

u = -exp(-r.*g)-exp(0.5.*(r.^2)).*(1-cdf('Normal',g+r,0,1)).*(1./(1-cdf('Normal',g,0,1)))


return
