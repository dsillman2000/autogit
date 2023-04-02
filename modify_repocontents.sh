cd /home/dsillman2000/autogit/
NUM_ACTIONS=4

for i in $(seq 1 1 $NUM_ACTIONS); do

    ACTION="$(( $RANDOM % 4 ))"
    RANDSEED="$(date)$RANDOM"

    readarray -t CURRENT_FILENAMES < <(ls -1 ./repocontents)
    if [[ -z $CURRENT_FILENAMES ]]; then
        echo "Must add file";
        ACTION="0"
    fi

    case $ACTION in
        0) # add new file
            NEW_FILENAME="./repocontents/$(echo "$RANDSEED" | md5sum | cut -d " " -f1)"
            echo "$(date +%s)" >> $NEW_FILENAME
            ;;
        1) # remove existing file
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            rm "./repocontents/$SELECTED_FILENAME"
            ;;
        2) # append to existing file
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            echo "$(date +%s)" >> "/home/dsillman2000/autogit/repocontents/$SELECTED_FILENAME"
            ;;
        3) # replace contents of existing file
            SELECTED_FILENAME=${CURRENT_FILENAMES[ $RANDOM % ${#CURRENT_FILENAMES[@]} ]}
            rm "./repocontents/$SELECTED_FILENAME"
            echo "$(date +%s)" >> "./repocontents/$SELECTED_FILENAME"
            ;;
    esac

done

git add ./repocontents
git commit -m "$1"
git push