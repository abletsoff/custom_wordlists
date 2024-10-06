readarray -t names < russian_trans_names.txt
for name in ${names[@]}; do 
    if [[ $(echo "$name" | grep -P 'j$') != '' ]]; then
        echo "$name" | sed 's/j$/y/g'
        echo "$name" | sed 's/j$/i/g'
    else
        echo "$name"
    fi
done
