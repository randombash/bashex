#!/bin/bash

declare -A person1=( ["phone"]="123456789" ["mail"]="sampleperson@sampledomain.com" )
declare -a ksiazka1=("person1" "person2")
echo ${person1[phone]} ;

if [ $# > 0 ];
then
  while getopts le:a:d:m option
  case ${option} 
  in
  l) #l to list all
    for person in "${ksiazka[@]}"; do
      echo "${person}: "
      declare -n p="$person"  # now p is a reference to a variable "$person"
      for attr in "${!p[@]}"; do
          echo "    ${attr}:  ${p[$attr]}"
      done
    done;;
  e) # e to print entry for person
    person="${OPTARG}: "
    if [[ ${$person[@]} -n ]];
    then 
      echo "${person}: "
      declare -n p="$person"  # now p is a reference to a variable "$person"
      for attr in "${!p[@]}"; do
          echo "    ${attr}:  ${p[$attr]}"
      done
    fi ;;
  a) # -a to add
    namephonemail=${OPTARG}
    name="$2"; 
    phone="$3"; 
    mail="$4";
    declare -A "$name"=( ["phone"]="$phone" ["mail"]="$mail" );;
    $ksiazka+="$name";;
 
  d) # -d to delete
  ;;
  m) # -m to modify
  ;;
  esac
  done

: '
else 
  echo -e "What would you like to do? /n (l to list all entries, a to add entry, d to delete entry, m to modify entry q to quit)"
  read ACTION
  while [$ACTION != "q"]
    do
      case ${ACTION}
      in
      l)

    done

fi 
'
