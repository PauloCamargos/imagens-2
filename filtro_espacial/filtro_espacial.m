% matriz = [100,0,0,0,0,0; 
%           100,0,200,200,10,0;
%           100,0,10,10,200,0;
%           100,0,10,100,200,0;
%           100,250,250,250,250,250];
          

% pkg load image
% matriz = imread('../../imagens_pf/RM2.jpg');
% matriz = imread('../../imagens_pf/CT1.jpg');
% matriz = imread('../../imagens_pf/CT4.jpg');
% matriz = imread('../../imagens_pf/Figado_TC.gif');
% matriz = imread('../../imagens_pf/Hipofise.jpg');
% matriz = imread('../../imagens_pf/lung-cancer-exray.jpg');
% matriz = imread('../../imagens_pf/NoduloFigado_US.jpg');
matriz = imread('../../imagens_pf/Us.jpg');
          
filtro_nove = (1/9) * ones(3);
filtro_dezesseis = (1/16) * [0 2 0; 2 8 2; 0 2 0];
filtro_maior = (1/81) * ones(9);

filtro_laplace_quatro_negativo =  [0 1 0; 1 -4 1; 0 1 0]; 
filtro_laplace_quatro_positivo = [0 -1 0; -1 4 -1; 0 -1 0];
filtro_laplace_oito_negativo = [1 1 1; 1 -8 1; 1 1 1];
filtro_laplace_oito_positivo = [-1 -1 -1; -1 8 -1; -1 -1 -1];
filtro_oito_positivo = filtro_laplace_oito_positivo * 1/9;



out_laplace_quatro_negativo      = imfilter(matriz, filtro_laplace_quatro_negativo);
out_laplace_quatro_positivo    = imfilter(matriz, filtro_laplace_quatro_positivo);
out_laplace_oito_negativo     = imfilter(matriz, filtro_laplace_oito_negativo); 
out_laplace_oito_positivo     = imfilter(matriz, filtro_laplace_oito_positivo); 
out_oito_positivo     = imfilter(matriz, filtro_oito_positivo); 

%out_mediana   = fspecial("average", 3);

figure
subplot(1,6,1);
imshow(uint8(matriz + out_laplace_quatro_negativo));
title("out_laplace_quatro_negativo");

subplot(1,6,2);
imshow(uint8(matriz + out_laplace_quatro_positivo));
title("out_laplace_quatro_positivo");

subplot(1,6,3);
imshow(uint8(matriz + out_laplace_oito_negativo));
title("out_laplace_oito_negativo");

subplot(1,6,4);
imshow(uint8(matriz + out_laplace_oito_positivo));
title("out_laplace_oito_positivo");

subplot(1,6,5);
imshow(uint8(matriz + out_oito_positivo));
title("out_oito_positivo");

subplot(1,6,6);
imshow(uint8(matriz));
title("matriz");title("Original");