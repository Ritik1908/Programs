echo "Enter array size";
read size;
declare -a arr;

echo "Enter array elements :";
for (( i=0; i<$size; i++ ))
do
	read arr[$i];
done

echo "Enter key to search";
read key;
check=0;
for (( i=0; i<$size; i++ ))
do
	if [ ${arr[$i]} -eq $key ]
	then 
		echo "FOUND AT $(($i+1))";
		check=1;
		break;
	fi
done

if [ $check -eq 0 ]
then
 	echo "Key not found";
fi
