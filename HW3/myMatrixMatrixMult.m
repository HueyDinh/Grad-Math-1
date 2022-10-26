function matProd = myMatrixMatrixMult(matA,matB)

if (size(matA,2) ~= size(matB,1))
    error("Dimension not Compattible")
end

numRow = size(matA,1);
numCol = size(matB,2);

matProd = zeros(numRow,numCol);

for rowIndex = 1:numRow
    for colIndex = 1:numCol
    matProd(rowIndex,colIndex) = myInnerProduct(matA(rowIndex,:),matB(:,colIndex));
    end
end

end