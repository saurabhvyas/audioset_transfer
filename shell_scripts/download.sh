#!/bin/bash

# readme : this script takes following form 
# ./downloadv3.sh youtube_url 0/1 , where 0 and 1 represent class labels

# Requirements :
# a folder called datav2 in same directory
# a file called logs.txt in same directory

# Output
# this script outputs 3 second audio clips of input video in suitable
# format (wav 16 bit .. ) and appends class label A or B at the end of
# each file 


title=$(youtube-dl --get-title $1)

echo "$title" >> logs.txt
echo "$1" >> logs.txt
echo "$2" >> logs.txt



cd original_data

now="$(date +"%T")"

echo "$now"
zero=0

if [[ $2 -eq $zero ]]; 
then
class="A"
echo "$now"
elif [[ $2 -eq 1 ]];
then
class="B"
echo "$now"

elif [[ $2 -eq 2 ]];
then
class="C"
echo "$now"

else
class="D"
echo "$now"
fi

youtube-dl --extract-audio --audio-format mp3 --output "$now.%(ext)s" $1
sox "${now}.mp3" "${now}.wav" channels 1 rate 16000

rm "${now}.mp3"



new_name="$(echo "$now" | tr ':' '_')"
new_name2="${new_name}_${class}"

echo "$new_name2"

mv "$now.wav"  "${new_name2}.wav"
rm  "$now.wav"



python2 ../wav_splitter/split_mydata.py "../original_data/${new_name2}.wav" "$class"


#ffmpeg -i "${new_name}.wav" -f segment -segment_time 2.8 -c copy "${new_name}"%03d"$class.wav"

#rm  "${new_name}.wav"




