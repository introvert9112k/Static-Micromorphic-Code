
function [Omega] = compute_damage(kappa_gpt,kappa0_gpt,alpha,beta)
    if kappa_gpt < kappa0_gpt
        Omega = 0;
    else   
        a = (kappa0_gpt/kappa_gpt);
        c = beta*(kappa_gpt - kappa0_gpt);
        temp = (1-alpha) + alpha*exp(-c);
        Omega = 1 - a*temp;
    end
end % END OF FUNCTION compute_damage