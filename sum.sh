#!/bin/bash



sum=0
echo "Введите числа построчно (для завершения введите 0):"
while read number; do

	if [[ -z "$number" ]]; then
      		continue
    	fi
	if [[ ! "$number" =~ ^[+-]?[0-9]+?$ ]]; then
	       echo "Ошибка: '$number' не является числом. Введите снова." >&2
       	       continue
	fi	       
	sum=$((sum+number))
	if [ "$number" -eq 0 ]; then
		echo "Сумма всех введённых чисел: $sum"
		break
	fi
done	
