filename="russian_trans_names_eddited.txt"

readarray -t names < russian_trans_names.txt
for name in ${names[@]}; do 
    if [[ $(echo "$name" | grep -P 'j$') != '' ]]; then
        if [[ $(echo "$name" | grep -P 'ij$') != '' ]]; then
            echo "$name" | sed 's/j$//g' >> "$filename.tmp"
            echo "$name" | sed 's/ij$/y/g' >> "$filename.tmp"
        fi

        echo "$name" | sed 's/j$/y/g' >> "$filename.tmp"
        echo "$name" | sed 's/j$/i/g' >> "$filename.tmp"
    else 
        echo "$name" >> "$filename.tmp"
    fi
done

perl -ne 'print unless $seen{$_}++' "$filename.tmp" > "$filename"
rm "$filename.tmp"
