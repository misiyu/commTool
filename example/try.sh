url=$1
imgdir=$2
for imgurl in `curl -s $url | egrep -o "<img src=[^>]*>" | egrep -o "http:.*\.(jpg|png)"`
do	
	echo $imgurl
	wget  -P $imgdir $imgurl
done
