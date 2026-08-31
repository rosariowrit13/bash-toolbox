#!/bin/bash
function_menu() {
    echo "======================="
    echo "      CALCULATOR        "
    echo "======================="
    echo "1. Add"
    echo "2. Subtract"
    echo "3. Multiply"
    echo "4. Divide"
    echo "5. Exit"
}
numselc(){
 read -p  "Enter first number: " num1
    if ! [[ "$num1" =~ ^[0-9]+$  ]]
     then 
      echo "Enter a valid number"
      return 1
    fi
read -p  "Enter second number: " num2
     if !  [[ "$num2" =~ ^[0-9]+$  ]]
     then 
       echo "Enter a valid number"
       return 1

     fi
    
}
add(){
    numselc || return
    result=$((num1 + num2))
    echo "Result: $result"
}

subtract(){
    numselc || return
    result=$((num1 - num2))
    echo "Result: $result"
}

multiply(){
    numselc || return
    result=$((num1 * num2))
    echo "Result: $result"
}
divide(){
    numselc || return



if [[ "$num2" -eq 0 ]]
then 
      echo "Cannot divide by zero"
else
     result=$((num1 / num2))
     echo "Result: $result"
fi
}

quit_menu(){
    echo "Exiting......."
    exit 0
}


while true 
do
  clear
  function_menu

   read -p "Enter your choice: " choice

   case "$choice"  in
     
     1) add ;;
     2) subtract ;;
     3) multiply ;;
     4) divide ;;
     5) quit_menu ;;
     *) echo " Invalid choice" ;;
   esac
    read -p "Press enter to continue....."
done