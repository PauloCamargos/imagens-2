% PROGRAMA PARA APLICAÇÃO DE FILTROS DERIVATIVOS %
% pkg load image

% Lendo imagens originais
mama_original = imread('../imagens-base/Im_original.jpg');
fratura_joelho = imread('../imagens-base/FraturaJoelho.jpg');

% Declarando as máscaras
quatro_esquerda = [-1 0 ; 0 1];
quatro_direta = [0 -1; 1 0];
dois_horizontal = [-1 1];
dois_vertical = [-1 ; 1]
borda_roberts_h1 = [1 0; 0 -1];
borda_roberts_h2 = [0 1; -1 0];
borda_prewitt_h1 = [-1 -1 -1; 0 0 0; 1 1 1];
borda_prewitt_h2 = [-1 0 1; -1 0 1;-1 0 1];
borda_sobel_h1  = [-1 -2 -1; 0 0 0; 1 2 1];

% saidas - MAMA ORIGINAL
quatro_esquerda_mama_original = imfilter(mama_original, quatro_esquerda);
quatro_direta_mama_original = imfilter(mama_original, quatro_direta);
dois_horizontal_mama_original = imfilter(mama_original, dois_horizontal);
dois_vertical_mama_original = imfilter(mama_original, dois_vertical);
borda_roberts_h1_mama_original = imfilter(mama_original, borda_roberts_h1);
borda_roberts_h2_mama_original = imfilter(mama_original, borda_roberts_h2);
borda_prewitt_h1_mama_original = imfilter(mama_original, borda_prewitt_h1);
borda_prewitt_h2_mama_original = imfilter(mama_original, borda_prewitt_h2);
borda_sobel_h1_h2_mama_original = imfilter(mama_original, borda_sobel_h1);

% saidas - FRATURA JOELHO
quatro_esquerda_fratura_joelho = imfilter(fratura_joelho, quatro_esquerda);
quatro_direta_fratura_joelho = imfilter(fratura_joelho, quatro_direta);
dois_horizontal_fratura_joelho = imfilter(fratura_joelho, dois_horizontal);
dois_vertical_fratura_joelho = imfilter(fratura_joelho, dois_vertical);
borda_roberts_h1_fratura_joelho = imfilter(fratura_joelho, borda_roberts_h1);
borda_roberts_h2_fratura_joelho = imfilter(fratura_joelho, borda_roberts_h2);
borda_prewitt_h1_fratura_joelho = imfilter(fratura_joelho, borda_prewitt_h1);
borda_prewitt_h2_fratura_joelho = imfilter(fratura_joelho, borda_prewitt_h2);
borda_sobel_h1_h2_fratura_joelho = imfilter(fratura_joelho, borda_sobel_h1);

% MAMAORIGINAL -> QUATRO ESQUERDA
  figure
  subplot(1, 3, 1);
  imshow(uint8(mama_original));
  title("MAMA ORIGINAL");
  
  subplot(1, 3, 2);
  imshow(uint8(quatro_esquerda_mama_original));
  title("Filtro quatro esquerda");
  
  subplot(1, 3, 2);
  imshow(uint8(quatro_esquerda_mama_original + mama_original));
  title("Res. quatro esquerda");  

% MAMAORIGINAL -> QUATRO DIRETA
  figure
  subplot(1, 3, 1);
  imshow(uint8(quatro_direta_fratura_joelho));
  title("MAMA ORIGINAL");
  
  subplot(1, 3, 2);
  imshow(uint8(quatro_direta_fratura_joelho));
  title("Filtro quatro direta");
  
  subplot(1, 3, 2);
  imshow(uint8(quatro_direta_fratura_joelho + mama_original));
  title("Res. quatro direta");  
  
% MAMAORIGINAL -> DOIS HORIZONTAL
  figure
  subplot(1, 3, 1);
  imshow(uint8(dois_horizontal_mama_original));
  title("MAMA ORIGINAL");
  
  subplot(1, 3, 2);
  imshow(uint8(dois_horizontal_mama_original));
  title("Filtro dois horizontal");
  
  subplot(1, 3, 2);
  imshow(uint8(dois_horizontal_mama_original + mama_original));
  title("Res. quatro direta");  