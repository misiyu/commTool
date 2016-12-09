if [ $# -ne 3 ];
then
	echo "Usage: $0 URL -d DIRECTORY"
	exit -1
fi
for i in {1..4}
do
	case $1 in
	-d) shift; directory=$1; shift ;;
	*) url=${url:-$1}; shift;;
	esac
done
mkdir -p $directory;
baseurl=$(echo $url | egrep -o "https?://[a-z.]+")
echo Downloading $url
curl -s $url | egrep -o "<img src=[^>]*>" |
sed "s/^/|$baseurl/|" /temp/$$.list
cd $directory;
while read filename;
do
	echo Downloading $filename
	curl -s -o "$filename" --silent
done < /temp/$$.list
