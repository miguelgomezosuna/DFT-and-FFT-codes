function i_F = iDFT_matrix(n)
    
    %Inversa de la matriz de Fourier
    %De forma mucho más rápida

    %Construimos matriz de Fourier con las w conjugadas (Fconj)
    %Raíz primitiva n-ésima de la unidad
    w = exp(1i*2*pi/n);
    
    % Creamos la matriz de Fourier (forma rápida)
    [I,J] = meshgrid(1:n,1:n);
    Fconj = w.^((I-1).*(J-1));

    %Usando que: F^(-1) = (1/N)*Fconj
    i_F = (1/n)*Fconj;

end

