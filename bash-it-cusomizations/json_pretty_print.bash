#!/usr/bin/env bash

function json_pretty_print {
   if [[ $# -eq 0 ]]; then
      echo "usage: json input_file output_file"
   else
      INPUT_FILE=$1
      OUTPUT_FILE=$2

      cat $INPUT_FILE | python -m json.tool > $OUTPUT_FILE
   fi
}

alias json=json_pretty_print
