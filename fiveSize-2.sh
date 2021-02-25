# Modifica el ejercicio anterior para que insertes los valores numéricos
# mediante un ciclo y los muestre por pantalla.

clear
arr=()
for i in $(seq 1 5)
do
	temp=-1
	while [ $temp -lt 0 ]
	do
		echo "Ingresa un numero" 
		read temp
		if [ $temp -ge 0 ]; then
			arr+=($temp)
			else
			echo "Debes ingresar numeros positivos"
		fi
	done
done
echo ""
echo -n "Los valores que introduciste fueron: "
echo ${arr[@]}
echo ""

