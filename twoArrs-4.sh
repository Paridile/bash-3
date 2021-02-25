# Crea dos arreglos que tengan el mismo tamaño (lo pedirá por teclado), en
# uno de ellos almacenaras nombres de personas como cadenas, en el otro
# arreglo ira almacenando la longitud de los nombres. Muestra por pantalla el
# nombre y la longitud que tiene. Puedes usar funciones si lo deseas.


fillArrs() {
	arrStr=()
	arrLen=()
	for i in $(seq 1 $1)
	do
		echo "Ingresa una cadena de texto"
		read str
		arrStr+=($str)
		arrLen+=(${#str})
	done

	echo ""
	for i in $(seq 0 ${#arrStr[@]}) 
	do
		echo ${arrLen[$i]} " - " ${arrStr[$i]}
	done		
}

lenght=0
while [ $lenght -lt 1 ]
do
	echo -n "ingresa la longitud de los arreglos: "
	read lenght
	if [ $lenght -lt 1 ]; then
		echo "La longitud debe ser mayor a 0"
	fi
done

fillArrs $lenght


