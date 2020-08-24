function [T] = otsu_th(I, N)
    [hist_vect,bin_edges] = histcounts(I(:),N);
    hist_vect = hist_vect/sum(hist_vect);
    
    sigma_b = zeros(N,1);
    
    for k = 1:N
        omega_1_k = sum(hist_vect(1:k));
        omega_2_k = 1-omega_1_k;
        
        mu_1_k = sum(bin_edges(1:k).*hist_vect(1:k))/omega_1_k;
        mu_2_k = sum(bin_edges(k+1:N).*hist_vect(k+1:N))/omega_2_k;
        
        sigma_b(k) = omega_1_k*omega_2_k*(mu_1_k-mu_2_k)^2;
          
    end
    [~,arg_max_sigma_b ] = max(sigma_b); 
    th = bin_edges(arg_max_sigma_b+1);
    
    T = I>th;


end