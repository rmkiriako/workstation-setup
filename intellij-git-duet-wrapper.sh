#!/usr/bin/env bash

if [[ "$3" == "commit" ]] ; then
   shift 3
   exec git duet-commit "$@"
fi

exec git "$@"

