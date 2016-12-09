if [[ $# -ne 1 ]]; then
	echo "usage: $1 URL"
	exit -1
fi
url=$1
curl -s $url #| egrep -o "<a href=[^>]*>" > temp
