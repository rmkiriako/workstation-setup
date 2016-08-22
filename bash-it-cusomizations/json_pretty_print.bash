#!/usr/bin/env bash

function json_pretty_print {
   echo `cat /dev/stdin` | python -m json.tool
}

alias json=json_pretty_print

