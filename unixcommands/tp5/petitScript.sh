#!/bin/bash

echo $0
echo $#
echo $$


for i in $(seq 1 $#)
do
  echo ${!i}
done
