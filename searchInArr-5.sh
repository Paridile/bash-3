# Buscar un elemento dentro de un arreglo que nosotros le pedimos por
# teclado. Indicar la posición donde se encuentra. Si hay más de uno, indicar
# igualmente la posición.

arr=()

addElement() {
	opcAdd=2
	while [ $opcAdd -eq 2 ]
	do
		clear
		echo "Ingresa el elemento que deseas agregar al arreglo"
		read elm
		arr+=($elm)
		echo ""
		echo "¿Desea agregar otro elemento?"
		echo "  1) No"
		echo "  2) Si"
		read opcAdd
	done
}

searchElement() {
	found=0
	if [ ${#arr[@]} -gt 0 ]; then	
		echo -n "Introduce el elemento que deseas buscar: "
		read find		
		# if [[ "${arr[@]}" =~ "$find" ]]
		# then
		# 	echo "El elemento fue encontrado"
		# 	else
		# 	echo "El elemento no forma parte del arreglo"
		# fi		
		for i in "${!arr[@]}"
		do
			if [[ "${arr[$i]}" = "${find}" ]]; then
				echo "Posicion: ${i} | ${arr[$i]}" 
				found=1
			fi
		done
		if [ $found -eq 0 ]; then
			echo "El elemento no forma parte del arreglo"
		fi
	else
		echo ""
		echo "Aun no has agregado ningun elemento al arreglo"
	fi
}

printArr() {
	if [ ${#arr[@]} -gt 0 ]; then
		clear
		for i in "${arr[@]}"
		do
			echo $i
		done
	else
		echo ""
		echo "Aun no has agregado ningun elemento al arreglo"
	fi
}

opc=0
while [ $opc -ne 4 ]
	do
	clear
	echo "Seleccione una opcion"
	echo "  1) Agregar elemento al arreglo"
	echo "  2) Buscar elemento en el arreglo"
	echo "  3) Mostrar arreglo"
	echo "  4) Salir"
	read opc
	case $opc in
			1) 
				addElement
			;;
			2) 
				searchElement
			;;
			3)
				printArr
			;;
			4)
				echo "Hasta luego"			
			;;
			*)
				echo "Opcion no valida"
			;;
	esac
	echo ""	
	echo "Presione enter para continuar"
	read wait
done
