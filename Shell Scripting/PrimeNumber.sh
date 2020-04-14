echo "Enter a number to check for prime";
read num;
check=0;

for (( i=2; i<$num; i++ ))
do
	if [ $(($num % i)) -eq 0 ]
	then
		check=1;
		break;
	fi
done

if [ $check == 0 ]
then
	echo "Prime Number";
else
	echo "Not Prime";
fi
