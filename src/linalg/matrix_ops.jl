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

function transpose_matrix(A:AbstractMatrix)
    rows,cols = size(A)
    transposed = zeros(eltype(A),cols,rows) #Create a new matrix with tranposed dimensions 
    for i in 1:rows 
        for j in 1:cols 
            transposed[j,i] = A[i,j] # Swap elements to tranpose_matrix
        end
    end
    return transposed
end

function identity_matrix(Int::n)
    # Returns an identity matrix of size n x n
    if n <= 0
        error("Size of the identity matrix must be a positive integer.")
    end
    I = zeros(Float64,n,n)
    for i in 1:n
        I[i,i] = 1.0 # Set diagonal elements to 1 
    end 
    return I  
end

function zeros_matrix(rows::Int,cols::Int)
    # Returns a matrix of zeros with specified rows and columns
    if rows <= 0 || cols <=0 
        error("The numbers of rows and cols needs to be positive")
    end 
    
    zero_matrix = [0.0 for _ in 1:rows , _ in 1:cols]
    
    return zero_matrix
end

end