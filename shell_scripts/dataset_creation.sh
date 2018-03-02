#!/bin/bash


# this script is used to create corresponding dataset.txt file

# replace data with your directory

rm "dataset.txt"
touch "dataset.txt"

cd "data"

for filename in *.wav; do
    echo $filename
    echo "$filename" >> ../dataset.txt
done


