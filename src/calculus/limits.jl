module Limits 


# --- Implementation of limits from scratch ---

function limit(f::Function,a::Real,h::Real=1e-5,tol::Real=1e-7,direction::Symbol=:both,n_inter::Int=1000)
    # Compute the limit of a function(f(x)) as x approaches to a point a 
    # with a small increment h and tolerance tol
    
    iter = 0
    max_iter = n_inter
    prev_value = NaN 

    while h > tol && iter < max_iter
        if direction == :right
           current_value = f(a + h)
 
        elseif direction == :left 
            current_value = f(a - h) 
        elseif direction == :both
            right_value = f(a + h)
            left_value = f(a - h)
        
            if abs(right_value - left_value) < tol
                return (right_value + left_value) / 2
            end 
            
            current_value = (right_value + left_value) / 2
        else 
            error("Direction must be :left, :right, or :both")
        end 
        
        #Check for convergence
        if !isnan(prev_value) && abs(current_value - prev_value) < tol
            return current_value
        end

        # Check for infinity
        if isinf(current_value)
           return current_value
        end   

        # Check for NaN  
        if isnan(current_value)
           error("Limit does not exist (NaN encountered).")
        end
        prev_value = current_value # Update previous value
        h /= 2 # Reduce h for better approximation
        iter += 1 
    end
    error("Limit did not converge within the specified tolerance and iterations.")  
end 















end # --- End of module ---