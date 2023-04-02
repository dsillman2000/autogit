# autogit

This project uses an automated sequence of shell scripts, orchestrated by `cron`, to periodically commit random data to this repository. 

The sole purpose of this project is to artificially boost my GitHub calendar activity.

`gen_random_crontab.sh` builds a random schedule of git commits at midnight each day.

`modify_repocontents.sh` executes a sequence of random committable modifications to the "repocontents" subdirectory and commits them to this repo.
