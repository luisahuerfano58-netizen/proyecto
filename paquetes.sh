#!/bin/bash

actualizar_repositorios() {
    echo "===== ACTUALIZAR REPOSITORIOS ====="
    sudo apt update
}

actualizar_sistema() {
    echo "===== ACTUALIZAR SISTEMA ====="
    sudo apt upgrade
}

buscar_paquete() {
    echo "===== BUSCAR PAQUETE ====="
    read -rp "Ingrese el nombre del paquete: " paquete
    if [[ -z "$paquete" ]]; then
        echo "Debe ingresar un nombre."
    else
        apt search "$paquete"
    fi
}

instalar_paquete() {
    echo "===== INSTALAR PAQUETE ====="
    read -rp "Ingrese el nombre del paquete: " paquete
    if [[ -z "$paquete" ]]; then
        echo "Debe ingresar un nombre."
    else
        sudo apt install "$paquete"
    fi
}

menu_paquetes() {
    while true; do
        clear
        echo "======= ADMINISTRACION DE PAQUETES ======="
        echo "1. Actualizar repositorios"
        echo "2. Actualizar sistema"
        echo "3. Buscar paquete"
        echo "4. Instalar paquete"
        echo "5. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) actualizar_repositorios; pausa ;;
            2) actualizar_sistema; pausa ;;
            3) buscar_paquete; pausa ;;
            4) instalar_paquete; pausa ;;
            5) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
