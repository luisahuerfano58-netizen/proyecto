#!/bin/bash

pausa() {
    read -rp "Presione ENTER para continuar..."
}

crear_backup() {
    echo "===== CREAR COPIA DE SEGURIDAD ====="
    read -rp "Ingrese la ruta del directorio: " ruta
    ruta="${ruta/#\~/$HOME}"

    if [[ ! -d "$ruta" ]]; then
        echo "ERROR: El directorio no existe."
        return
    fi

    fecha=$(date '+%Y%m%d_%H%M%S')
    nombre="backup_${fecha}.tar.gz"
    destino="$BASE/backups/$nombre"

    if tar -czf "$destino" -C "$(dirname "$ruta")" "$(basename "$ruta")"; then
        echo "Copia de seguridad creada correctamente:"
        echo "$destino"
    else
        echo "Error al crear la copia de seguridad."
        rm -f "$destino"
    fi
}

consultar_backups() {
    echo "===== COPIAS DE SEGURIDAD EXISTENTES ====="
    if compgen -G "$BASE/backups/*.tar.gz" > /dev/null; then
        ls -lh "$BASE/backups"/*.tar.gz
    else
        echo "Todavia no hay copias de seguridad."
    fi
}

menu_backups() {
    while true; do
        clear
        echo "======= MODULO DE BACKUPS ======="
        echo "1. Crear copia de seguridad"
        echo "2. Consultar copias existentes"
        echo "3. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) crear_backup; pausa ;;
            2) consultar_backups; pausa ;;
            3) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
