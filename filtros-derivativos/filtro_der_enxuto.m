% PROGRAMA PARA APLICAÇÃO DE FILTROS DERIVATIVOS %
% pkg load image

% Lendo imagens originais
imagens = {
  imread('../imagens-base/Im_original.jpg');
  imread('../imagens-base/RXjoelho.jpg')
};

% Declarando as máscaras
mascaras = {
  [-1 0 ; 0 1];             % roberts quatro (-1)
  [0 -1; 1 0];              % roberts quatro rot. (-1)
  [-1 1];                   % roberts dois hori
  [1 -1];                   % robets dois hori rot
  [-1 ; 1];                 % roberts dois vert
  [1 ; -1];                 % roberts dois vert rot
  [1 0; 0 -1];              % roberts quatro
  [0 1; -1 0];              % roberts quatro rot.
  [-1 -1 -1; 0 0 0; 1 1 1]; % prewitt
  [-1 0 1; -1 0 1;-1 0 1];  % prewitt rotacionado
  [-1 -2 -1; 0 0 0; 1 2 1]; % sobel
  [-1 0 1; -2 0 2; -1 0 1] % sobel rotacionado
};

titulos = {
  "Original"; 
  "Roberts quatro (-1)"; 
  "Roberts quatro rotacionado (-1)";
  "Roberts dois horizontal";
  "Roberts dois horizontal rotac";
  "Roberts dois vertical";
  "Roberts dois vertical rotac";  
  "Robert quatro";
  "Roberto quatro rotacionado"; 
  "Prewitt";
  "Prewitt rotacionado";
  "Sobel";
  "Sobel rotacionado"
};

% saidas - MAMA ORIGINAL
qnt_img_originais = 2;
qnt_mascaras = 12;

for i=1:qnt_img_originais
  % Grad Quatro
  for j=1:qnt_mascaras
    imagens{i, j+1} = imagens{i, 1} + imfilter(imagens{i,1}, mascaras{j,1}); % salvando array com {imagem original, resultado masc. 1, 2,..., resultado masc. n}
    figura = figure;
    subplot(1, 2, 1);
    imshow(uint8(imagens{i, 1}));
    title(titulos{1, 1});

    subplot(1, 2, 2);
    imshow(uint8(imagens{i, j+1}));
    title(titulos{j+1, 1});

    % saveas(figura,strcat("./resultados/",num2str(i),'-',titulos{j+1, 1}),'png')

    disp(titulos{j+1, 1});
    disp(mascaras{j,1});
    
    % pause(0.2);
  end
end

prompt = 'Fechar figuras? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end

if str=='Y' || str=='y'
  close all
else
  pause(60)
end

disp("Programa finalizado!");