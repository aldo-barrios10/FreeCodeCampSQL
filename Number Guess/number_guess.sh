#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_NUMBER(){
  CONTADOR=0
  MESSAGE="Guess the secret number between 1 and 1000:"
  #GUESS NUMBER
  while [ true ]
  do
    echo -e "$MESSAGE"
    read SELECTION
    CONTADOR=$(( $CONTADOR + 1 ))

    #SELECTION IS NOT A NUMBER
    if [[ ! $SELECTION =~ ^[0-9]+$ ]]
    then
      MESSAGE="That is not an integer, guess again:\n"
    #SELECTION IS GREATER THAN NUMBER
    elif [[ $SELECTION -gt $MAGIC_NUMBER ]]
    then
      MESSAGE="It's lower than that, guess again:\n"
    #NUMBER IS GREATER THAN SELECTION
    elif [[ $MAGIC_NUMBER -gt $SELECTION ]]
    then
      MESSAGE="It's higher than that, guess again:\n"
    #NUMBER AND SELECTION ARE EQUALS
    elif [[ $SELECTION -eq $MAGIC_NUMBER ]]
    then
      echo -e "\nYou guessed it in $CONTADOR tries. The secret number was $MAGIC_NUMBER. Nice job!\n"
      break
    fi
  done

  #GAMES PLAYED +1
  GAMES_PLAYED=$(( $GAMES_PLAYED + 1  ))

  #CHANGE BEST GAMES 
  if [[ $BEST_GAME -eq 0 ]] || [[ $BEST_GAME -gt $CONTADOR ]]
  then
    UPDATE_BEST=$($PSQL "update users set best_game=$CONTADOR where username='$USERNAME'")
    UPDATE_GAMES=$($PSQL "update users set games_played=$GAMES_PLAYED where username='$USERNAME'")
  
  elif [[ $CONTADOR -gt $BEST_GAME ]]
  then
    UPDATE_GAMES=$($PSQL "update users set games_played=$GAMES_PLAYED where username='$USERNAME'")
  fi
}

MAGIC_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo -e "Enter your username: "
read USERNAME

USER_DB=$($PSQL "select username from users where username='$USERNAME'")

#USER DO NOT EXIST
if [[ -z $USER_DB ]]
then 
  INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
  GAMES_PLAYED=$($PSQL "select games_played from users where username='$USERNAME'")
  BEST_GAME=$($PSQL "select best_game from users where username='$USERNAME'")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  GUESS_NUMBER $USERNAME $GAMES_PLAYED $BEST_GAME $MAGIC_NUMBER
else
  #IF USER EXIST
  GAMES_PLAYED=$($PSQL "select games_played from users where username='$USERNAME'")
  BEST_GAME=$($PSQL "select best_game from users where username='$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  GUESS_NUMBER $USERNAME $GAMES_PLAYED $BEST_GAME $MAGIC_NUMBER
fi