#Matrix operations module from scratch
module CoreOperations

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

function dot_product(A::AbstractVector, B::AbstractVector)
    # Dot product of two vectors
    if length(A) != length(B)
        error("Vectors A and B must have the same length.")
    end
    return sum(A .* B)
end

# Cross products implementation
end