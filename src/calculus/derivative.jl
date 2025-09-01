# --- Implement derivative functions for calculus operations --- 
module Derivative 


function derivative(f::Function,x::Real,h::Real=1e-5)
    # --- Implementing derivative using central difference method --- 

    return f(x + h) - f(x - h) / (2h)

end 

end # --- End of module ---