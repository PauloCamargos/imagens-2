%%
% Ruído e restauração de imagens
% Aula Imagens 2 -
% Autor: Paulo Camargos Silva
% Data: 29/11/2018
%%

pkg load image;

clear;

% Carregando imagem original
imoriginal = imread('../imagens-base/Im_original.jpg');

% Cálculo da variancia da imagem original
variancia_imoriginal = var(imoriginal(:));
disp('Original 3: ');
disp(variancia_imoriginal);

% Obs.: quanto maior o contraste, maior a var. de uma imagem. Deve-se avaliar
% o valor da var. juntamente como o tipo de filtro aplicado.

%% Aplicação dos Filtros

% Media 3x3 variancia
media3 = fspecial('average',3);
imagem_media3 = imfilter(imoriginal, media3);
var_media3 = var(imagem_media3(:));
disp('Var 3x3: ');
disp(var_media3);

% Media 7x7 e variancia
media7 = fspecial('average',7);
imagem_media7 = imfilter(imoriginal, media7);
var_media7 = var(imagem_media7(:));
disp('Var 7x7: ');
disp(var_media7);

% Mediana 3x3 e variancia
imagem_mediana3 = medfilt2(imoriginal); % 3x3 default
var_mediana3 = var(imagem_mediana3(:))
disp('Var mediana 3x3: ');
disp(var_mediana3);
figura1 = figure(1)
imshow(imagem_mediana3, [0,255]);
saveas(figura1, 'resultados/melhor_mediana_3.png');

% Media geométrica
I = imoriginal;
tam = 3;
colzero = zeros(size(I,1), (tam-1)/2);
linzero = zeros((tam-1)/2, size(I,2) + (tam-1));

Iz = [colzero I colzero];
Iz = [linzero; Iz ; linzero];

imagem_geometrica3 = uint8(zeros(size(imoriginal)));

for l = 1:size(I, 1)
    for c = 1:size(I, 2)
        janela = Iz(l : l + (tam-1), c:c  + (tam-1));
        imagem_geometrica3(l,c) = (prod(janela(:)))^(1/(tam*tam));
    end
end

var_geometrica3 = var(imagem_geometrica3(:));
disp('Var geometrica: ');
disp(var_geometrica3);
imshow(imagem_geometrica3);

% Plotando as imagens
figura2= figure
subplot(2,2,1);
imshow(imagem_media3, [0,255]);
str = sprintf('Media 3x3 e var = %d', round(var_media3));
title(str)

subplot(2,2,2);
imshow(imagem_media7, [0,255]);
str = sprintf('Media 7x7 e var = %d', round(var_media7));
title(str)

subplot(2,2,3);
imshow(imagem_mediana3, [0,255]);
str = sprintf('Mediana 3x3 e var = %d', round(var_mediana3));
title(str)

subplot(2,2,4);
imshow(imagem_geometrica3, [0,255]);
str = sprintf('M. Geometrica e var = %d', round(var_geometrica3));
title(str)
saveas(figura2, 'resultados/ruido_restauracao.png');

input('Quit code? ');