function [eigenvector, eigenvalue] = myPowerIterationNorm(A, x0, relTol, maxIter)

if length(size(A)) ~= 2
    error("A Must be a Matrix");
end

if length(A) ~= length(x0)
    error("Dimensional Mismatch");
end

if size(A,1) ~= size(A,2)
    error("Square A Matrix Only");
end

N = length(A);
iterCount = 0;
prevEigVal = 0;
eigVal = 0;
relErr = 0;
xNext = zeros(N,1);

while true
    iterCount = iterCount + 1;
    xNext = myMatrixMult(A,x0);
    eigVal = myAbsMax(xNext);
    xNextNormalized = xNext/eigVal;
    relErr = abs(eigVal - prevEigVal)/eigVal;

    iterCount
    relErr
    if ((relErr < relTol) || (iterCount > maxIter))
        break;
    end

    prevEigVal = eigVal;
    x0 = xNextNormalized;
end

eigenvalue = eigVal;
eigenvector = xNextNormalized;

end