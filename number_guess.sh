#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USERNAME=$(echo "$USERNAME" | sed -E 's/^ *| *$//g')

# Check if user exists
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")

if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);"
else
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  if [[ -z $BEST_GAME ]]; then BEST_GAME="0"; fi
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS

  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if (( GUESS == SECRET )); then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET. Nice job!"

    $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';" > /dev/null

    CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
    if [[ -z $CURRENT_BEST || $CURRENT_BEST = "NULL" ]] || (( GUESS_COUNT < CURRENT_BEST )); then
      IGNORE_OUTPUT=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username = '$USERNAME';")
    fi

    break
  elif (( GUESS > SECRET )); then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
