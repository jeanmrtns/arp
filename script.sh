#!/bin/bash

clear

# arp -na
# ip addr

# NETID = IP && NetMask


NET=$(ifconfig $i | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\." | tail -3 | head -1)
tabela=''

echo

for i in {0..31}; do
	for j in {0..255}; do
    echo "ping -c 1 -i 1 ${NET}${j}.${i}"
        echo
	  aux=`ping -c 1 -i 1 ${NET}${j}.${i} >/dev/null 2>&1 && arp -na | grep -E "${NET}${i}" | awk '{print $2"\t"$4}'`
    aux2=$(echo $aux | awk '{ print $2;}')

    if [[ $(echo $aux2) != "<incompleto>" ]]
      then
        tabela="${tabela}
${aux}"
    fi
  done
done
clear

# echo "End. Lógico	End. de Hardware"
echo -e '\n\033[32;1m == End. Lógico | End. de Hardware = \033[m'

TAB=`echo "${tabela}" | grep -v ^$`
echo "${TAB}"
echo -e '\n\033[32;1m == Finish = \033[m'
