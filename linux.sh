#!/bin/bash

function is_valid_number() {
    local num=$1
    if [[ $num =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
        return 0  # is a valid number
    else
        return 1  # not a valid number
    fi
}

echo "Welcome to the Bash Calculator!"

while true; do

  echo "Enter the first number: "
  read num1

  if ! is_valid_number "$num1"; then
      echo "Error: $num1 is not a valid number"
      continue
  fi

  echo "Enter the second number: "
  read num2

  if ! is_valid_number "$num2"; then
      echo "Error: $num2 is not a valid number"
      continue
  fi

  echo "What operation would you like to perform? +, -, x, /, % or q to quit"
  read operation

  case $operation in
      "+")
          result=$(($num1 + $num2))
          echo "$num1 + $num2 = $result"
          ;;
      "-")
          result=$(($num1 - $num2))
          echo "$num1 - $num2 = $result"
          ;;
      "x")
          result=$(($num1 * $num2))
          echo "$num1 x $num2 = $result"
          ;;
      "/")
          if [[ $num2 -eq 0 ]]; then
            echo "division by zero"
          else
            result=$(($num1 / $num2))
            echo "$num1 / $num2 = $result"
          fi
          ;;
      "%")
          result=$(($num1 % $num2))
          echo "$num1 % $num2 = $result"
          ;;
      "q")
          echo "Exiting the calculator"
          exit 0
          ;;
      *)
          echo "Invalid operator"
          ;;
  esac

  echo "Press enter to continue or q to quit"
  read choice
  if [[ $choice == "q" ]]; then
    echo "Exiting the calculator"
    exit 0
  fi
done