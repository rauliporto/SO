#!/bin/bash

#Verifica se o ficheiro existe
if [ -f "pacientes.txt" ]
then
#Apaga o ficheiro
rm pacientes.txt
fi

#Cria um ficheiro novo 
touch pacientes.txt

#Filtra o numero e o nome e adiciona linha a linha ao ficheiro dos pacientes.txt
cat /etc/passwd | grep ^a[0-9] | head | cut -d ":" -f1,5 | sed "s/a//" | sed "s/:/;/" | sed "s/,,,//" | while read line;
do
saldo="100"
telemovel=""
localidade=""
numero=$(echo $line | cut -d ";" -f1)
nome=$(echo $line | cut -d ";" -f2)
email=$numero'@iscte-iul.pt'
echo "$numero;$nome;$localidade;$telemovel;a$email;$saldo" >> pacientes.txt	
done

