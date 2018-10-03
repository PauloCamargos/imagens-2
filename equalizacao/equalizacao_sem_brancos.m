% Lendo a imagem original
im_in = imread('../imagens-base/Im_original.jpg');

% Buscando os indices dos pixels que possuem valor zero
indices_zeros = find(im_in < 7);

% Equalizando a imagem
imeq  = histeq(im_in);

% Copia da imagem equalizada
im_eq_modificada = imeq;

% Reestabelecendo a cor 0 nos pixels que eram 0 originalmente
im_eq_modificada(indices_zeros) = 0;

% Lendo imagem com filtro do Instagram
im_insta = imread('resultados/im_insta.jpg');

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
imshow(im_eq_modificada);
title("Equalized modified");
subplot(2,4,7);
imhist(im_eq_modificada);
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