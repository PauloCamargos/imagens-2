%%
% TRABALHO FINAL DE IMAGENS 2 - PORTFOLIO
% Autor: Paulo Camargos Silva (https://github.com/PauloCamargos)
% Data: 8/12/2018
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pkg load image
clear; clc;

% Leitura das imagens
% Atualize aqui o caminho para suas imagems.
imagens = {
    imread('../imagens-base/PauloCamargos_RM pescoco4.jpg');
    imread('../imagens-base/PauloCamargos_RMabdomen.jpg');
    };

%%
% Chamada de fun��es para gera��o das imagens. Descomente as fun��es em que se deseja 
% gerar imagens. Observe o caminho de sa�da das imagens. 

% brilho_contraste(imagens);
% equalizacao(imagens);
% transformacao_intensidade(imagens);
% filtro_suavizacao(imagens);
% filtro_espacial(imagens);
% filtro_derivativo(imagens);
filtro_frequencias(imagens);
% restauracao(imagens);

close all;
% clear, clc;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BRILHO E CONTRASTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function brilho_contraste(imagens)

% Fatores de soma/multiplicacao: [+bri, -bri, +cont, -cont]
fatores = [100, 100, 1.5, 0.7];

% Medias
% 2 imagens, 5 resultados {original, +brilho, -brilho, +cont, -cont}
medias = zeros(2,5);

% Titulos para os graficos
titulos = {'Original', 'Mais Brilho', 'Menos Brilho', 'Mais Contraste', 'Menos Contraste'};

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
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Brilho
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figura_brilho = figure;
    subplot(2,3,1);
    imshow(uint8(imagens{i,1})); % img original
    titulo = horzcat('Original',sprintf(" med = %d",round(medias(i,1))));
    title(titulo)
    
    subplot(2,3,4);
    imhist(uint8(imagens{i,1})); % hist img original
    title(horzcat('Hist. ', 'Original'));
    
    %%%%%%%% mais brilho
    subplot(2,3,2);
    imshow(uint8(imagens{i,2})); % mais brilho
    titulo = horzcat('Mais brilho',sprintf(" med = %d",round(medias(i,2))));
    title(titulo)
    
    subplot(2,3,5);
    imhist(uint8(imagens{i,2})); % hist mais brilho
    title(horzcat('Hist. ', 'Mais brilho'));
    
    %%%%%%% menos brilho
    subplot(2,3,3);
    imshow(uint8(imagens{i,3})); % img menos brilho
    titulo = horzcat('Menos brilho',sprintf(" med = %d",round(medias(i,3))));
    title(titulo)
    
    subplot(2,3,6);
    imhist(uint8(imagens{i,3})); % hist img menos brilho
    title(horzcat('Hist. ','Menos brilho'));
    
    filename = horzcat(sprintf('../resultados/brilho_contraste/brilho-im-%i',i),'.png');
    disp(filename)
    saveas(figura_brilho,filename);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Contraste
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figura_constraste = figure;
    subplot(2,3,1);
    imshow(uint8(imagens{i,1})); % img original
    titulo = horzcat('Original',sprintf(" med = %d",round(medias(i,1))));
    title(titulo)
    
    subplot(2,3,4);
    imhist(uint8(imagens{i,1})); % hist img original
    title(horzcat('Hist. ', 'Original'));
    
    %%%%%%%% mais contraste
    subplot(2,3,2);
    imshow(uint8(imagens{i,4})); % img mais contraste
    titulo = horzcat('Mais contraste',sprintf(" med = %d",round(medias(i,4))));
    title(titulo)
    
    subplot(2,3,5);
    imhist(uint8(imagens{i,4})); % hist img mais contraste
    title(horzcat('Hist. ', 'Mais contraste'));
    
    %%%%%%% menos contraste
    subplot(2,3,3);
    imshow(uint8(imagens{i,5})); % img menos contraste
    titulo = horzcat('Menos contraste',sprintf(" med = %d",round(medias(i,5))));
    title(titulo)
    
    subplot(2,3,6);
    imhist(uint8(imagens{i,5})); % hist img menos contraste
    title(horzcat('Hist. ', 'Menos contraste'));
    
    filename = horzcat(sprintf('../resultados/brilho_contraste/constraste-im-%i',i),'.png');
    disp(filename)
    saveas(figura_constraste,filename);
    
end
close all;
clear i j titulos medias filename i figura_brilho figura_contraste fatores titulo;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equalizacao de histograma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function equalizacao(imagens)
for i=1:2
    im_in = imagens{i,1};
    im_copia = im_in;
    im_copia(im_in==0)=NaN;
    im_eq_copia = histeq(im_copia);
    
    figure
    % EQUALIZACAO
    % Imagem original
    subplot(2,2,1);
    imshow(im_in);
    title('Original');
    
    subplot(2,2,3);
    imhist(im_in);
    title('Histogram');
    
    % Imagem equalizada com preto modificado
    subplot(2,2,2);
    imshow(im_eq_copia);
    title('Equalizada');
    
    subplot(2,2,4);
    imhist(im_eq_copia);
    title('Hist. equal.');
    
    filename = horzcat(sprintf('../resultados/equalizacao/equalizacao-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename);
    
    close all;
end
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcoes de transformacao de intensidade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function transformacao_intensidade(imagens)

for i=1:2
    im_in  = imagens{i,1};
    
    r = 0:255;
    
    %negativo
    figure
    s( 1 + r ) = 255 - r;
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title("Original");
    %show plot de funcao
    subplot( 1, 3, 2 );
    plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    title("Fun��o Negativo");
    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/negativo-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename);
    
    %---------------------------------------------------------------------
    %---------------------------------------------------------------------
    
    %identidade
    s( 1 + r ) = r;
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title("Original");
    %show plot de funcao
    subplot( 1, 3, 2 ); plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    title("Fun��o Identidade");
    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/identidade-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %---------------------------------------------------------------------
    %---------------------------------------------------------------------
    
    %logaritmica
    figure
    factor = 5;
    s( 1 + r ) = ( 255 / log( 1 + 255 / factor ) ) * log( 1 + r / factor );
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title("Original");
    %show plot de funcao
    subplot( 1, 3, 2 ); plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    titulo = sprintf('Fun��o Log. (fator %d)',factor);
    title(titulo);
    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/log-im-%i-fator-%i',i,factor),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %---------------------------------------------------------------------
    %---------------------------------------------------------------------
    
    %exponencial
    figure
    factor = 15;
    s( 1 + r ) = ( 255 / ( exp( 255 / factor ) - 1 ) ) * ( exp( r / factor ) - 1 );
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title('Original');
    %show plot de funcao
    subplot( 1, 3, 2 ); plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    titulo = sprintf('Fun��o Exp. (fator %d)',factor);
    title(titulo);
    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/exp-im-%i-fator-%i',i,factor),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %---------------------------------------------------------------------
    %---------------------------------------------------------------------
    
    %potencia
    figure
    factor = 5;
    s( 1 + r ) = ( 255 / ( 255 .^ factor ) ) * ( r .^ factor );
%     s( 1 + r ) = r;
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title('Original');
    subplot( 1, 3, 2 ); plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    titulo = sprintf('Fun��o Pot. (fator %d)',factor);
    title(titulo);    %show plot de funcao    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/potencia-im-%i-fator-%i',i,factor),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %---------------------------------------------------------------------
    %---------------------------------------------------------------------
    %por faixas
    figure
    r0 = 0 ; s0 = 0;
    r1 = 10 ; s1 = 50;
    r2 = 150; s2 = 230;
    r3 = 255; s3 = 255;
    
    r = r0:r1;
    a = ( s1 - s0 ) / ( r1 - r0 );
    b = s0 - a * r0;
    s ( 1 + r ) = a * r + b;
    
    r = r1+1:r2;
    a = ( s2 - s1 ) / ( r2 - r1 );
    b = s1 - a * r1;
    s ( 1 + r ) = a * r + b;
    
    r = r2+1:r3;
    a = ( s3 - s2 ) / ( r3 - r2 );
    b = s2 - a * r2;
    s ( 1 + r ) = a * r + b;
    
    r = 0:255;
    
    im_out = s ( im_in + 1);
    %show imagem original
    subplot(1,3,1);
    imshow(mat2gray(im_in));
    title("Original");
    %show plot de funcao
    subplot( 1, 3, 2 ); plot( r , s );
    axis( [ 0, 255, 0, 255 ] );
    titulo = sprintf('Faixas r[%d,%d,%d,%d] e s[%d,%d,%d,%d]',r0,r1,r2,r3,s0,s1,s2,s3);
    title(titulo);
    xlabel('r');
    ylabel('s(r)');
    %show imagem processada
    subplot( 1, 3, 3 );
    imshow( mat2gray( im_out ) );
    title("Processada");
    
    filename = horzcat(sprintf('../resultados/transformacao_intensidade/faixas-im-%i-faixa-2',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    %---------------------------------------------------------------------
end
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtro de suavizacao (borda...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function filtro_suavizacao(imagens)

% Passa baixa
for i=1:2
    
    im_in = imagens{i,1};
    
    % Media 3x3
    media3 = fspecial('average',3);
    imagem_media3 = imfilter(im_in, media3);
    
    figure;
    subplot(1,2,1);
    imshow(uint8(im_in));
    title('Original')
    
    subplot(1,2,2);
    imshow(uint8(imagem_media3));
    titulo = sprintf('Media 3x3');
    title(titulo);
    
    filename = horzcat(sprintf('../resultados/suavizacao/media33-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    % Media 7x7
    media7 = fspecial('average',7);
    imagem_media7 = imfilter(im_in, media7);
    
    figure;
    subplot(1,2,1);
    imshow(uint8(im_in));
    title('Original')
    
    subplot(1,2,2);
    imshow(uint8(imagem_media7));
    titulo = sprintf('Media 7x7');
    title(titulo);
    
    filename = horzcat(sprintf('../resultados/suavizacao/media77-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    % Mediana
    imagem_mediana3 = medfilt2(im_in); % 3x3 default
    
    figure;
    subplot(1,2,1);
    imshow(uint8(im_in));
    title('Original')
    
    subplot(1,2,2);
    imshow(uint8(imagem_mediana3));
    titulo = sprintf('Mediana 3x3');
    title(titulo);
    
    filename = horzcat(sprintf('../resultados/suavizacao/mediana33-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)   
    
    
end

end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros espaciais de realce (laplace, quatro/oito pos/neg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function filtro_espacial(imagens)

for i=1:2
    matriz = imagens{i,1};
    
    filtro_laplace_quatro_negativo =  [0 1 0; 1 -4 1; 0 1 0];
    filtro_laplace_quatro_positivo = [0 -1 0; -1 4 -1; 0 -1 0];
    filtro_laplace_oito_negativo = [1 1 1; 1 -8 1; 1 1 1];
    filtro_laplace_oito_positivo = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    
    out_laplace_quatro_negativo      = imfilter(matriz, filtro_laplace_quatro_negativo);
    out_laplace_quatro_positivo    = imfilter(matriz, filtro_laplace_quatro_positivo);
    out_laplace_oito_negativo     = imfilter(matriz, filtro_laplace_oito_negativo);
    out_laplace_oito_positivo     = imfilter(matriz, filtro_laplace_oito_positivo);
    
    figure
    subplot(1,3,1);
    imshow(uint8(matriz));
    title("matriz");title("Original");
    
    subplot(1,3,2);
    imshow(uint8(out_laplace_quatro_negativo));
    title("Laplace Quatro Negativo");
    
    subplot(1,3,3);
    imshow(uint8(matriz + out_laplace_quatro_negativo));
    title("Res. Laplace Quatro Negativo");
    
    filename = horzcat(sprintf('../resultados/filtro_espacial/flaplace-4-neg-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %%%
    figure
    subplot(1,3,1);
    imshow(uint8(matriz));
    title("matriz");title("Original");
    
    subplot(1,3,2);
    imshow(uint8(out_laplace_quatro_positivo));
    title("Laplace Quatro Positivo");
    
    subplot(1,3,3);
    imshow(uint8(matriz + out_laplace_quatro_positivo));
    title("Res. Laplace Quatro Positivo");
    
    filename = horzcat(sprintf('../resultados/filtro_espacial/flaplace-4-pos-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %%%
    
    figure
    subplot(1,3,1);
    imshow(uint8(matriz));
    title("matriz");title("Original");
    
    subplot(1,3,2);
    imshow(uint8(out_laplace_oito_negativo));
    title("Laplace Oito Negativo");
    
    subplot(1,3,3);
    imshow(uint8(matriz + out_laplace_oito_negativo));
    title("Res. Laplace Oito Negativo");
    
    filename = horzcat(sprintf('../resultados/filtro_espacial/flaplace-8-neg-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %%%
    
    figure
    subplot(1,3,1);
    imshow(uint8(matriz));
    title("matriz");title("Original");
    
    subplot(1,3,2);
    imshow(uint8(out_laplace_oito_positivo));
    title("Laplace Oito Positivo");
    
    subplot(1,3,3);
    imshow(uint8(matriz + out_laplace_oito_positivo));
    title("Res .Laplace Oito Positivo");
    
    
    filename = horzcat(sprintf('../resultados/filtro_espacial/flaplace-8-pos-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros derivativos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function filtro_derivativo(imagens)

% Declarando as m�scaras
mascaras = {
    [-1 0 ; 0 1];             % roberts quatro (-1)
    %   [0 -1; 1 0];              % roberts quatro rot. (-1)
    %   [-1 1];                   % roberts dois hori
    %   [1 -1];                   % robets dois hori rot
    %   [-1 ; 1];                 % roberts dois vert
    %   [1 ; -1];                 % roberts dois vert rot
    %   [1 0; 0 -1];              % roberts quatro
    %   [0 1; -1 0];              % roberts quatro rot.
    [-1 -1 -1; 0 0 0; 1 1 1]; % prewitt
    %   [-1 0 1; -1 0 1;-1 0 1];  % prewitt rotacionado
    [-1 -2 -1; 0 0 0; 1 2 1]; % sobel
    %   [-1 0 1; -2 0 2; -1 0 1] % sobel rotacionado
    };

titulos = {
    "Original";
    "Roberts-quatro";
    %   "Roberts quatro rotacionado (-1)";
    %   "Roberts dois horizontal";
    %   "Roberts dois horizontal rotac";
    %   "Roberts dois vertical";
    %   "Roberts dois vertical rotac";
    %   "Robert quatro";
    %   "Roberto quatro rotacionado";
    "Prewitt";
    %   "Prewitt rotacionado";
    "Sobel";
    %   "Sobel rotacionado"
    };

qnt_img_originais = 2;
qnt_mascaras = 3;

for i=1:qnt_img_originais
    % Grad Quatro
    for j=1:qnt_mascaras
        imagens{i, j+1} = imagens{i, 1} + imfilter(imagens{i,1}, mascaras{j,1}); % salvando array com {imagem original, resultado masc. 1, 2,..., resultado masc. n}
        figure;
        subplot(1, 2, 1);
        imshow(uint8(imagens{i, 1}));
        title(titulos{1, 1});
        
        subplot(1, 2, 2);
        imshow(uint8(imagens{i, j+1}));
        title(titulos{j+1, 1});
        
        filename = horzcat(sprintf('../resultados/filtro_derivativo/derivativos-im-%i-%s',i,titulos{j+1, 1}),'.png');
        disp(filename)
        disp(titulos{j+1, 1})
        saveas(gcf,filename)
    end
end

% prompt = 'Fechar figuras? Y/N [Y]: ';
% str = input(prompt,'s');
% if isempty(str)
%     str = 'Y';
% end
%
% if str=='Y' || str=='y'
%   close all
% else
%   pause(60)
% end
%
% disp("Programa finalizado!");

end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtros de frequencias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function filtro_frequencias(imagens)
for i=1:2
    ImOriginal = imagens{i,1};
    
    %FFT2 faz a transformada de fourier
    espectro=fft2 (double(ImOriginal));
    
    %FFTSHIFT centraliza o espectroc
    espectroC=fftshift(espectro);  % centro do espectro eh a freque mais baixa
    
    %visualiza??o do espectro
    
    EspLog=abs(espectroC);
    EspLog=20*log(1+EspLog);
    EspLog=uint8(EspLog);
    
    %processamento no dominio da frequencia
    
    %Contruindo Fitro Notch % Seleciona o tom medio (frequencia mais baixa) da imagem
    
    % o filtro (H(u,v)) deve conter o mesmo numero de pontos da imagem original(F(u,v));
    % G(u,v) = H(u,v).*F(u,v)
    
    [rows, cols ] = size ( ImOriginal )
    
    % remover ponto central ( freq = 0 )
    mask = ones ( rows, cols ); %cria uma m?scara de mesma dimens?o da imagem original com valores um (1);
    
    mask ( ceil( rows / 2 ) + 1, ceil( cols / 2 ) + 1 ) = 0;
    
    fnotch = mask .* espectroC;
    
    Saida = ifftshift( fnotch );
    
    %mostrar parte real da fun??o
    
    im_out = uint8( real ( ifft2 ( Saida ) ));
    
    
    
    media = sum ( ImOriginal(:) ) / ( rows * cols )
    
    %     figure (2);
    %
    %     subplot(1,4,1);
    %     imshow(ImOriginal);
    %     title(' imagem original');
    %
    %     subplot(1,4,2);
    %
    %
    %     imshow(im_out);
    %     title(' imagem filtrada_Notch');
    %
    %     imMedia=abs(ImOriginal-media);
    %
    %     subplot(1,4,3);
    %     imshow(uint8(imMedia));
    %     title(' Original menos m?dia');
    
    
    
    
    %Filtro passa baixa quadrado
    
    
    maskIdealQ=zeros ( rows, cols ); %cria uma m?scara de mesma dimens?o da imagem original com valores um (0);
    
    diametro_quadrado = 100;
    
    maskIdealQ((rows/2 - diametro_quadrado):(rows/2 +diametro_quadrado), (cols/2 -diametro_quadrado) : (cols/2 + diametro_quadrado)  ) = 1;
    
    
    fpbIdeal=espectroC.*maskIdealQ;
    
    saidaIdeal= ifftshift(fpbIdeal);
    
    im_outIdeal = uint8 (real (ifft2(saidaIdeal)));
    
    figure;
    subplot (2,2,1);
    imshow(uint8(ImOriginal));
    titulo = sprintf('Original');
    title(titulo);
    
    subplot(2,2,2);
    imshow(maskIdealQ);
    titulo = sprintf('Mascara (diam=%d)',diametro_quadrado);
    title(titulo);
    
    subplot (2,2,3);
    imshow(im_outIdeal);
    titulo = sprintf('Fitrada PBI');
    title(titulo);
    
    subplot (2,2,4);
    imshow(uint8(im_outIdeal + ImOriginal));
    titulo = sprintf('Resultado');
    title(titulo);
    
    filename = horzcat(sprintf('../resultados/filtro_frequencias/PB-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    %     subplot (1,4,4);
    %     imshow(im_outIdeal);
    %     title(strcat('Fitrada PBI corte20', diametro_quadrado));
    %
    %     figure(1);
    %     subplot (1,3,1);
    %     imshow(ImOriginal);
    %     subplot(1,3,2);
    %     imshow(EspLog);
    %     subplot (1,3,3);
    %     imshow(maskIdealQ);
    %
    % Filtro passa alta
    maskIdealQ=zeros ( rows, cols ); %cria uma m?scara de mesma dimens?o da imagem original com valores um (0);
    
    diametro_quadrado = 20;
    
    maskIdealQ((rows/2 - diametro_quadrado):(rows/2 +diametro_quadrado), (cols/2 -diametro_quadrado) : (cols/2 + diametro_quadrado)  ) = 1;
    maskIdealQ = 1 - maskIdealQ;
    
    fpaIdeal=espectroC.*maskIdealQ;
    
    saidaIdeal= ifftshift(fpaIdeal);
    
    im_outIdeal = uint8 (real (ifft2(saidaIdeal)));
    figure;
    
    subplot (2,2,1);
    imshow(uint8(ImOriginal));
    titulo = sprintf('Original');
    title(titulo);
    
    subplot(2,2,2);
    imshow(maskIdealQ);
    titulo = sprintf('Mascara (diam=%d)',diametro_quadrado);
    title(titulo);
    
    subplot (2,2,3);
    imshow(im_outIdeal);
    titulo = sprintf('Fitrada PAI');
    title(titulo);
    
    subplot (2,2,4);
    imshow(uint8(im_outIdeal + ImOriginal));
    titulo = sprintf('Resultado');
    title(titulo);
    
    filename = horzcat(sprintf('../resultados/filtro_frequencias/PA-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)
    
    input('Aperte qualquer tecla para sair...');
end
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tecnicas de restauracao
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function restauracao(imagens)
for i=1:2
    % Carregando imagem original
    imoriginal = double(imagens{i,1});
    
    % C�lculo da variancia da imagem original
    variancia_imoriginal = var(imoriginal(:));
    disp('Original 3: ');
    disp(variancia_imoriginal);
    
    % Obs.: quanto maior o contraste, maior a var. de uma imagem. Deve-se avaliar
    % o valor da var. juntamente como o tipo de filtro aplicado.
    
    % Aplica��o dos Filtros
    
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
%     figura1 = figure(1)
%     imshow(imagem_mediana3, [0,255]);
%     saveas(figura1, 'resultados/melhor_mediana_3.png');
    
    % Media geom�trica
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
    
    var_geometrica3 = var(double(imagem_geometrica3(:)));
    disp('Var geometrica: ');
    disp(var_geometrica3);
%     imshow(imagem_geometrica3);
    
    % Plotando as imagens
    figure;
    subplot(2,2,1);
    imshow(imagem_media3, [0,255]);
    str = sprintf('Media 3x3 e var = %d', round(var_media3));
    title(str);
    
    subplot(2,2,2);
    imshow(imagem_media7, [0,255]);
    str = sprintf('Media 7x7 e var = %d', round(var_media7));
    title(str);
    
    subplot(2,2,3);
    imshow(imagem_mediana3, [0,255]);
    str = sprintf('Mediana 3x3 e var = %d', round(var_mediana3));
    title(str);
    
    subplot(2,2,4);
    imshow(imagem_geometrica3, [0,255]);
    str = sprintf('M. Geometrica e var = %d', round(var_geometrica3));
    title(str);

    filename = horzcat(sprintf('../resultados/restauracao/restauracao-im-%i',i),'.png');
    disp(filename)
    saveas(gcf,filename)    
    
    figure;
    imshow(imoriginal,[0,255])
    title('Original');

    filename = horzcat(sprintf('../resultados/restauracao/original-im-%i',i),'.png');
    disp(filename);
    saveas(gcf,filename);  
        
    input('Quit code? ');
end
end

