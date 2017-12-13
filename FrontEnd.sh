#!/bin/bash

#make sure ask is installed
if ! type "ask" > /dev/null; then
  echo "Error - 'Ask' isnt installed, please install it"
  exit 0
fi

#make sure node is installed
if ! type "node" > /dev/null; then
  echo "Error - 'node' isnt installed, please install it"
  exit 0
fi

#make sure typescript is installed
if ! type "tsc" > /dev/null; then
  echo "Error - 'tsc' isnt installed, please install it"
  exit 0
fi

#make sure typescript is installed
if ! type "jq" > /dev/null; then
  echo "Error - 'jq' isnt installed, please install it"
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

echo "What is the invocation name: "
read invocationName

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
output="Alexa ask ${invocationName}, ${PHRASE_1}"
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

declare -a intents=()

#header
file="model.test"
echo -e "{\n \"interactionModel\": {\n  \"languageModel\": {\n    \"invocationName\": \"$invocationName\",\n    \"intents\": [" > $file


#Loop over generation of intents
i=0
intentmaincount=0
while true
do
  echo -e "\nEnter an intent name: "
  read IntentName

  echo -e "\nDo you want to add another intent (Y/N): "
  read OtherIntent
  intents[i]=$IntentName

  if [ $OtherIntent == 'n' ] || [ $OtherIntent == 'N' ];
  then
	break
  fi
  ((i=i+1))
  ((intentmaincount++))
done

#Write raw template
i=0
for intent in "${intents[@]}"
do
  echo "$intent"
  if [ $i != 0 ];
  then
    comma=','
  else
    comma=''
  fi
  echo -e "      $comma{\n        \"name\": \"${intent}\",\n        \"slots\": [\${SLOTS_$i}],\n        \"samples\": [\${SAMPLES_$i}]\n      }" >> $file
  ((i=i+1))
done

cat << EOF >> $file
      ,{
         "name": "AMAZON.HelpIntent"
      }
      ,{
         "name": "AMAZON.StopIntent"
      }
      ,{
         "name": "AMAZON.CancelIntent"
      }
      ,{
         "name": "AboutIntent",
         "slots":[],
         "samples":["Who wrote this Skill","Who is the developer of this skill","Who developed this skill","Who designed this skill"]
      }
EOF

#Loop over intents and ask for some samples
i=0
slotcount=0
runOnce=0
runoncet=0
for intent in "${intents[@]}"
do
       sampleslist=""
       declare -a slotnames=()
       while true
       do
         echo -e "\nPlease type a sample for $intent: "
         read Sample

         sampleslist+="\"$Sample\""

         echo -e "\nDo you want add any other samples (Y/N): "
         read Answer

         if [ $Answer == 'n' ] || [ $Answer == 'N' ];
         then
            #write to file
            sed -e "s/\${SAMPLES_$i}/$sampleslist/" $file > $file.tmp
            mv $file.tmp $file

            echo -e "\nDoes this intent need any slots (Y/N): "
            read SlotAnswer


            o=0
            if [ $SlotAnswer == 'n' ] || [ $SlotAnswer == 'N' ];
            then
              nothing=""
              sed -e "s/\${SLOTS_$i}/$nothing/" $file > $file.tmp
              mv $file.tmp $file
              break
            fi

            slotstring=""
            comma=""
            while true
            do
              echo "Please type the slot name: "
              read SlotName

              echo "Please type the custom or AMAZON slot type: "
              read SlotType

              #append into string
              if [ $o != 0 ]; then
                comma=","
              else
                comma=""
              fi

read -r -d '' slotstringtmpg << EOM
  $comma{
    "name": "$SlotName",
    "type": "$SlotType"
  }
EOM
              slotstringtmp=`echo -e ${slotstringtmpg} | tr '\n' "\r"`
              slotstring+=$slotstringtmp

              if [[ $SlotType == *"AMAZON"* ]]; then
                echo "AMAZON slot type inserted into model"
              else
                echo "Please type your custom types, seperated by a comma: "
                read CustomType
                if [ $runOnce == 0 ]; then
                  echo -e "      ],\n      \"types\":[" >> $file
                  runOnce=1
                fi

                if [ $o != 0 ]; then
                  echo -e "        ,{\n         \"name\": \"$SlotType\",\n          \"values\": [" >> $file
                else
                  if [ $runoncet == 1 ]; then
                    echo -e "        ,{\n         \"name\": \"$SlotType\",\n          \"values\": [" >> $file
                  else
                    echo -e "        {\n          \"name\": \"$SlotType\",\n          \"values\": [" >> $file
                    runoncet=1
                  fi
                fi

                l=0
                comma=''
                wordsfull=$(echo $CustomType | tr "," "\n")
                wordscount=0
                for word in $wordsfull
                do
                  ((wordscount++))
                done
                ((wordscount--))

                for word in $wordsfull
                do
                  if [ $l != 0 ]; then
                    comma='          ,'
                  else
                    comma='          '
                  fi
                  if [ $l == $wordscount ]; then
                    echo -e "$comma{\n            \"name\": {\n              \"value\": \"$word\"\n            }\n          }\n          ]\n     }" >> $file
                  else
                    echo -e "$comma{\n            \"name\": {\n              \"value\": \"$word\"\n            }\n          }" >> $file
                  fi
                  ((l=l+1))
                done
              fi

              (( slotcount+=1 ))
              echo "Do you want to insert anymore slots (Y/N): "
              read Answer
              ((o++))
              if [ $Answer == 'n' ] || [ $Answer == 'N' ];
              then
                o=0
                echo $slotstring
                sed -e "s/\${SLOTS_$i}/$slotstring/" $file > $file.tmp
                mv $file.tmp $file
                break
              fi
            done

            #finish intent
            break
          else
            sampleslist+=","
          fi
       done
       ((i=i+1))
done

if [ $o != 0 ]; then
  echo -e "         ]\n       }\n    }\n    }\n" >> $file
else
  echo -e "\n      ] \n    } \n   } \n }" >> $file
fi
#Loop over slots


echo "\nCopying temporary model over to models folder"
#cat model.test | jq > model.test.tmp
#mv model.test.tmp model.test

#copy model.test over each model
FILES=$directory/models/*
for f in $FILES
do
  cp model.test $f
done

echo "Generating index.js using tsc"
cd $directory/lambda/custom/
tsc index.ts

cd ../../../

echo -e "\nDeploying initial alexa skill, please wait"
cd $directory
ask deploy

#return opcode
if [[ $? -eq 0 ]]; then
  echo "Successfully deployed skill."
else
  echo "Error - An error occured, see error above."
  exit 1
fi

cd ..
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
