echo "Enter 1 for addition, 2 for subtraction, 3 for multiplication, 4 for division."
read choice;
echo "Enter Number 1 :";
read num1;
echo "Enter Number 2 :";
read num2;

if [ $choice -eq 1 ]
then 
	echo "Addition = $(($num1+$num2))";
elif [ $choice -eq 2 ]
then
	echo "Subtraction= $(($num1-$num2))";
elif [ $choice -eq 3 ]
then
	echo "Multiplication = $(($num1 * $num2))"
elif [ $choice -eq 4 ]
then
	echo "Division = $(($num1 / $num2))"
else
	echo "Wrong choice"
fi
