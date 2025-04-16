#!/bin/zsh

for i in `seq 1 10`
do
echo "Mon premier Script !"
done


i1=$(ls -a)
i2="grep -R 'tutu' ~"
i3=$(echo $SHELL)
echo $i1
echo $i2
echo $i3




