if [ $# -lt 2 ]
then
	echo "Usage: $0 src des."
	exit 1
fi
if [ ! -e $1 ]
then
	echo "src $1 is not exist!!"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "src $1 is not a directory!!"
	exit 1
fi
if [ ! -e $2 ]
then
	mkdir -pv "$2"
fi
src_dir="$1"
des_dir="$2"
i=0
for file in `find "$des_dir" -type f`
do
	list[$i]=$( md5sum $file | awk '{print $1}')
	desfiles[$i]=$file
	let "i++"
done
mark=0
for src_file in `find "$src_dir" -type f`
do
	let "mark=0"
	src_file_md5=$( md5sum $src_file | awk '{print $1}')
	for (( i = 0; i < ${#list[*]}; i++ ))
	do
		if [ "${list[$i]}" = "$src_file_md5" ]
		then
			let "mark=1"
			echo "$src_file ===eq===>> ${desfiles[$i]}"
			break
		fi
	done
	if [ "$mark" -ne 1 ]
	then
		src_file_tmp=`echo "$src_file" | tr "/" "#"`
		des_dir_temp=`echo "$des_dir" | tr "/" "#"`
		src_dir_temp=`echo "$src_dir" | tr "/" "#"`
		p_dir_tmp=`echo "$src_file_tmp" | sed 's/'"$src_dir_temp"'/'"$des_dir_temp"'/' | tr "#" "/"`
		p_dir=${p_dir_tmp%/*}
		if [ ! -e "$p_dir" ]
		then
			mkdir -vp "$p_dir" 
		fi
		cp -iv "$src_file" "$p_dir"
	fi
done
