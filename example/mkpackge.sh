#对目录下所有的视频文件进行截图，每隔几分钟截图一次，并把视频文件打包成 .tar文件，使用对的视频处理工具
#ffmpeg
shot()
{
	
	if [ $# -lt 1 ]
	then
		echo "Usage $0 [filename]"
		exit 1
	fi
	file="$1"
	video_long=$(ffmpeg -i "$file" 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//)
	echo "$video_long"
	min=${video_long:3:2}
	hour=${video_long:1:1}
	echo "$min"
	echo "$hour"
	i=0
	while [ "$i" -lt "$hour" ]
	do
		for (( j = 0; j < 60; j+=10 )); do
			time="0"${i}":"${j}":00"
			echo "$time"
			ffmpeg -ss "$time" -i "$file" -y -f image2 -vframes 1  image-"$i""$j".jpg
		done
		let "i++"
	done
	i=1
	while [ "$i" -lt "$min" ]
	do
		if [ "$i" -lt 10 ]
		then
			temp="0"$i
		else
			temp=$i
		fi
		time="0"$hour":"$temp":00"
		echo "$time"
		ffmpeg -ss "$time" -i "$file" -y -f image2 -vframes 1  image-"$i".jpg
		let "i+=5"
	done
	if [ "$min" -lt 10 ]
	then
		temp=${min:1:1}
		if [ $temp -ne "0" ]
		then
			let "temp--"
		fi
		temp="0"$temp
	else
		let "temp=min-1"
	fi
	time="0"$hour":"$temp":10"
	ffmpeg -ss "$time" -i "$file" -y -f image2 -vframes 1  image-final.jpg
}

mytar()
{
	if [ $# -lt 1 ]
	then
		echo "Usage : $1 [filename]"
		exit 1
	fi
	file=$1
	tar_name=${file%.*}
	tar_name="$tar_name".tar
	echo "$tar_name"
	tar -cf "$tar_name" "$file"
}
#=============main
for file in ./*
do
	if [ "$file" = "$0" ] 
	then
		continue
	fi

	if [ -f "$file" ]
	then
		temp=${file%.*}
		dir_name=${temp:2}
		echo "$dir_name"
		#echo "$file"
		mkdir "$dir_name"
		mv "$file" "$dir_name"
		cd "$dir_name"
		shot "$file"
		mytar "$file"
		mv "$file" ..
		cd ..
	fi
done
echo "$0"
