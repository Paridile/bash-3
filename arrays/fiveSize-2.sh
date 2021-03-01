# Modifica el ejercicio anterior para que insertes los valores numéricos
# mediante un ciclo y los muestre por pantalla.

clear
rgx='^[1-9]+$'
arr=()
for i in $(seq 1 5)
do
	temp=-1
	while ! [[ "${temp}" =~ ${rgx}  ]]
	do
		echo "Ingresa un numero"  
		read temp
		if [[ $temp =~ $rgx ]]; then
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

