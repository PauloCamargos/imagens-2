matriz = [100,0,0,0,0,0; 
          100,0,200,200,10,0;
          100,0,10,10,200,0;
          100,0,10,100,200,0;
          100,250,250,250,250,250];
          
filtro_nove = (1/9) * ones(3);
filtro_dezesseis = (1/16) * [0 2 0; 2 8 2; 0 2 0];
filtro_maior = (1/81) * ones(9);

out_nove      = imfilter(matriz, filtro_nove);
out_dezesseis = imfilter(matriz, filtro_dezesseis);
out_maior     = imfilter(matriz, filtro_maior); 
%out_mediana   = fspecial("average", 3);

figure
subplot(1,3,1);
imshow(uint8(out_nove));
title("Media");

subplot(1,3,2);
imshow(uint8(out_dezesseis));
title("Media Ponderada");

%subplot(1,4,3);
%imshow(uint8(out_mediana));
%title("Mediana");

subplot(1,3,3);
imshow(uint8(matriz));
title("Original");

figure 
imshow(uint8(out_maior));