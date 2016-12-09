for img in `find . -maxdepth 1 -iname '*.jpg' -type f`
do
	convert -resize 300x450! $img $img
done
