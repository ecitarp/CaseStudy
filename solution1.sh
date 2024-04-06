mkdir -p deployPackage/added deployPackage/removed
touch added.txt removed.txt
while read line
do
fnamepath=`echo $line | awk -F" " '{print $2}'`
fname=`basename $fnamepath`
if [ "`echo $line | awk -F" " '{print $1}'`" = "M" -o "`echo $line | awk -F" " '{print $1}'`" = "A" ];then
echo $fname >> added.txt
mv $fnamepath deployPackage/added/
else
echo $fname >> removed.txt
mv $fnamepath deployPackage/removed/
fi
done <  file_diff.txt
