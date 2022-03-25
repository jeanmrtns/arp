#!/bin/bash

clear

NET=$(ifconfig $i | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\." | tail -3 | head -1)
tabela=""

echo

for i in {3..3}; do
	for j in {0..10}; do
    if [ $i != 0 ] && [ $j != 255 ]
    then
      echo "ping -c 1 -i 1 ${NET}${i}.${j}"
        echo
      aux=`ping -c 1 -i 1 ${NET}${i}.${j} >/dev/null 2>&1 && arp -na | grep -E "${NET}${i}.${j}\)" | awk '{print $2"\t"$4}'`
      aux2=`echo "${aux}" | awk '{print $2}'`

      if [ "${aux2}" != "<incompleto>" ] ; then
          tabela="${tabela}
${aux}"
      fi
    fi
  done
done
clear

echo -e '\n\033[32;1m == End. Lógico | End. de Hardware = \033[m'
TAB=`echo "${tabela}" | grep -v ^$`

echo "${TAB}"
echo -e '\n\033[32;1m == Finish = \033[m'