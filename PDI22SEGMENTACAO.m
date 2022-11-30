close all
clear all

imOriginal = imread('C:\Users\Adriano\Pictures\nauplio.jpg');

im = imOriginal(:,:,1) - imOriginal(:,:,2);
imBor = im;
for i=7:size(imBor,1) - 6
  for j=7:size(imBor,2) - 6
    px = im(i-6:i+6,j-6:j+6);
    V2=sort(px);
  imBor(i,j) = V2(60);
  end
end

figure(1);
imshow(imBor);

%imhist(imBor)

minValue = min(min(imBor));
maxValue = max(max(imBor));
imAlar = uint8((double(imBor-minValue)./double(maxValue-minValue))*255);

%imhist(imAlar)

figure(2);
imshow(imAlar);

imManual = imBor;

valeFixo = 10;

for(i=1:size(imBor,1))
  for(j=1:size(imBor,2))
    if(imBor(i,j)<valeFixo)
      imManual(i,j)=0;
    else
      imManual(i,j) = 1;
    endif
  endfor
endfor

imManual = logical(imManual);
figure('Name','Mascara com corte manual de histograma');
imshow(imManual);

imAlmen = zeros(size(imOriginal,1)+2,size(imOriginal,2)+2);
for(i=2:size(imAlmen,1)-1)
  for(j=2:size(imAlmen,2)-1)
    imAlmen(i,j) = imManual(i-1, j-1);
  endfor
endfor

clear imManual;
imManual = imAlmen;
imsaida = imManual;


EE = [1 1 1; 1 1 1; 1 1 1]; %3x3

