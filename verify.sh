#/bin/bash
if [ -f "$CSV_FILE" ];
                                     then
                      echo "This is file location $CSV_FILE"
                                       echo "csv file exists"
                  else
                                       echo "ERROR:"
                                       echo "ERROR:"
                                       echo "Please specify the csv file location"
                                       exit 1;
                                  fi
                                          MIDDLE_COLUMN_EMPTY=$(grep -no ",," $CSV_FILE | wc -l)
                                          LAST_COLUMN_EMPTY=$(awk -F "," '{ print $3}' $CSV_FILE  | grep -c '^$')
                                          FIRST_COLUMN_EMPTY=$(awk -F "," '{ print $1}' $CSV_FILE | grep -c '^$')

                                  if  [[  "$FIRST_COLUMN_EMPTY" -eq "0" && "$MIDDLE_COLUMN_EMPTY" -eq "0" && "$LAST_COLUMN_EMPTY" -eq "0" ]];
                                        then
                                           echo "The Values are properly put in place"
                                   else
                                          echo "error:"
                                          echo "error:"
                                          echo "Values are not properly Placed in the CSV there are null values !!"
                                          echo "Please verify your csv file"
                                  fi
                                  while read line;do
                                         a=$(echo $line | awk -F "," '{ print $1}')
                                         b=$(echo $line | awk -F "," '{ print $2}')
                                        if [ -e $a/$b ]
                                           then
                                                echo "file exist in the source"
                                           else
                                                echo "error:"
                                                echo "File dosent exist in the source: $a/$b "
                                                        exit 1;
                                        fi
                                 done < ${CSV_FILE}
