START_TIME="$(date +%Y%m%d%H%M%S)"
INIT_TEMPLATE_PATH="/home/dsillman2000/crontab-copy"
TODAYS_TEMPLATE_PATH="$INIT_TEMPLATE_PATH-$START_TIME"
# clean up old template paths
rm -r /home/dsillman2000/crontab-copy-*
touch $TODAYS_TEMPLATE_PATH
cat $INIT_TEMPLATE_PATH >> $TODAYS_TEMPLATE_PATH
REPO_PATH="/home/dsillman2000/autogit"
COMMIT_TIMES=()
NUM_COMMITS=3

for i in $(seq 1 1 $NUM_COMMITS); do

    HOUR=$(( $RANDOM % 24 ))
    COMMIT_MSG="$(date +%s)$(( $RANDOM * $RANDOM ))"
    
    while [[ " ${COMMIT_TIMES[*]} " =~ " ${HOUR} " ]]; do

        HOUR=$(( $RANDOM % 24 ))

    done

    COMMIT_TIMES+=($HOUR)
    NEW_CRON_TASK="0 $HOUR * * * bash $REPO_PATH/modify_repocontents.sh \"$COMMIT_MSG\""
    echo "$NEW_CRON_TASK" >> "$TODAYS_TEMPLATE_PATH"

done

crontab $TODAYS_TEMPLATE_PATH