#删除内容重复的文件
ls -lS --time-style=long-iso | awk 'BEGIN {
	getline;
	getline;
	name1=$8;
	size=$5;
}
{
	name2=$8;
	if (size==$5)
	{
		"md5sum "name1 | getline; csum1=$1;
		"md5sum "name2 | getline; csum2=$2;
		if( csum1==csum2  )
		{
			print name1;
			print name2
		}
	};
}'
