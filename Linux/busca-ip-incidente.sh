#!/bin/bash

#Verificar se possui 3 argumentos
if [ $# -lt 3 ]; then
   echo "Entre com 3 argumentos: 
	 1:Nome do arquivo de log a ser verificado;
	 2:IP Externo
	 3:Dia/Hora do log"
   exit 1
fi

Total_linhas=$(grep -c '' $1) #Pegar número de linhas do arquivo
Count=0
while IFS='' read -r line || [[ -n "$line" ]];
do 
   let Count++
	Linha=`expr $Count%4| bc`
	if [ $Linha -ne 0 ]; then #Tirar a linha em branco			
		if [ $Linha -eq 1 ]; then
			Vetor_Linha=($line)
			Dia="${Vetor_Linha[0]} ${Vetor_Linha[1]}"
			Data=$(date -d "$Dia" +%Y-%m-%d)
			Hora="${Vetor_Linha[2]}"
		fi
		if [ $Linha -eq 2  ]; then
			Vetor_Linha=($line)
			Ip_Interno=$(echo "${Vetor_Linha[2]}" $Ip_Interno | cut -d ':' -f 2 | cut -d '/' -f 1)			
		fi
		if [ $Linha -eq 3  ]; then
			Vetor_Linha=($line)
			Vazio=''
			Ip_Externo=$(echo "${Vetor_Linha[0]}" $Ip_Externo | cut -d ':' -f 2 | cut -d '/' -f 1)
			Aux=$(echo "${Vetor_Linha[0]}" $Vazio |cut -d ':' -f 2 | cut -d '/' -f 2)
			Ip_Externo=$(echo $Ip_Externo:${Aux[0]})
			Duracao="${Vetor_Linha[2]}"
			Seconds_D=$(echo  $Duracao | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
			Seconds_H=$(echo  $Hora | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
			S_Hora_Incidente_Inicial=$(($Seconds_H-$Seconds_D))
			if [ "$2" == "$Ip_Externo" ]; then
				Dia_incidente=$(echo $3 | cut -d ',' -f 1)
				Hora_incidente=$(echo $3 | cut -d ',' -f 2)
				if [ "$Dia_incidente" == "$Data" ]; then
					S_Hora_incidente=$(echo  $Hora_incidente | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
					if [ $S_Hora_incidente -ge $S_Hora_Incidente_Inicial ] && [ $S_Hora_incidente -le $Seconds_H ]; then
						echo "- --> IP Interno: $Ip_Interno"
						flag=1
					fi
				fi
			fi
		fi	
	fi
	if [ "$Count" ==  "$Total_linhas" ] && [ "$flag" != 1 ]; then
		echo "- --> IP Interno: nao encontrado!"
	fi	
done < $1
