read -p "Enter two values : " a b
read -p "Enter operand ( +, -, /, *) : " op
ans=$(( $a $op $b ))
echo "$a $op $b = $ans"
