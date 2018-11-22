
clc;
ImOriginal= imread('../imagens-base/TCcranio.jpg');


%FFT2 faz a transformada de fourier
espectro=fft2 (double(ImOriginal));

%FFTSHIFT centraliza o espectroc
espectroC=fftshift(espectro);  % centro do espectro eh a freque mais baixa

%visualiza��o do espectro

EspLog=abs(espectroC);
EspLog=20*log(1+EspLog);
EspLog=uint8(EspLog);



%processamento no dominio da frequencia

%Contruindo Fitro Notch % Seleciona o tom medio (frequencia mais baixa) da imagem

% o filtro (H(u,v)) deve conter o mesmo numero de pontos da imagem original(F(u,v));
% G(u,v) = H(u,v).*F(u,v) 

[rows, cols ] = size ( ImOriginal )

% remover ponto central ( freq = 0 )
mask = ones ( rows, cols ); %cria uma m�scara de mesma dimens�o da imagem original com valores um (1);

mask ( ceil( rows / 2 ) + 1, ceil( cols / 2 ) + 1 ) = 0;

fnotch = mask .* espectroC;

Saida = ifftshift( fnotch );

%mostrar parte real da fun��o

im_out = uint8( real ( ifft2 ( Saida ) ));



media = sum ( ImOriginal(:) ) / ( rows * cols )

figure (2);

subplot(1,4,1);
imshow(ImOriginal);
title(' imagem original');

subplot(1,4,2);


imshow(im_out);
title(' imagem filtrada_Notch');

imMedia=abs(ImOriginal-media);

subplot(1,4,3);
imshow(uint8(imMedia));
title(' Original menos m�dia');




%Filtro passa baixa quadrado


maskIdealQ=zeros ( rows, cols ); %cria uma m�scara de mesma dimens�o da imagem original com valores um (0);

diametro_quadrado = 100;

maskIdealQ((rows/2 - diametro_quadrado):(rows/2 +diametro_quadrado), (cols/2 -diametro_quadrado) : (cols/2 + diametro_quadrado)  ) = 1;
 
 
fpbIdeal=espectroC.*maskIdealQ;

saidaIdeal= ifftshift(fpbIdeal);

im_outIdeal = uint8 (real (ifft2(saidaIdeal)));

subplot (1,4,4);
imshow(im_outIdeal);
title('Fitrada PBI corte20');

figure(1);
subplot (1,3,1);
imshow(ImOriginal);
subplot(1,3,2);
imshow(EspLog);
subplot (1,3,3);
imshow(maskIdealQ);

% Filtro passa alta
maskIdealQ=zeros ( rows, cols ); %cria uma m�scara de mesma dimens�o da imagem original com valores um (0);

diametro_quadrado = 20;

maskIdealQ((rows/2 - diametro_quadrado):(rows/2 +diametro_quadrado), (cols/2 -diametro_quadrado) : (cols/2 + diametro_quadrado)  ) = 1;
maskIdealQ = 1 - maskIdealQ;
 
fpaIdeal=espectroC.*maskIdealQ;

saidaIdeal= ifftshift(fpaIdeal);

im_outIdeal = uint8 (real (ifft2(saidaIdeal)));
figure(3);
subplot (1,4,1);
imshow(uint8(ImOriginal));
subplot(1,4,2);
imshow(maskIdealQ);
subplot (1,4,3);
imshow(im_outIdeal);
title(strcat('Fitrada PAI corte ', diametro_quadrado));
subplot (1,4,4);
imshow(uint8(im_outIdeal + ImOriginal));

input('Aperte qualquer tecla para sair...');