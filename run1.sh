#!/bin/bash
exec 2>/storage/emulated/0/Documents/llavaerror.txt
file=/storage/emulated/0/Documents/pic.jpg
file1=/storage/emulated/0/Documents/pic1.jpg
file2=/storage/emulated/0/Documents/prompt.txt
file3=/storage/emulated/0/Documents/prompt1.txt
file4=/storage/emulated/0/Documents/
while true; do
echo "running"
while [ ! -f "$file2" ]
do
inotifywait -qqt 2 -e create "$file4"
done
echo "prompted"
prompt=$(cat $file2)
echo $prompt
#./llava-cli -m /storage/emulated/0/Documents/ggml-model-q5_k.gguf --mmproj /storage/emulated/0/Documents/mmproj-model-f16.gguf  --image /storage/emulated/0/Documents/pic.jpg -p "$prompt" --temp 0.1 --verbose-prompt
(/data/data/com.termux/files/home/llama.cpp/build/bin/llava-cli -m /storage/emulated/0/Documents/ggml-model-q5_k.gguf --mmproj /storage/emulated/0/Documents/mmproj-model-f16.gguf  --image /storage/emulated/0/Documents/pic.jpg -p "$prompt" --temp 0.1 --verbose-prompt | sed '1,/^encode_image_with_clip/d') >/storage/emulated/0/Documents/llava.txt
mv "$file2" "$file3"
done
