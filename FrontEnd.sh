#ask init
rm -rf basic &> /dev/null

#get basic template
ask new --template Basic --url https://sandr-photography.com/alexa/templates.json &> /dev/null

#insert user input to skill.json
#echo "What is the skill name called: "
#read APP_NAME

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
sed -e "s/\${PHRASE_1}/${PHRASE_1}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

echo "Enter second phrase: "
read PHRASE_2
echo -e "\n"
sed -e "s/\${PHRASE_2}/${PHRASE_2}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

echo "Enter third phrase: "
read PHRASE_3
echo -e "\n"
sed -e "s/\${PHRASE_3}/${PHRASE_3}/" basic/skill.json > basic/skill.json.tmp
mv basic/skill.json.tmp basic/skill.json

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

