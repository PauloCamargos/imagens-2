im_in = imread('../imagens-base/Im_original.jpg');
imeq  = histeq(im_in);
im_insta = imread('resultados/im_insta.jpg');

% EQUALIZACAO
figure
% Imagem original
subplot(2,3,1);
imshow(im_in);
title("Original image");
subplot(2,3,4);
imhist(im_in);
title("Histogram");

% Imagem equalizada
subplot(2,3,2);
imshow(imeq);
title("Equalized image");
subplot(2,3,5);
imhist(imeq);
title("Histogram");

% Filtro instagram
subplot(2,3,3);
imshow(im_insta);
title("Instagram filter");
subplot(2,3,6);
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