#!/bin/bash


function print_usage() {
    echo ""
    echo "Usage: $0 QUALITY FILE..."
}

if ! [[ -n $1 ]]; then
    echo "Missing quality. Please specify a number between 1 and 100."
    print_usage
    exit 1
fi
if ! (( $1 >= 1 && $1 <= 100 )); then
    echo "Quality must be a number between 1 and 100."
    print_usage
    exit 1
fi
if ! [[ -n $2 ]]; then
    echo "Missing an image. Please specify one or more JPEG files."
    print_usage
    exit 1
fi

target_quality=$1
input_files="${@:2}"


# Displays a number of bytes in a human readable format
# $1 bytes
disp() {
    s=$1
    i=1
    while [ $(echo "$s >= 1024" | bc -l) = "1" ]; do
        s=$(bc <<< "scale=2;$s/1024")
        ((i+=1))
    done

    case $i in
        1) s+="B" ;;
        2) s+="K" ;;
        3) s+="M" ;;
        4) s+="G" ;;
        5) s+="T" ;;
        6) s+="P" ;;
    esac

    printf "%s" $s
}

RESET="\x1B[0m"

# all sizes are in bytes
total_source_size=0
total_compressed_size=0
total_destination_size=0

echo -e "\nLimiting quality of $(ls -1q $input_files | wc -l) files to $target_quality%...\n"

for source_path in $input_files; do
    if ! [ -f $source_path ]; then
        echo "Ignoring $source_path"
        continue
    fi

    source_quality=$(identify -format '%Q' "$source_path")
    source_size=$(stat -c %s "$source_path")
    destination_path="c_$source_path"

    if [[ $source_quality -ge $target_quality ]]; then
        convert -quality $target_quality "$source_path" "$destination_path"
    else
        cp "$source_path" "$destination_path"
    fi

    destination_quality=$(identify -format '%Q' "$destination_path")
    destination_size=$(stat -c %s "$destination_path")

    if [[ $destination_size -lt $source_size ]]; then
        fg_color="\x1b[38;5;118m▼"  # green
    elif [[ $destination_size -gt $source_size ]]; then
        fg_color="\x1b[38;5;196m▲"  # red
    else
        fg_color="\x1B[0m "
    fi

    printf "%s: %3s %8s => %3s $fg_color%8s$RESET\n" $source_path $source_quality $(disp $source_size) $destination_quality $(disp $destination_size)

    total_source_size=$(($total_source_size + $source_size))
    total_destination_size=$(($total_destination_size + $destination_size))

done

# Summarized inforamation
if [[ $total_destination_size -lt $total_source_size ]]; then
    fg_color="\x1b[38;5;118m▼ "  # green
elif [[ $total_destination_size -gt $total_source_size ]]; then
    fg_color="\x1b[38;5;196m▲ "  # red
else
    fg_color="\x1B[0m "
fi

echo ""
printf "total: %1s => $fg_color%1s$RESET\n" $(disp $total_source_size) $(disp $total_destination_size)
