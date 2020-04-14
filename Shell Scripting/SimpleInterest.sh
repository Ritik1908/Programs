echo "Enter Principal";
read p;
echo "Enter rate";
read r;
echo "Enter time in years";
read t;

si=$(( $p * $t * $r ));
si=$(( $si / 100 ));

echo "Simple Interest = $si ";
