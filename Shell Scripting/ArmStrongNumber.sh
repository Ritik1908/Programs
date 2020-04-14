echo "Enter a number to check for armstrong";
read num;
num1=$num;
num2=0;

while [ $num1 -gt 0 ]
do
	dig=$(( $num1 % 10));
	pow=$(( $dig * $dig * $dig ));
	num2=$(( $num2 + $pow ));
	num1=$(($num1/10));
done

if [ $num2 -eq $num ]
then
	echo "Arm Strong";
else
	echo "Not Arm Strong";
fi
