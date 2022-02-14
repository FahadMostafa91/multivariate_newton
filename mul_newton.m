% multivariate newton method
% faster convergene
% fahad mostafa @ttu 2022
x0 = [1 1]';
tau = 1.0e-6;
imax = 1000;
 f = Gradient(x0);
 J = Hessian(x0);
 dx = -J\f;

 i = 0;
while norm(dx)> tau  && i < imax
   x0 = x0 + dx;
   f = Gradient(x0);
   J = Hessian(x0);
    dx = -J\f;
    fprintf('%d %12/5g\n', i, norm(dx))
    i = i+1
end
disp(x0)

function y = Gradient(x)
    A=[2 -1 ; -1 2];
    y = A*x - 1/2*cos(x);
end

function y = Hessian(x)
    y = [2+1/2*sin(x(1)),-1 ; -1,2+1/2*sin(x(2))];
end