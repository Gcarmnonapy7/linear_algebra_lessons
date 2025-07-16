#Matrix operations module from scratch

function matrix_addition(A::Matrix{Float64}, B::Matrix{Float64})
    # Matrix addition
    if size(A) != size(B)
        error("Matrices A and B must have the same dimensions.")
        return nothing
    end
    return A .+ B
end