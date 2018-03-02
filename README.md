

Description

This simple project, uses Google'es pretrained model, to build a new classifer, The VGGish model can be used for extracting audio features, which I pass into my own network, which classifies audio into 4 categories. More in the jupyter notebook file.

Adapted from, Tensorflow Models Audioset pretrained model code, provided by communnity
https://github.com/tensorflow/models/tree/master/research/audioset



Usage :

 For Training :

 use shell scripts provided in shell_scripts folder

 1. download.sh < youtube url> <class index>
    this will download the audio of youtube url, and convert it into a suitable format, and split
    them into 2 seconds fragments using wav_splitter project ( see subfolder )


 2. In the output folder, you will get your files, however the end fragment file is less than 2 second, so delete that 

 3. repeat this for all categories

 4. then use dataset_creation.sh, this will create a dataset.txt file, each row has training filename
    (labels will be inferred automatically in jupyter notebook)

 5. Now follow instructions on train_my_modelv3 notebook 


 For Inference :

  1. Use sox commands below to download audio from youtube, and finally extract 1 second file , or provide your own file(but do required preprocessing as indicated in one of the commands ), then follow instructions on train_my_modelv3 notebook 


To Do / Further Improvements

Add Sound Normalization ?
Experiment with freesounds.org data


Important Sox Commands

split audio into multiple chunks of 1 second 
ffmpeg -i b52.wav -f segment -segment_time 1 -c copy fragments/out%03d.wav

download audio from a youtube url
youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=EdQJVGZmp-E

convert into suitable format
sox "${now}.mp3" "${now}.wav" channels 1 rate 16000
