clear; clc;

% Fatores de soma/multiplicacao: +bri, -bri, +cont, -cont
fatores = [100, 50, 1.3, 0.7];

% Leitura das imagens
imagens = {
  imread('../imagens-base/arteriaBMP.bmp');
  imread('../imagens-base/FraturaJoelho.jpg');
  imread('../imagens-base/dedo.jpg');
  imread('../imagens-base/RXjoelho.jpg')
};

% Medias 
medias = zeros(4,5);

% Titulos para os graficos
titulos = {"Original", "Mais Brilho", "Menos Brilho", "Mais Contraste", "Menos Contraste"};

% Para cada imagem, faca
for i=1:4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alteracoes de propriedade das imagens: Brilho e contraste
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Aumentando o brilho 
  imagens{i,2} = imagens{i} + fatores(1); % +Brilho
  % Diminuindo o brilho
  imagens{i,3} = imagens{i} - fatores(2); % -Brilho
  % Aumentando o contraste
  imagens{i,4} = imagens{i} * fatores(3); % +Cont
  % Diminuindo o contraste
  imagens{i,5} = imagens{i} * fatores(4); % -Cont
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculo de media
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  medias(i,1) = mean(imagens{i,1}(:)); % Original
  medias(i,2) = mean(imagens{i,2}(:)); % +brilho
  medias(i,3) = mean(imagens{i,3}(:)); % -brilho
  medias(i,4) = mean(imagens{i,4}(:)); % +cont
  medias(i,5) = mean(imagens{i,5}(:)); % -cont 
  
  for j=1:5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrando figuras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(i);
    %% Original
    subplot(2,5,j);
    imshow(uint8(imagens{i,j}));
    title(titulos(j)); 
    % hist arteria original
    subplot(2,5,j+5);
    imhist(uint8(imagens{i,j}));
    title("Histograma"); 
    end
end

clear i j titulos;