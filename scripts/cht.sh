#!/usr/bin/env bash
languages=`echo "cpp rust js nodejs python typescript bash latex arduino git django flask" | tr ' ' '\n'`
core_utils=`echo "rg xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf --layout reverse --border rounded`
read -p "query: " query

if echo $languages | grep -qs $selected; then
  curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
  curl cht.sh/$selected~$query
fi