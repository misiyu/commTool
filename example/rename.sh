#重命名jpg和png文件
count=10
for img in `find . -maxdepth 1 -iname '*.png' -o -iname '*.jpg' -type f `
do
	new=image-$count.${img##*.}
	echo "Rename $img to $new"
	mv "$img" "$new"
	let count++
done


for fil in `find . -iname Thumbs.db`
do
	rm $fil
done