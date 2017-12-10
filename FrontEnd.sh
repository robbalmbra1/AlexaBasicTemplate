#!/bin/bash

#make sure ask is installed
if ! type "ask" > /dev/null; then
  echo "Error - 'Ask' isnt installed, please install it"
  exit 0
fi

#make sure node is installed
if ! type "node" > /dev/null; then
  echo "Error - 'Ask' isnt installed, please install it"
  exit 0
fi

#make sure typescript is installed
if ! type "tsc" > /dev/null; then
  echo "Error - 'Ask' isnt installed, please install it"
  exit 0
fi

echo "What is the skill name called: "
read APP_NAME

directory=$(echo $APP_NAME | tr "[:upper:]" "[:lower:]" | sed 's/ /-/g') #pc made directory from APP_NAME
#get basic template
ask new --skill-name "${APP_NAME}" --template Basic --url https://sandr-photography.com/alexa/templates.json &> /dev/null

#insert user input to skill.json
sed -e "s/\${APP_NAME}/${APP_NAME}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

sed -e "s/\${NAME}/${APP_NAME}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

echo "What is your name: "
read FULL_NAME

sed -e "s/\${FULL_NAME}/${FULL_NAME}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

echo "Please enter a keyword that describes the skill: "
read KEYWORD_1

echo "Please enter another keyword that describes the skill: "
read KEYWORD_2

echo "Please enter a final keyword that describes the skill: "
read KEYWORD_3

#write keywords to skill.json
sed -e "s/\${KEYWORD_1}/${KEYWORD_1}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

sed -e "s/\${KEYWORD_2}/${KEYWORD_2}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

sed -e "s/\${KEYWORD_3}/${KEYWORD_3}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

echo -e "\n"

