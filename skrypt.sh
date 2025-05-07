#!/bin/bash
if [[ "$1" == "--date" ]]; then
    date
fi

if [[ "$1" == "--logs" ]]; then
    for i in {1..100}; do
        echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: $0\nData: $(date "+%Y-%m-%d %H:%M:%S")" > log$i.txt
    done
fi
