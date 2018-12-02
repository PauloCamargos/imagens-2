%% 
% TRABALHO FINAL DE IMAGENS 2 - PORTIFÓLIO
% Autor: Paulo Camargos Silva (https://github.com/PauloCamargos)
% Data: 0/12/2013
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image
clear; clc;

% Leitura das imagens
imagens = {
  imread('../imagens-base/PauloCamargos_RM pescoço4.jpg');
  imread('../imagens-base/PauloCamargos_RMabdomen.jpg');
};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Brilho
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc;

% Fatores de soma/multiplicacao: [+bri, -bri, +cont, -cont]
fatores = [100, 50, 1.3, 0.7];

% Medias 
% 2 imagens, 5 resultados {original, +brilho, -brilho, +cont, -cont}
medias = zeros(2,5); 

% Titulos para os graficos
titulos = {"Original", "Mais Brilho", "Menos Brilho", "Mais Contraste", "Menos Contraste"};

% Para cada imagem, faca
for i=1:2
  % Alteracoes de propriedade das imagens: Brilho e contraste
  % Aumentando o brilho 
  imagens{i,2} = imagens{i} + fatores(1); % +Brilho
  % Diminuindo o brilho
  imagens{i,3} = imagens{i} - fatores(2); % -Brilho
  % Aumentando o contraste
  imagens{i,4} = imagens{i} * fatores(3); % +Cont
  % Diminuindo o contraste
  imagens{i,5} = imagens{i} * fatores(4); % -Cont
  
  % Calculo de media
  medias(i,1) = mean(imagens{i,1}(:)); % Original
  medias(i,2) = mean(imagens{i,2}(:)); % +brilho
  medias(i,3) = mean(imagens{i,3}(:)); % -brilho
  medias(i,4) = mean(imagens{i,4}(:)); % +cont
  medias(i,5) = mean(imagens{i,5}(:)); % -cont 
  
  % para cada figura (uma de brilho, outra constraste)
  for j=1:2 
    % Mostrando figuras
    figure
    
    for k=1:6
      %% Original
      subplot(2,3,k);
      imshow(uint8(imagens{i,j}));
      titulo = titulos{k}
      titulo = horzcat[titulo, printf(' (media=%d)', )];
      title(titulo); 

      % histograma
      subplot(2,3,k+3);
      imhist(uint8(imagens{i,j}));
      titulo = horzcat['Hist. ', titulos{k}]
      title(titulo); 
    end

    % salvando figura
    
    saveas(gcf,'')
  end

end

clear i j titulos;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contraste
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equalização de histograma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funções de transformação de intensidade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   % Potência, log, exp...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtro de suavização (borda...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros espaciais de realce (laplace, quatro/oito pos/neg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros derivativos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros de frequências
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Técnicas de restauração
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%