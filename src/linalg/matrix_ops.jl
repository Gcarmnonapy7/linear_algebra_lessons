#Matrix operations module from scratch

function matrix_addition(A::AbstractMatrix, B::AbstractMatrix)
    # Matrix addition
    if size(A) != size(B)
        error("Matrices A and B must have the same dimensions.")
    end
    return A .+ B
end

function matrix_multiplication(A::AbstractMatrix,B::AbstractMatrix)
    #Matrix multiplication 
    if size(A,2) != size(B,1)
        error("Number of columns in A must be equal to the number of rows in B.")
    end
    return A * B
end