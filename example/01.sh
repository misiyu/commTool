#检查文件是否已经排过序``
sort -C test1;
if [ $? -eq  0 ];
then echo Sorted;
else
	echo Unsorted;
fi
