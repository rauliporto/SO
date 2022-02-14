#!/bin/bash
#Verifica se a localidade do paciente é igual à inserida
if [[  "$#" > "0" ]]
then
#conta o numero de ocorrencias
contador=$( cat pacientes.txt | cut -d ";" -f3 | grep -i $1 | wc -l )
echo "Numero de Pacientes em" $1 ":" $contador
fi

#Verifica se os valores do medico sao superiores ao inserido em argumento
if [[  "$#" == "2" ]]
then
valor=$2
#conta o numero de ocorrencias
contador=$( cat medicos.txt | awk -F ';' '{if($7>'$valor'){print $7}}' | wc -l )
echo "Numero de Medicos com valor superior a" $2 ":" $contador
fi