#Loop over models and adjust name
FILES=$directory/models/*
for file in $FILES
do
  # take action on each file. $f store current file name
  echo $file
  sed -e "s/\${APP_NAME}/${APP_NAME}/" $file > $file.tmp
  mv $file.tmp $file
done

#Application category
Applicationtypes[0]="ALARMS_AND_CLOCKS"
Applicationtypes[1]="ASTROLOGY"
Applicationtypes[2]="BUSINESS_AND_FINANCE"
Applicationtypes[3]="CALCULATORS"
Applicationtypes[4]="CALENDARS_AND_REMINDERS"
Applicationtypes[5]="COMMUNICATION"
Applicationtypes[6]="CONNECTED_CAR"
Applicationtypes[7]="COOKING_AND_RECIPE"
Applicationtypes[8]="CURRENCY_GUIDES_AND_CONVERTERS"
Applicationtypes[9]="DATING"
Applicationtypes[10]="DELIVERY_AND_TAKEOUT"
Applicationtypes[11]="DEVICE_TRACKING"
Applicationtypes[12]="EDUCATION_AND_REFERENCE"
Applicationtypes[13]="EVENT_FINDERS"
Applicationtypes[14]="EXERCISE_AND_WORKOUT"
Applicationtypes[15]="FASHION_AND_STYLE"
Applicationtypes[16]="FLIGHT_FINDERS"
Applicationtypes[17]="FRIENDS_AND_FAMILY"
Applicationtypes[18]="GAME_INFO_AND_ACCESSORY"
Applicationtypes[19]="GAMES"
Applicationtypes[20]="HEALTH_AND_FITNESS"
Applicationtypes[21]="HOTEL_FINDERS"
Applicationtypes[22]="KNOWLEDGE_AND_TRIVIA"
Applicationtypes[23]="MOVIE_AND_TV_KNOWLEDGE_AND_TRIVIA"
Applicationtypes[24]="MOVIE_INFO_AND_REVIEWS"
Applicationtypes[25]="MOVIE_SHOWTIMES"
Applicationtypes[26]="MUSIC_AND_AUDIO_ACCESSORIES"
Applicationtypes[27]="MUSIC_AND_AUDIO_KNOWLEDGE_AND_TRIVIA"
Applicationtypes[28]="MUSIC_INFO_REVIEWS_AND_RECOGNITION_SERVICE"
Applicationtypes[29]="NAVIGATION_AND_TRIP_PLANNER"
Applicationtypes[30]="NEWS"
Applicationtypes[31]="NOVELTY"
Applicationtypes[32]="ORGANIZERS_AND_ASSISTANTS"
Applicationtypes[33]="PETS_AND_ANIMAL"
Applicationtypes[34]="PODCAST"
Applicationtypes[35]="PUBLIC_TRANSPORTATION"
Applicationtypes[36]="RELIGION_AND_SPIRITUALITY"
Applicationtypes[37]="RESTAURANT_BOOKING_INFO_AND_REVIEW"
Applicationtypes[38]="SCHOOLS"
Applicationtypes[39]="SCORE_KEEPING"
Applicationtypes[40]="SELF_IMPROVEMENT"
Applicationtypes[41]="SHOPPING"
Applicationtypes[42]="SMART_HOME"
Applicationtypes[43]="SOCIAL_NETWORKING"
Applicationtypes[44]="SPORTS_GAMES"
Applicationtypes[45]="SPORTS_NEWS"
Applicationtypes[46]="STREAMING_SERVICE"
Applicationtypes[47]="TAXI_AND_RIDESHARING"
Applicationtypes[48]="TO_DO_LISTS_AND_NOTES"
Applicationtypes[49]="TRANSLATORS"
Applicationtypes[50]="TV_GUIDES"
Applicationtypes[51]="UNIT_CONVERTERS"
Applicationtypes[52]="WEATHER"
Applicationtypes[53]="WINE_AND_BEVERAGE"
Applicationtypes[54]="ZIP_CODE_LOOKUP"

i=1
for category in "${Applicationtypes[@]}"
do
	str="${category//_/ }"
	echo $i. $str
	((i++))
done

echo "Please select the number of the desired category above: "
read choice
categorycalc=`expr $choice - 1`
CATEGORY=${Applicationtypes[$categorycalc]}
echo -e "\n"
sed -e "s/\${CATEGORY}/${CATEGORY}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

#phrases input
echo "Enter first phrase: "
read PHRASE_1
echo -e "\n"
sed -e "s/\${PHRASE_1}/${PHRASE_1}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

output="Alexa ask ${APP_NAME}, ${PHRASE_1}"

sed -e "s/\${PHRASE_1}/${output}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

echo "Enter second phrase: "
read PHRASE_2
echo -e "\n"
sed -e "s/\${PHRASE_2}/${PHRASE_2}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

sed -e "s/\${PHRASE_2}/${PHRASE_2}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

echo "Enter third phrase: "
read PHRASE_3
echo -e "\n"
sed -e "s/\${PHRASE_3}/${PHRASE_3}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

sed -e "s/\${PHRASE_3}/${PHRASE_3}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

#enter short description
echo "Enter short description: "
read SHORT_DESC
echo -e "\n"
sed -e "s/\${SHORT_DESC}/${SHORT_DESC}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

echo "Enter long description: "
#enter long description
read FULL_DESC
echo -e "\n"
sed -e "s/\${FULL_DESC}/${FULL_DESC}/" $directory/skill.json > $directory/skill.json.tmp
mv $directory/skill.json.tmp $directory/skill.json

echo "Do you want to use your phrases as samples for the two sample utterances(Y/N): "
read answerphrase

if [[ $answerphrase = 'N' || $answerphrase = 'n' ]] ; then
  magic_variable=()
  utterances=($(grep "\"name\":" $directory/models/en-US.json  | grep -v AMAZON | tr -d ' ' | cut -c 9- | sed 's/.$//'))

  i=0
  for d in "${utterances[@]}"
  do
    output=""
    j=0
    while true; do
      if [[ $j != 0 ]]; then
  	output+=','
      fi
      echo "Enter sample for $d: "
      read sample
      output+=\"$sample\"

      echo "Do you want to add other sample (Y/N)? "
      read answer

      if [[ $answer = 'N' || $answer = 'n' ]] ; then
  	break
      fi
      ((j=j+1))
    done
    echo -e "\n"
    magic_variable[$i]=$output
    ((i=i+1))
  done

  #Loop over utterances and files
  #1st item is equal to 1st set of utterances

  MODELS=$directory/models/*
  for f in $MODELS
  do
    k=1
    for i in "${magic_variable[@]}"
      do
        sed -e "s/\"\${SAMPLES_$k}\"/${i}/" $f  > $f.tmp
        mv $f.tmp $f
        ((k=k+1))
      done
  done
else
  #loop over files and apply phrases
  MODELS=$directory/models/*
  for f in $MODELS
  do
    i=\"$PHRASE_1\",\"$PHRASE_2\"
    sed -e "s/\"\${SAMPLES_1}\"/${i}/" $f  > $f.tmp
    mv $f.tmp $f

    i=\"$PHRASE_3\"
    sed -e "s/\"\${SAMPLES_2}\"/${i}/" $f  > $f.tmp
    mv $f.tmp $f
  done
fi

echo "Generating index.js using tsc"
cd $directory/lambda/custom/
pwd
ls -al
tsc index.ts

cd ../../../

echo -e "\nDeploying initial alexa skill, please wait"
cd $directory
ask deploy
echo -e "Warning - Please update the logos of the skill through the alexa skill interface, To deploy in the future please execute 'ask deploy'.\n"

echo -e "\nAdding skill id to test framework"
SKILL_ID=$(cat ${directory}/.ask/config | grep "skill_id" | awk '{print $2}' | cut -c 2- | rev | cut -c 3- | rev)
sed -e "s/\${SKILL_ID}/${SKILL_ID}/" $directory/lambda/custom/index.ts  > $directory/lambda/custom/index.ts.tmp
mv $directory/lambda/custom/index.ts.tmp $directory/lambda/custom/index.ts

sed -e "s/\${SKILL_ID}/${SKILL_ID}/" $directory/lambda/custom/test/index.js  > $directory/lambda/custom/test/index.js.tmp
mv $directory/lambda/custom/test/index.js.tmp $directory/lambda/custom/test/index.js

echo -e "\nAs skill testing is disabled by default when a skill is made through the ask CLI, do you want me to turn testing on for the testing framework(Y/N): "
read answer

if [[ $answer = 'Y' || $answer = 'y' ]] ; then
  echo "Please type in your username for AWS: "
  read username
  
  echo "Please type in your password: "
  read password
  
  node $directory/other/index.js "$username" "$password" "$SKILL_ID"
  echo "Setup complete, goodbye"
else
  echo "Setup complete, goodbye"
fi
