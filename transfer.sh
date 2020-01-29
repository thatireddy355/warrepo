#!/bin/bash
username=ubuntu
dire=test_backup
ip_address=34.201.41.96
ssh $username@$ip_address "mkdir -p $dire"

while IFS="," read f1 f2 f3
                        do
                        echo "Source path:" $f1
                        echo "File      :" $f2
                        echo "Target    :" $f3
                        echo scp $f1$f2 $username@$ip_address:$f3/$dire
                        scp $f1$f2 $username@$ip_address:$f3/$dire
                        echo "file copied to destination server"
                        echo "__________________"
        done< ${CSV_FILE}
