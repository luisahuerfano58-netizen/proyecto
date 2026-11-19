#!/bin/bash

consultar_version_debian() {
    echo "===== VERSION DE DEBIAN ====="
    if [[ -r /etc/os-release ]]; then
        . /etc/os-release
        echo "${PRETTY_NAME:-No disponible}"
    else
        echo "No se pudo consultar /etc/os-release."
    fi
}

consultar_nombre_equipo() {
    echo "===== NOMBRE DEL EQUIPO ====="
    hostname
}

consultar_kernel() {
    echo "===== VERSION DEL KERNEL ====="
    uname -r
}

consultar_fecha_hora() {
    echo "===== FECHA Y HORA ====="
    date
}

menu_sistema() {
    while true; do
        clear
        echo "======= INFORMACION DEL SISTEMA ======="
        echo "1. Version de Debian"
        echo "2. Nombre del equipo"
        echo "3. Version del Kernel"
        echo "4. Fecha y hora"
        echo "5. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) consultar_version_debian; pausa ;;
            2) consultar_nombre_equipo; pausa ;;
            3) consultar_kernel; pausa ;;
            4) consultar_fecha_hora; pausa ;;
            5) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
