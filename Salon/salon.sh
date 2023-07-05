#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  MESSAGE="How can I help you?\n"
  if [[ $1 ]]
  then
    MESSAGE="\n$1"
  fi

  echo -e $MESSAGE
  SERVICES=$($PSQL "select service_id, name from services where service_id!= 0 order by service_id;")

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do 
      if [[ $SERVICE_ID != "service_id" ]]
      then
        echo "$SERVICE_ID) $NAME"
      fi
    done
  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  PUT_OPTION $SERVICE_ID_SELECTED $SERVICE_NAME
}

PUT_OPTION(){

  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  IS_PHONE=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")

  if [[ -z $IS_PHONE ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/ *$|^ *//g'), $(echo $CUSTOMER_NAME | sed -r 's/ *$|^ *//g')?"
  read SERVICE_TIME

  INSERT_APPO=$($PSQL "insert into appointments(service_id, customer_id, time) values($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")
  
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/ *$|^ *//g') at $(echo $SERVICE_TIME | sed -r 's/ *$|^ *//g'), $(echo $CUSTOMER_NAME | sed -r 's/ *$|^ *//g')."
}

MAIN_MENU