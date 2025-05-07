#!/bin/bash

REPO_URL="https://github.com/hisumii/Podstawa-praca-z-GIT.git"

show_help() {
    echo "Jak używać tego skryptu:"
    echo "  --help  albo -h   pokazuje tę pomoc"
    echo "  --date  albo -d   pokazuje aktualną datę"
    echo "  --logs N  albo -l N   tworzy N plików logx.txt (jeśli nie podasz N, zrobi 100 plików)"
    echo "  --error N  albo -e N   tworzy N plików errorx.txt (jeśli nie podasz N, zrobi 100 plików)"
    echo "  --init albo -i   klonuje repozytorium w aktualnym katalogu"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help

elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date "+%Y-%m-%d %H:%M:%S"

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    count=${2:-100}
    for ((i=1; i<=count; i++)); do
        echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: $0\nData: $(date "+%Y-%m-%d %H:%M:%S")" > log$i.txt
    done
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    count=${2:-100}
    for ((i=1; i<=count; i++)); do
        echo -e "Nazwa pliku: error$i.txt\nNazwa skryptu: $0\nData: $(date "+%Y-%m-%d %H:%M:%S")" > error$i.txt
    done
elif [[ "$1" == "--init" || "$1" == "-i" ]]; then
    if [ "$(ls -A .)" ]; then
        echo "Bieżący katalog nie jest pusty."
        exit 1
    fi

    git clone "$REPO_URL" .

    export PATH="$(pwd):$PATH"
    echo "Dodano $(pwd) do PATH"
    echo "export PATH=\"$(pwd):\$PATH\""
else
    echo "Nie znam tej opcji. Wpisz --help albo -h, żeby zobaczyć co można zrobić."
fi
