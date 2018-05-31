#!/bin/bash

keyword=$1
echo $keyword
if [ "$keyword" = "" ] ; then
  echo "Check a keyword."
  exit
fi

md_file=${keyword}.md
echo "# "${keyword}" snippets" > $md_file
git add $md_file
git commit -m "add "${keyword}".md"

