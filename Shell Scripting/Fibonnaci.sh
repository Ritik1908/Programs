echo "Enter range";
read range;

a=0;
b=1;

while [ $range -gt 0 ]
do
	echo $a;
	c=$(($a+$b));
	a=$b;
	b=$c;
	range=$(( $range - 1 ));
done
