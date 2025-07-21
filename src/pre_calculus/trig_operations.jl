# Trigonometry operations for pre-calculus
module TrigOperations

function factorial(n::Int)
    result = 1
    if n < 0
        error("Factorial not possible")
    end
    for i in 2:n
        result *= i
    end 
    return result 
end

function sine(angle::Float64,terms::Int=10)
    # Calculate sine using Taylor series expansion
    sine_value = 0.0
    
    for n in 0:terms-1
        term = ()