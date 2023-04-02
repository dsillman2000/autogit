cd /home/dsillman/autogit
NUM_ACTIONS=4

for i in $NUM_ACTIONS; do

    ACTION=$(( $RANDOM % 4 ))
    RANDSEED="$(date)$RANDOM"

    case $ACTION in
        0) # add new file
            NEW_FILENAME="./repocontents/$(echo "$RANDSEED" | md5sum)"
            echo "$(date +%s)" >> $NEW_FIELNAME
            ;;
        1) # remove existing file
            readarray -t CURRENT_FILENAMES < <(ls -1 ./autogit/repocontents)
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            rm "./repocontents/$SELECTED_FILENAME"
            ;;
        2) # append to existing file
            readarray -t CURRENT_FILENAMES < <(ls -1 ./repocontents)
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            echo "$(date +%s)" >> "/home/dsillman2000/autogit/repocontents/$SELECTED_FILENAME"
            ;;
        3) # replace contents of existing file
            readarray -t CURRENT_FILENAMES < <(ls -1 ./repocontents)
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            echo : > "./repocontents/$SELECTED_FILENAME"
            echo "$(date +%s)" >> "./repocontents/$SELECTED_FILENAME"
            ;;
    esac

    git add ./repocontents
    git commit -m "$1"
    git push

done