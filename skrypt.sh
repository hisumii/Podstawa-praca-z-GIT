#!/bin/bash
if [[ "$1" == "--date" ]]; then
    date
fi

if [[ "$1" == "--logs" ]]; then
    count=${2:-100}
    for ((i=1; i<=count; i++)); do
        echo -e "Nazwa pliku: log$i.txt\nNazwa skryptu: $0\nData: $(date "+%Y-%m-%d %H:%M:%S")" > log$i.txt
    done
fi

REPO_URL="https://github.com/hisumii/Podstawa-praca-z-GIT.git"

if [[ "$1" == "--init" ]]; then
    if [ "$(ls -A .)" ]; then
        echo "Bieżący katalog nie jest pusty."
        exit 1
    fi

    git clone "$REPO_URL" .

    export PATH="$(pwd):$PATH"
    echo "Dodano $(pwd) do PATH"
    echo "export PATH=\"$(pwd):\$PATH\""
fi

show_help() {
    echo "Użycie: $0 [opcje]"
    echo
    echo "Dostępne opcje:"
    echo "  --help        Wyświetl tę pomoc"
    echo "  --date        Wyświetl aktualną datę"
    echo "  --logs [N]    Utwórz N plików logx.txt (domyślnie 100)"
}

if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi
