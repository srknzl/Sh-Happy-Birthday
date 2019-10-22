old_IFS=$IFS
IFS=$'\n'
rm play.sh
for line in `cat music.txt`; do
    freq=$(echo $line | awk -F ' ' '{print $1}')
    duration=$(echo $line | awk -F ' ' '{print $2}')
    sleep=$(echo $line | awk -F ' ' '{print $3}')

    echo "play -n synth `python -c "print($duration/1000.0)"` sine $freq vol 0.5" >> play.sh
    echo "sleep `python -c "print($sleep/1000.0)"`" >> play.sh
done

IFS=$old_IFS
chmod +x play.sh
#awk '{$1=$1};1'