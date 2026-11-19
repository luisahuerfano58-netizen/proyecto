#!/bin/bash

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULOS="$BASE/modulos"
LOG="$BASE/logs/administracion.log"

mkdir -p "$BASE/backups" "$BASE/logs"

source "$MODULOS/backups.sh"
source "$MODULOS/limpieza.sh"
source "$MODULOS/monitoreo.sh"
source "$MODULOS/usuarios.sh"
source "$MODULOS/sistema.sh"
source "$MODULOS/paquetes.sh"

while true; do
    clear
    echo "=========================================="
    echo "       MENU DE ADMINISTRACION"
    echo "               DEBIAN 13"
    echo "=========================================="
    echo
    echo "  1. Copias de seguridad"
    echo "  2. Limpieza y mantenimiento"
    echo "  3. Monitoreo del sistema"
    echo "  4. Administracion de usuarios"
    echo "  5. Informacion del sistema"
    echo "  6. Administracion de paquetes"
    echo "  7. Salir"
    echo
    echo "=========================================="
    read -rp "Seleccione una opcion: " opcion

    case "$opcion" in
        1) menu_backups ;;
        2) menu_limpieza ;;
        3) menu_monitoreo ;;
        4) menu_usuarios ;;
        5) menu_sistema ;;
        6) menu_paquetes ;;
        7)
            echo "Saliendo del programa..."
            echo "$(date '+%F %T') - El usuario salio del programa" >> "$LOG"
            exit 0
            ;;
        *)
            echo "Opcion incorrecta."
            pausa
            ;;
    esac

    echo "$(date '+%F %T') - Opcion seleccionada: $opcion" >> "$LOG"
done
