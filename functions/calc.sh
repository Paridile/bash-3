resultado=0.00
opc=0
suma() {
	localRes=0
	rgxPlus='(-?[0-9](\.[0-9+])?+)|res[[:space:]]*(\+[[:space:]]*(-?[0-9](\.[0-9+])?+)|res)+$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe la suma: " exp
		if [[ $exp =~ $rgxPlus ]]; then
			operation=(${exp//" + "/ })
			for i in $( seq 0 $((${#operation[@]} - 1)) ) 
			do
				if [ "${operation[$i]}" == "res" ];then
					sum=$resultado
					else
					sum=${operation[$i]}		
				fi
				localRes=$(bc <<< "scale=2; $localRes + $sum")								
			done	
			echo $localRes
			resultado=$localRes
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

resta() {
	localRes=0
	rgxPlus='^-?[0-9|res]+[[:space:]]*(-[[:space:]]*-?[0-9|res]+)+$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe la resta: " exp
		if [[ $exp =~ $rgxPlus ]]; then
			operation=(${exp//" - "/ })
			for i in $( seq 0 $((${#operation[@]} - 1)) ) 
			do
				if [ "${operation[$i]}" == "res" ];then
					sum=$resultado
					else
					sum=${operation[$i]}		
				fi				
				localRes=$(bc <<< "scale=2; $sum - $localRes")				
			done		
			echo $localRes		
			resultado=$localRes
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

multiplicacion() {
	localRes=1
	rgxPlus='^-?[0-9|res]+[[:space:]]*(\*[[:space:]]*-?[0-9|res]+)+$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe la multiplicacion: " exp
		if [[ $exp =~ $rgxPlus ]]; then
			operation=(${exp//'*'/ })
			for i in $( seq 0 $((${#operation[@]} - 1)) ) 
			do
				if [ "${operation[$i]}" == "res" ];then
					sum=$resultado
					else
					sum=${operation[$i]}		
				fi								
				localRes=$(bc <<< "scale=2; $sum * $localRes")			
				
			done		
			echo $localRes		
			resultado=$localRes
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

division() {
	localRes=1
	rgxPlus='^(-?[0-9](\.[0-9+])?+)|res[[:space:]]*(\/[[:space:]]*-?[0-9|res]+)+$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe la division: " exp
		if [[ $exp =~ $rgxPlus ]]; then
			operation=(${exp//'/'/ })			
			localRes=$(bc <<< "scale=2; ${operation[0]} / ${operation[1]}")				
			echo $localRes
			resultado=$localRes
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

potencia() {
	localRes=1
	rgxPlus='^-?[0-9|res](\.[0-9+])?+[[:space:]]*(\^[[:space:]]*[0-9|res]+)+$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe la division: " exp
		if [[ $exp =~ $rgxPlus ]]; then
			operation=(${exp//'^'/ })			
			for i in $( seq 1 ${operation[1]})
			do
				localRes=$(bc <<< "scale=2; $localRes * ${operation[0]}")							
			done			
			echo $localRes
			resultado=$localRes
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

raizCuadrada() {
	localRes=1
	rgxPlus='^([0-9]+)|res$'
	error=1
	while [ $error -eq 1 ]
	do
		read -p "Escribe el numero a sacar raiz cuadrada: " exp
		if [[ $exp =~ $rgxPlus ]]; then					
			localRes=$(bc <<< "scale=2; sqrt (${exp[$i]})")
			resultado=$localRes
			echo $resultado
			error=0
		else
			echo "No has introducido la operacion de manera correcta"
		fi
	done	
}

while [ $opc -ne 7 ]
do
	clear
	echo "Calculadora"
	if [ "$resultado" != "0.00" ];then
		echo "Ultimo resultado = $resultado"
	fi
	echo " 1) Sumar"
	echo " 2) Restar"
	echo " 3) Multiplicacion"
	echo " 4) Division"
	echo " 5) Potencia"
	echo " 6) Raiz cuadrada"
	echo " 7) Salir"
	echo "Seleccione una opción"
	read opc
	case $opc in
		1) 
			suma			
		;;
		2) 
			resta			
		;;
		3)
			multiplicacion
		;;
		4)
			division		
		;;
		5)
			potencia		
		;;
		6)
			raizCuadrada		
		;;
		7)
			echo "Hasta luego"
		;;
		*)
			echo "Opcion no valida"
		;;
	esac
	read -p "Presione enter para continuar" wait
done
