% Done
function L = bound(X, model, prior)
alpha0 = prior.alpha;
kappa0 = prior.kappa;
v0 = prior.v;
logW0 = prior.logW;
alpha = model.alpha; 
kappa = model.kappa; 
v = model.v;         
logW = model.logW;
R = model.R;
logR = model.logR;
[d,n] = size(X);
k = size(R,2);

Epz = 0;
Eqz = dot(R(:),logR(:));
logCalpha0 = gammaln(k*alpha0)-k*gammaln(alpha0);
Eppi = logCalpha0;
logCalpha = gammaln(sum(alpha))-sum(gammaln(alpha));
Eqpi = logCalpha;
Epmu = 0.5*d*k*log(kappa0);
Eqmu = 0.5*d*sum(log(kappa));
logB0 = -0.5*v0*(logW0+d*log(2))-logMvGamma(0.5*v0,d);
EpLambda = k*logB0;
logB =  -0.5*v.*(logW+d*log(2))-logMvGamma(0.5*v,d);
EqLambda = sum(logB);
EpX = -0.5*d*n*log(2*pi);
L = Epz-Eqz+Eppi-Eqpi+Epmu-Eqmu+EpLambda-EqLambda+EpX;