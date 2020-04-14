echo "Enter a number to check for palindrome";
read num;
num1=$num;
rev=0;
while [ $num1 -gt 0 ]
do
	lastDigit=$(($num1 % 10));
	rev=$(($rev * 10 + $lastDigit));
	num1=$(($num1/10));
done

if [ $rev -eq $num ]
then
	echo "Palindrome";
else
	echo "Not Palindrome";
fi
