#!/bin/bash

clear

# arp -na
# ip addr

# NETID = IP && NetMask

NET="10.132.3."
tabela=''

echo

for i in {5..18}; do
	for j in {3..3}; do
    echo "ping -c 1 10.132.${j}.${i}"
        echo
	  aux=`ping -c 1 10.132.${j}.${i} >/dev/null 2>&1 && arp -na | grep -E "${NET}${i}" | awk '{print $2"\t"$4}'`
    aux2=$(echo $aux | awk '{ print $2;}')

    if [[ $(echo $aux2) != "<incompleto>" ]]
      then
        tabela="${tabela}
   ${aux}"
    fi
  done
done
clear

echo "End. Lógico	End. de Hardware"
echo " -- . : . -- "
echo
echo "${tabela}"
echo
echo " -- . : . -- "
