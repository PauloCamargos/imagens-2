% OBS: ESTE CÓDIGO FUNCIONA SOMENTE NO OCTAVE. RESULTADOS INESPERADOS PODEM
% SURGIR NO MATLAB.

% pkg load image
clear, clc
% Lendo a imagem original
im_in = imread('../imagens-base/mamaoriginal.jpg');
% Lendo imagem com filtro do Instagram
im_insta = imread('resultados/im_insta.jpg');

im_copia = double(im_in);
im_copia(im_copia==0)=NaN;
im_eq_copia = histeq(im_copia);
imeq  = histeq(im_in);
im_copia = uint8(im_copia);

% EQUALIZACAO
figure
% Imagem original
subplot(2,4,1);
imshow(im_in);
title("Original image");
subplot(2,4,5);
imhist(im_in);
title("Histogram");

% Imagem equalizada
subplot(2,4,2);
imshow(imeq);
title("Equalized image");
subplot(2,4,6);
imhist(imeq);
title("Histogram");

% Imagem equalizada com preto modificado
subplot(2,4,3);
imshow(im_eq_copia);
title("Imagem modified");
subplot(2,4,7);
imhist(im_eq_copia);
title("Histogram");

% Filtro instagram
subplot(2,4,4);
imshow(im_insta);
title("Instagram filter");
subplot(2,4,8);
imhist(im_insta);
title("Histogram");


%%% LINEARIZACAO
%
%media = mean(im_in(:));
%[linhas, colunas] = size(im_in);
%imagen_bin = zeros(linhas, colunas);
%tamanho_imin = linhas*colunas; 
%for i=1:tamanho_imin-1
%    if im_in(i) > media
%      imagen_bin(i) = 255;
%    endif
%endfor
% 
% figure
% imshow(imagen_bin)
% 
% mmaior = find(im_in>media);
% mmenor   = find(im_in<=media);
% im_in(mmenor) = 0;
% im_in(mmenor) = 255;
% figure 
% imshow(im_in);
% 