"""
    gauss_elimination(A, b) -> x

Solve the linear system **A x = b** with Gaussian elimination
(using partial pivoting for numerical stability).

`A` must be a square `Float64` matrix and `b` a real vector of
compatible length.  Returns the solution vector `x`.
"""
module LinearSystemSolvers

function gauss_elimination(A::Matrix{Float64},b::Vector{Float64},tol::Float64=1e-10)
    #Gaussian elimitation method
    # N is the number of rows and columns in A
    # b is the vector of columns

    n,m = size(A)
    if n != m
        error("Matrix A must be square.")
    end
    
    if  n != length(b)
        error("Matrix A and vector b must have compatible dimensions.")
    end
    
    x_vector = zeros(Float64, n) #Needs to be initialized with the correct size (n) and x => Solution vector
    # Create augmented matrix

    aug = hcat(A, b)

      for i in 1:n
        # Partial pivoting
          max_row = i # Asumming the current row (i) has the largest pivot

          for k in i+1:n # Check for larger pivot in the remaining rows

                if abs(aug[k,i]) > abs(aug[max_row,i])
                    max_row = k # Update max_row if a bigger pivot is found
                end

            end
            if max_row != i 
                #Swap the current max_row with the current row (i)
                temp = copy(aug[i,:])
                aug[i,:] = aug[max_row,:]
                aug[max_row,:] = temp
            end
            abs(aug[i,i]) < tol && error("Matrix is singular or nearly singular.")

            # Forward elimination
            for j in i+1:n
                scaling_factor = aug[j,i] / aug[i,i]
                aug[j,:] -= aug[i,:] * scaling_factor
            end
        end

        #Back substituition for solving unknowns variables
        for i in n:-1:1 # Start from the last row move upwards

            # Init x[i] with the right-hand side / diagonal element
            sum_known_terms = 0.0
            # Update the right-hand side for the next iteration
            for j in i+1:n
                # Sum the known terms
                sum_known_terms += aug[i,j] * x_vector[j]
            end 
            #Then solve for x[i]
            x_vector[i] = (aug[i,end] - sum_known_terms) / aug[i,i]
        end
        return x_vector
end

function matrix_inverse(A::AbstractMatrix)
    #Implement the matrix inverse function by scratch
    if size(A,1) != size(A,2)
        error("To get a inverse the current matrix needs to be a square")
    end

    if det(A) == 0 
        error("If you have a determinant of 0, the matrix is singular and cannot be inverted")
    end
    return inv(A)
end

end 


    


