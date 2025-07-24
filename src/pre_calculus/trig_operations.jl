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

function abs(x::Number)
    # Returns the absolute value of a number
    return x < 0 ? -x : x
end

#Implementation sin and cos using Taylor series expansion
function tan(x::Number)
    # Returns the tangent of x in radians
    return sin(x) / cos(x)
end

end