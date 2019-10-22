old_IFS=$IFS
IFS=$'\n'
rm play.sh
for line in `cat happybirthday.txt`; do
    freq=$(echo $line | awk -F ' ' '{print $1}')
    duration=$(echo $line | awk -F ' ' '{print $2}')

    echo "play -n synth `python -c "print($duration/1000.0)"` sine $freq vol 0.5" >> play.sh
done
echo "echo 'Note that you need to install sox with \"sudo apt install sox\".' " >> play.sh
echo "sleep 5" >> play.sh


IFS=$old_IFS
chmod +x play.sh
#awk '{$1=$1};1'