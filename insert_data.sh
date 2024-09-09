#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"

  #先删除原有数据
  echo $($PSQL "TRUNCATE teams,games")

  #插入teams表
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      #先插入所有winner队伍
      #get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      #if not found
      if [[ -z $TEAM_ID ]]
      then
        #insert winner team
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERTED INTO teams, $WINNER"
        fi
      fi

      #再插入所有opponent队伍
      #get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      #if not found
      if [[ -z $TEAM_ID ]]
      then
        #insert opponent team
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERTED INTO teams, $OPPONENT"
        fi
      fi
    fi
  done

  #插入games表
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      #插入所有比赛
      #winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      #opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      #get game_id
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

      #if not found
      if [[ -z $GAME_ID ]]
      then
        #插入game数据
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERT INTO games, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
        fi
      fi
    fi
  done
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
#先删除原有数据
  echo $($PSQL "TRUNCATE teams,games")

  #插入teams表
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      #先插入所有winner队伍
      #get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      #if not found
      if [[ -z $TEAM_ID ]]
      then
        #insert winner team
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERTED INTO teams, $WINNER"
        fi
      fi

      #再插入所有opponent队伍
      #get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      #if not found
      if [[ -z $TEAM_ID ]]
      then
        #insert opponent team
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERTED INTO teams, $OPPONENT"
        fi
      fi
    fi
  done

  #插入games表
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      #插入所有比赛
      #winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      #opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      #get game_id
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

      #if not found
      if [[ -z $GAME_ID ]]
      then
        #插入game数据
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
        then
          echo "INSERT INTO games, $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
        fi
      fi
    fi
  done
# Do not change code above this line. Use the PSQL variable above to query your database.
