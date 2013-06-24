#!/bin/bash
#
# check_plugin for checking a given ammount of scripts are running
#
# usefull if you want to check for scripts, not processes 
#
# dload: https://bitbucket.org/maresystem/dogtown-nagios-plugins/src
#
#

# You may have to change this, depending on where you installed your
# Nagios plugins
PROGNAME=`basename $0`
PATH="/usr/bin:/usr/sbin:/bin:/sbin"
LIBEXEC="/etc/nagios/plugins"
. $LIBEXEC/utils.sh


### DEFINING THE PROCESS LIST ###
PROCESS="dumbo"


### REQUISITE NAGIOS COMMAND LINE STUFF ###

print_usage() {
        echo "Usage: $PROGNAME [options]"
        echo "Usage: $PROGNAME --help"
}

print_help() {
        echo ""
        print_usage
        
        echo "

    OPTIONS
        -p \"process name\"
            process name, can be \"bash script_name.sh\" 
        -e [nr] 
            default: 1
            expect [nr] of running processes, if the number differs, 
            CRITICAL will be returned; this is optional, 
        
        "
}

expect_nr="1"

while getopts hp:e: opt
do

    case $opt in
        --help|-h) 
            print_help; exit $STATE_OK;;
        p)
            PROCESS="$OPTARG"
            ;;
        e)
            expect_nr="$OPTARG"
            ;;
            
        *)
            print_help
            exit $STATE_UNKNOWN
        ;;
    esac
    
done

### FINALLY THE MAIN ROUTINE ###

COUNT="0"
DOWN=""



proc_count=`ps -ef | grep -i "$PROCESS" | grep -v grep | grep -v $PROGNAME | wc -l`

if [ $proc_count -lt $expect_nr ]
then
    COUNT="1"
    DOWN="$DOWN $PROCESS"
    STATUS_TEXT="not enough processes found for $PROCESS [ running($proc_count) needed($expect_nr) ]"
elif [ $proc_count -gt $expect_nr ]
then
    COUNT="1"
    DOWN="$DOWN $PROCESS"
    STATUS_TEXT="too many processes found for $PROCESS [ running($proc_count) needed($expect_nr) ]"

else
    #ps -ef | grep -i $PROCESS | grep -v grep | grep -v $PROGNAME
    PROC_LIST="$PROC_LIST$PROCESS[$proc_count] "

fi

if [ $COUNT -gt 0 ]
then
        echo "ScriptProcs CRITICAL - $STATUS_TEXT"
        exit $STATE_CRITICAL
fi

# Nothing caused us to exit early, so we're okay.
echo "ScriptProcs OK - All requisite processes running ( $PROCESS [ running($proc_count) needed($expect_nr) ])"
exit $STATE_OK
