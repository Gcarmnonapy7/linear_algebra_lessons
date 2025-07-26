#Matrix operations module from scratch
module MatrixOps

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

#Block matrix multiplication for large matrices
# Inverse of a matrix

function matrix_inverse(A::AbstractMatrix)
    if size(A,1) != size(A,2)
        error("To get a inverse the current matrix needs to be a square")
    end

    if det(A) == 0 
        error("If you have a determinant of 0, the matrix is singular and cannot be inverted")
    end
    return inv(A)
end

#Getting the initial matrix by the inverse of the matrix ]
function matrix_initial(A::AbstractMatrix)
    if size(A,1) != size(A,2)
        error("Needs to be a square matrix")
    end
    if det(A) == 0
        error("The determinant of the matrix cannot be zero")
    end
    return I(size(A,1)) #Returns the indentity matrix with the same dimensions as A
end 


end