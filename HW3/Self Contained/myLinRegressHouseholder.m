function x = myLinRegressHouseholder(A,b)

numCol = size(A,2);

for pivot_index = 1:numCol

    aSubCol = A(pivot_index:end,pivot_index);
    vSubCol = aSubCol;
    alpha = -my2Norm(aSubCol)*sign(aSubCol(1));
    vSubCol(1) = aSubCol(1) - alpha;
    A(pivot_index,pivot_index) = alpha;
    A(pivot_index+1:end,pivot_index) = 0;

    for transformIndex = (pivot_index + 1):numCol
        transformSubCol = A(pivot_index:end,transformIndex);
        A(pivot_index:end,transformIndex) = transformSubCol - 2*myInnerProduct(vSubCol,transformSubCol)/myInnerProduct(vSubCol,vSubCol)*vSubCol;
    end
    bSubCol = b(pivot_index:end);
    b(pivot_index:end) = bSubCol - 2*myInnerProduct(vSubCol,bSubCol)/myInnerProduct(vSubCol,vSubCol)*vSubCol;

end

R = A(1:numCol,:);
QTb = b(1:numCol);

x = myBackSubstitution(R,QTb);

end