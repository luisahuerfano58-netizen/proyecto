#!/bin/bash

limpiar_cache_apt() {
    echo "===== LIMPIAR CACHE APT ====="
    sudo apt clean
    echo "Proceso finalizado."
}

eliminar_paquetes() {
    echo "===== ELIMINAR PAQUETES INNECESARIOS ====="
    sudo apt autoremove
}

consultar_espacio_disco() {
    echo "===== ESPACIO DEL DISCO ====="
    df -h
}

menu_limpieza() {
    while true; do
        clear
        echo "======= MODULO DE LIMPIEZA ======="
        echo "1. Limpiar cache APT"
        echo "2. Eliminar paquetes innecesarios"
        echo "3. Consultar espacio del disco"
        echo "4. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) limpiar_cache_apt; pausa ;;
            2) eliminar_paquetes; pausa ;;
            3) consultar_espacio_disco; pausa ;;
            4) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
