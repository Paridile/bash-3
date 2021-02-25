# Crea un arreglo donde tú le indiques el tamaño por teclado y crear una
# función que rellene el arreglo con los múltiplos de un numero pedido por
# teclado. Por ejemplo, si defino un array de tamaño 5 y eligió un 3 en la
# función, el array contendrá 3, 6, 9, 12, 15. muéstralos por pantalla usando
# otra función distinta.

arr=()
fillArr() {
	for i in $(seq 1 $1)
	do
		arr+=($(($i * $2)))		
	done
}

printArr(){	
	echo ""
	for i in "${arr[@]}"
	do
		echo $i
	done	
}

lenght=0
mul=0
while [ $lenght -lt 1 ]
do
	echo -n "Ingresa la longitud del array: "
	read lenght
	if [ $lenght -lt 1 ]; then
		echo "La longitud debe ser mayor a 0"
	fi
done
while [ $mul -lt 1 ]
do
	echo -n "Ingresa un numero: "
	read mul
	if [ $mul -lt 1 ]; then
		echo "El numero debe ser mayor a 0"
	fi
done
fillArr $lenght $mul
printArr
