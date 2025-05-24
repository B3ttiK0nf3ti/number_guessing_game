#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
GUESS_COUNT=0

# starting screen
echo "Enter your username:"
read USERNAME

# Check if user exists
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")

if [[ -z $USER_DATA ]]; then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user
  INSERT_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);")
else
  # Existing user - parse data
  read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

while true;
do
  read USER_GUESS
  if ! [[ "$USER_GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if (( USER_GUESS == RANDOM_NUMBER ))
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';"

    # Update best_game if NULL or current guess count is less
    CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
    if [[ -z $CURRENT_BEST || $GUESS_COUNT -lt $CURRENT_BEST ]]; then
      $PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username = '$USERNAME';"
    fi

    break
  elif (( USER_GUESS > RANDOM_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

