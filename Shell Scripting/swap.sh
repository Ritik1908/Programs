echo "Enter two numbers";
read num1 num2;

echo $num1;
echo $num2;

num1=$(($num1+$num2));
num2=$(($num1-$num2));
num1=$(($num1-$num2));

echo "Swapped";
echo $num1;
echo $num2;
