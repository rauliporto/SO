#!/bin/bash +x
#caso o ficheiro nao exista cria um novo
if [ ! -f "lista_negra_medicos.txt" ]
then
touch lista_negra_medicos.txt
fi

echo "Medicos que nao cumprem os requisitos"
#Mostra o medicos a colocar na lista negra
cat medicos.txt | awk -F ';' '{if($6>'6' && $5<'5'){print $0}}'
echo "Deseja atualizar a lista negra? (y/n)"
read opcao
shopt -s nocasematch
#Verifica se quer atualizar e se sim reescreve o ficheiro
if [ $opcao=="y" ] || [ $opcao=="Y" ]
then
#Filtra todos os registos que cumprem os requesitos e grava no ficheiro
cat medicos.txt | awk -F ';' '{if($6>'6' && $5<'5'){print $0}}' > lista_negra_medicos.txt
fi
#cat lista_negra_medicos.txt
cat lista_negra_medicos.txt

