function F = DFT_matrix(n)
    
    %Raíz primitiva n-esima de la unidad
    w = exp(-1i*2*pi/n);
    
    %Creamos la matriz de Fourier (forma rapida)
    [I,J] = meshgrid(1:n,1:n);
    F = w.^((I-1).*(J-1));
 
end

