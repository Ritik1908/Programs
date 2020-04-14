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
low=0;
high=$size;

while [ $low -lt $high ]
do
	mid=$(( $(($high - $low)) / 2 ));
	mid=$(($mid+1));
	if [ ${arr[$mid]} -eq $key ]
	then
		echo "KEY FOUND AT $(($mid+1))";
		check=1;
		break;
	elif [ ${arr[$mid]} -gt $key ]
	then
		high=$(($mid-1));
	else
		low=$(($mid+1));
	fi
done

if [ $check -eq 0 ]
then
 	echo "Key not found";
fi
