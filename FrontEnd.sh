#ask init
rm -rf basic &> /dev/null

#get basic template
ask new --template Basic --url https://sandr-photography.com/alexa/templates.json &> /dev/null

#insert user input to skill.json
echo "What is the skill name called: "
read APP_NAME
sed -e "s/\${APP_NAME}/${APP_NAME}/" basic/lambda/custom/index.ts  > basic/lambda/custom/index.ts.tmp
mv basic/lambda/custom/index.ts.tmp basic/lambda/custom/index.ts

sed -e "s/\${NAME}/${APP_NAME}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

#Loop over models and adjust name
FILES=basic/models/*
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
sed -e "s/\${CATEGORY}/${CATEGORY}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

#phrases input
echo "Enter first phrase: "
read PHRASE_1
echo -e "\n"
sed -e "s/\${PHRASE_1}/${PHRASE_1}/" basic/lambda/custom/index.ts  > basic/lambda/custom/index.ts.tmp
mv basic/lambda/custom/index.ts.tmp basic/lambda/custom/index.ts

output="Alexa ask ${APP_NAME}, ${PHRASE_1}"

sed -e "s/\${PHRASE_1}/${output}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

echo "Enter second phrase: "
read PHRASE_2
echo -e "\n"
sed -e "s/\${PHRASE_2}/${PHRASE_2}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

sed -e "s/\${PHRASE_2}/${PHRASE_2}/" basic/lambda/custom/index.ts  > basic/lambda/custom/index.ts.tmp
mv basic/lambda/custom/index.ts.tmp basic/lambda/custom/index.ts

echo "Enter third phrase: "
read PHRASE_3
echo -e "\n"
sed -e "s/\${PHRASE_3}/${PHRASE_3}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

sed -e "s/\${PHRASE_3}/${PHRASE_3}/" basic/lambda/custom/index.ts  > basic/lambda/custom/index.ts.tmp
mv basic/lambda/custom/index.ts.tmp basic/lambda/custom/index.ts

#enter short description
echo "Enter short description: "
read SHORT_DESC
echo -e "\n"
sed -e "s/\${SHORT_DESC}/${SHORT_DESC}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

echo "Enter long description: "
#enter long description
read FULL_DESC
echo -e "\n"
sed -e "s/\${FULL_DESC}/${FULL_DESC}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

echo "Do you want to use your phrases as samples for the two sample utterances(Y/N): "
read answerphrase

if [[ $answerphrase = 'N' || $answerphrase = 'n' ]] ; then
  magic_variable=()
  utterances=($(grep "\"name\":" basic/models/en-US.json  | grep -v AMAZON | tr -d ' ' | cut -c 9- | sed 's/.$//'))

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

  MODELS=basic/models/*
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
  MODELS=basic/models/*
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

echo "Deploying alexa skill"
cd basic
ask deploy
