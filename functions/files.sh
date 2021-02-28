# Realizar un programa el cual permita crear un
# directorio, un archivo y permita borrarlos usando
# funciones y parámetros

opcMenu=0

readDir() {	
	clear
	if [ $1 == "create" ]; then		
		echo "CREAR DIRECTORIO"
		read -p "Introduce el nombre del directorio: " nameDir
		if [ -d $nameDir ]; then
			echo "el directorio ya existe"
		else
			createDir $nameDir	
		fi	
	fi

	if [ $1 == "delete" ]; then	
		echo "ELIMINAR DIRECTORIO"
		read -p "Introduce el nombre del directorio: " nameDir					
		if [ -d $nameDir ]; then
			deleteDir $nameDir
		else
			echo "No se ha encontrado el directorio"
		fi		
	fi
}

readFile() {
	clear
	if [ $1 == "create" ]; then		
		echo "CREAR ARCHIVO"
		read -p "Introduce el nombre del archivo: " nameFile
		if [ -f $nameFile ]; then
			echo "el archivo ya existe"
		else
			createFile $nameFile
		fi	
	fi

	if [ $1 == "delete" ]; then	
		echo "ELIMINAR ARCHIVO"	
		read -p "Introduce el nombre del archivo: " nameFile
		if [ -f $nameFile ]; then
			deleteFile $nameFile
		else
			echo "No se ha encontrado el archivo"
		fi		
	fi
}

createDir() {	
	mkdir $1
	if [ -d $1 ]; then
		echo "El directorio $1 ha sido creado con exito"
	else
		echo "Ha ocurrido un problema"
	fi
	
}

createFile() {
	touch $1
	echo "El archivo $1 ha sido creado con exito"
}

deleteDir() {
	if [ -z "$(ls -A $1)" ]; then
   		rmdir $1
		echo "Se ha eliminado el directorio $1 con exito"
	else
		opcDelDir=0		
		while [ $opcDelDir -gt 2 ] || [ $opcDelDir -lt 1 ]
		do		
			clear
			echo "El directorio $1 no esta vacio, esta seguro que desea eliminarlo"
			echo " 1) Si"
			echo " 2) No"
			read -p "Seleccione una opcion: " opcDelDir
			case $opcDelDir in
				1) 
					rm -rf $1
					echo "Se ha eliminado el directorio $1 y todos sus contenidos con exito"
				;;
				2) 
					echo "Se ha cancelado la operacion"
				;;
				*)
					echo "Opcion no valida"
					read wait
				;;
			esac
		done
	fi		
}

deleteFile() {
	rm $1
	echo "El archivo $1 ha sido eliminado con exito"
}

while [ $opcMenu -ne 5 ]
do
	clear
	echo "Gestion de archivos y directorios"
	echo "  1) Crear directorio"
	echo "  2) Eliminar directorio"
	echo "  3) Crear archivo"
	echo "  4) Eliminar archivo"
	echo "  5) Salir"
	read -p "Seleccione una opcion: " opcMenu
	case $opcMenu in
		1) 			
			readDir "create"
		;;
		2) 		
			readDir "delete" 
		;;
		3)			
			readFile "create" 
		;;
		4)			
			readFile "delete"
		;;
		5)
			echo "Hasta luego"	
		;;
		*)
			echo "Opcion no valida"
		;;
	esac	
	echo ""
	read -p "Presione enter para continuar" wait
done