for(i=2:size(imManual,1)-1)
  for(j=2:size(imManual,2)-1)
    if(imManual(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(imManual(i-1, j-1)==EE(1,1) && (imManual(i-1,j)==1) && (imManual(i-1,j+1)==1) && ...
         imManual(i, j-1)==1 && (imManual(i,j)==1) && (imManual(i,j+1)==1) && ...
         imManual(i+1, j-1)==1 && (imManual(i+1,j)==1) && (imManual(i+1,j+1)==1))
         imsaida(i,j) = 0;
      endif
    endif
  endfor
endfor

figure('Name','Imagem erodida')
imshow(imsaida)

imsaida2 = imsaida;

for(i=2:size(imsaida,1)-1)
  for(j=2:size(imsaida,2)-1)
    if(imsaida(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(imsaida(i-1, j-1)==EE(1,1) && (imsaida(i-1,j)==1) && (imsaida(i-1,j+1)==1) && ...
         imsaida(i, j-1)==1 && (imsaida(i,j)==1) && (imsaida(i,j+1)==1) && ...
         imsaida(i+1, j-1)==1 && (imsaida(i+1,j)==1) && (imsaida(i+1,j+1)==1))
         imsaida2(i,j) = 0;
      endif
    endif
  endfor
endfor

figure('Name','Imagem erodida 2')
imshow(imsaida2)

imsaida3 = imsaida2;

for(i=2:size(imsaida2,1)-1)
  for(j=2:size(imsaida2,2)-1)
    if(imsaida2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(imsaida2(i-1, j-1)==EE(1,1) && (imsaida2(i-1,j)==1) && (imsaida2(i-1,j+1)==1) && ...
         imsaida2(i, j-1)==1 && (imsaida2(i,j)==1) && (imsaida2(i,j+1)==1) && ...
         imsaida2(i+1, j-1)==1 && (imsaida2(i+1,j)==1) && (imsaida2(i+1,j+1)==1))
         imsaida3(i,j) = 0;
      endif
    endif
  endfor
endfor

figure('Name','Imagem erodida 3')
imshow(imsaida3)

imsaida4 = imsaida3;

for(i=2:size(imsaida3,1)-1)
  for(j=2:size(imsaida3,2)-1)
    if(imsaida3(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(imsaida3(i-1, j-1)==EE(1,1) && (imsaida3(i-1,j)==1) && (imsaida3(i-1,j+1)==1) && ...
         imsaida3(i, j-1)==1 && (imsaida3(i,j)==1) && (imsaida3(i,j+1)==1) && ...
         imsaida3(i+1, j-1)==1 && (imsaida3(i+1,j)==1) && (imsaida3(i+1,j+1)==1))
         imsaida4(i,j) = 0;
      endif
    endif
  endfor
endfor

figure('Name','Imagem erodida 4')
imshow(imsaida4)


imsaida4copia = imsaida4;

im2 = imsaida4;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(im2(i-1, j-1)==EE(1,1) && (im2(i-1,j)==1) && (im2(i-1,j+1)==1) && ...
         im2(i, j-1)==1 && (im2(i,j)==1) && (im2(i,j+1)==1) && ...
         im2(i+1, j-1)==1 && (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
         %imsaida(i,j) = 0;
         imsaida4(i-1, j-1)= 1;
         imsaida4(i-1,j) = 1;
         imsaida4(i-1,j+1) = 1;
         imsaida4(i, j-1) = 1;
         imsaida4(i,j+1) = 1;
         imsaida4(i+1, j-1) = 1;
         imsaida4(i+1,j) = 1;
         imsaida4(i+1,j+1) = 1;
      endif
    endif
  endfor
endfor

figure('Name','Imagem dilatada 1')
imshow(imsaida4)

imsaida4copia = imsaida4;

im2 = imsaida4;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(im2(i-1, j-1)==EE(1,1) && (im2(i-1,j)==1) && (im2(i-1,j+1)==1) && ...
         im2(i, j-1)==1 && (im2(i,j)==1) && (im2(i,j+1)==1) && ...
         im2(i+1, j-1)==1 && (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
         %imsaida(i,j) = 0;
         imsaida4(i-1, j-1)= 1;
         imsaida4(i-1,j) = 1;
         imsaida4(i-1,j+1) = 1;
         imsaida4(i, j-1) = 1;
         imsaida4(i,j+1) = 1;
         imsaida4(i+1, j-1) = 1;
         imsaida4(i+1,j) = 1;
         imsaida4(i+1,j+1) = 1;
      endif
    endif
  endfor
endfor

figure('Name','Imagem dilatada 2')
imshow(imsaida4)

imsaida4copia = imsaida4;

im2 = imsaida4;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(im2(i-1, j-1)==EE(1,1) && (im2(i-1,j)==1) && (im2(i-1,j+1)==1) && ...
         im2(i, j-1)==1 && (im2(i,j)==1) && (im2(i,j+1)==1) && ...
         im2(i+1, j-1)==1 && (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
         %imsaida(i,j) = 0;
         imsaida4(i-1, j-1)= 1;
         imsaida4(i-1,j) = 1;
         imsaida4(i-1,j+1) = 1;
         imsaida4(i, j-1) = 1;
         imsaida4(i,j+1) = 1;
         imsaida4(i+1, j-1) = 1;
         imsaida4(i+1,j) = 1;
         imsaida4(i+1,j+1) = 1;
      endif
    endif
  endfor
endfor

figure('Name','Imagem dilatada 3')
imshow(imsaida4)

imsaida4copia = imsaida4;

im2 = imsaida4;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(im2(i-1, j-1)==EE(1,1) && (im2(i-1,j)==1) && (im2(i-1,j+1)==1) && ...
         im2(i, j-1)==1 && (im2(i,j)==1) && (im2(i,j+1)==1) && ...
         im2(i+1, j-1)==1 && (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
         %imsaida(i,j) = 0;
         imsaida4(i-1, j-1)= 1;
         imsaida4(i-1,j) = 1;
         imsaida4(i-1,j+1) = 1;
         imsaida4(i, j-1) = 1;
         imsaida4(i,j+1) = 1;
         imsaida4(i+1, j-1) = 1;
         imsaida4(i+1,j) = 1;
         imsaida4(i+1,j+1) = 1;
      endif
    endif
  endfor
endfor

figure('Name','Imagem dilatada 4')
imshow(imsaida4)

imsaida4copia = imsaida4;

im2 = imsaida4;

for(i=2:size(im2,1)-1)
  for(j=2:size(im2,2)-1)
    if(im2(i,j)==1)
      %verificando se o EE est� contido na frente (objeto)
      if!(im2(i-1, j-1)==EE(1,1) && (im2(i-1,j)==1) && (im2(i-1,j+1)==1) && ...
         im2(i, j-1)==1 && (im2(i,j)==1) && (im2(i,j+1)==1) && ...
         im2(i+1, j-1)==1 && (im2(i+1,j)==1) && (im2(i+1,j+1)==1))
         %imsaida(i,j) = 0;
         imsaida4(i-1, j-1)= 1;
         imsaida4(i-1,j) = 1;
         imsaida4(i-1,j+1) = 1;
         imsaida4(i, j-1) = 1;
         imsaida4(i,j+1) = 1;
         imsaida4(i+1, j-1) = 1;
         imsaida4(i+1,j) = 1;
         imsaida4(i+1,j+1) = 1;
      endif
    endif
  endfor
endfor

figure('Name','Imagem dilatada 5')
imshow(imsaida4)

qtdObjetos = size(unique(imsaida4),1)-1

imFinal = uint8(zeros(size(imOriginal,1), size(imOriginal,2), 3));
for(i=1:size(imOriginal,1))
  for(j=1:size(imOriginal,2))
    if(imsaida4(i,j)==1)
      imFinal(i,j,:)=imOriginal(i,j,:);
    else
      imFinal(i,j,:)=255;
    endif
  endfor
endfor
figure('Name','Imagem final segmentada');
imshow(imFinal)

qtdObjetos = size(unique(imFinal),1)+1
