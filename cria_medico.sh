#!/bin/bash

#Verifica se o ficheiro nÃ£o existe e em caso afirmativo cria
if [ ! -f medicos.txt ] 
then
touch medicos.txt
fi

#procura o numero exato do medico
numero=$(cat medicos.txt | cut -d ";" -f2 | grep -x $2)

# verifica se a var é vazia
if [ -z $numero ]
then
#adiciona o medico
rating=0
n_consultas=0
saldo=0
echo "$1;$2;$3;$4;$rating;$n_consultas;$saldo" >> medicos.txt
else
#Avisa que o registo já existe
echo "AVISO:O medico com o numero $numero ja foi inserido"
fi

#mosta a listagem
cat medicos.txt
