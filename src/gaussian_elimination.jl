function gauss_elimination(A::Matrix{Float64},b::Vector{Float64})
    #Gaussian elimitation method

    if size(A,1) != size(A,2)
        error("Matrix A must be square.")
        return nothing
    end
    
    if size(A,1) != length(b)
        error("Matrix A and vector b must have compatible dimensions.")
        return nothing
    end
    
    # Storing variables
    number_of_rows = size(A , 1 )
    number_of_columns = n - 1 
    solution_vector = zeros(Float64, n) #Needs to be initialized with the correct size

    # Create augmented matrix
    augmented_matrix = hcat(A, b)

    # Apllying Gaussian elimination
      for i in 1:number_of_rows
        # Pivoting 

