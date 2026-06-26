#!/bin/bash

flaga=$1
argument=$2

case "$flaga" in
    --date|-d)
        date
        ;;
    --logs|-l)
        liczba_plikow=100
        if [ -not -z "$argument" ]; then
            liczba_plikow=$argument
        fi
        
        for ((i=1; i<=liczba_plikow; i++)); do
            nazwa_pliku="log${i}.txt"
            echo "Nazwa pliku: $nazwa_pliku" > "$nazwa_pliku"
            echo "Utworzono przez: skrypt.sh" >> "$nazwa_pliku"
            echo "Data utworzenia: $(date)" >> "$nazwa_pliku"
        done
        echo "Wygenerowano $liczba_plikow plikow logow."
        ;;
    --error|-e)
        liczba_errorow=100
        if [ -not -z "$argument" ]; then
            liczba_errorow=$argument
        fi
        
        for ((i=1; i<=liczba_errorow; i++)); do
            mkdir -p "error${i}"
            nazwa_pliku="error${i}/error${i}.txt"
            echo "Blad krytyczny w pliku $i" > "$nazwa_pliku"
        done
        echo "Wygenerowano $liczba_errorow folderow error."
        ;;
    --init)

        git clone https://github.com/dsw53506i/lab3np . 2>/dev/null
        export PATH="$PATH:$(pwd)"
        echo "Repozytorium zainicjalizowane, sciezka dodana do PATH."
        ;;
    --help|-h)
        echo "Dostepne opcje skryptu:"
        echo "  --date,  -d       - Wyswietla dzisiejsza date"
        echo "  --logs,  -l [N]   - Tworzy N plikow logow (domyslnie 100)"
        echo "  --error, -e [N]   - Tworzy N folderow error (domyslnie 100)"
        echo "  --init            - Klonuje repozytorium i dodaje do PATH"
        echo "  --help,  -h       - Wyswietla te pomoc"
        ;;
    *)
        echo "Nieznana opcja. Uzyj --help lub -h, aby zobaczyc dostepne flagi."
        ;;
esac