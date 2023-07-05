#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

SHOW_DATA(){
  #PROPERTIES TABLE AND FORMAT
  ATOM_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ID_ELEMENT")
  ATOM_MASS=$(echo $ATOM_MASS | sed -r 's/ *$|^ *//g')
  MELTING=$($PSQL "select melting_point_celsius from properties where atomic_number=$ID_ELEMENT")
  MELTING=$(echo $MELTING | sed -r 's/ *$|^ *//g')
  BOILING=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ID_ELEMENT")
  BOILING=$(echo $BOILING| sed -r 's/ *$|^ *//g')
  ID_TYPE=$($PSQL "select type_id from properties where atomic_number=$ID_ELEMENT")
  
  #TYPE TABLEAND FORMAT 
  TYPE_NAME=$($PSQL "select type from types where type_id=$ID_TYPE")
  TYPE_NAME=$(echo $TYPE_NAME| sed -r 's/ *$|^ *//g')
  #FINAL MESSAGE
  echo -e "The element with atomic number $ID_ELEMENT is $NAME_ELEMENT ($SYMBOL_ELEMENT). It's a $TYPE_NAME, with a mass of $ATOM_MASS amu. $NAME_ELEMENT has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
}

if [[ $1 ]]
then
  
  #IF THE ARGUMENT IS NUMBER
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #ID SEARCH 
    ID_ELEMENT=$($PSQL "select atomic_number from elements where atomic_number=$1")
    #IF NOT EXIST SEND A MESSAGE
    if [[ -z $ID_ELEMENT ]] 
    then
      MESSAGE="I could not find that element in the database." 
    #IF EXIST 
    else
      SYMBOL_ELEMENT=$($PSQL "select symbol from elements where atomic_number=$ID_ELEMENT")
      NAME_ELEMENT=$($PSQL "select name from elements where atomic_number=$ID_ELEMENT")
    fi

  #IS NOT A NUMBER
  else
    #SYMBOL SEARCH 
    SYMBOL_ELEMENT=$($PSQL "select symbol from elements where symbol='$1'")
    if [[ -z $SYMBOL_ELEMENT ]] 
    then
      #NAME SEARCH
      NAME_ELEMENT=$($PSQL "select name from elements where name='$1'")
      if [[ -z $NAME_ELEMENT ]] 
      then
        MESSAGE="I could not find that element in the database." 
      else
        ID_ELEMENT=$($PSQL "select atomic_number from elements where name='$1'")
        SYMBOL_ELEMENT=$($PSQL "select symbol from elements where name='$1'")
      fi
    else
      ID_ELEMENT=$($PSQL "select atomic_number from elements where symbol='$1'")
      NAME_ELEMENT=$($PSQL "select name from elements where symbol='$1'")
    fi
    
  fi

  if [[ -z $MESSAGE ]]
  then 
    ID_ELEMENT=$(echo $ID_ELEMENT | sed -r 's/ *$|^ *//g')
    SYMBOL_ELEMENT=$(echo $SYMBOL_ELEMENT | sed -r 's/ *$|^ *//g')
    NAME_ELEMENT=$(echo $NAME_ELEMENT | sed -r 's/ *$|^ *//g')

    SHOW_DATA $ID_ELEMENT $SYMBOL_ELEMENT $NAME_ELEMENT
  else
    echo "$MESSAGE"
  fi
else
  echo "Please provide an element as an argument."
fi