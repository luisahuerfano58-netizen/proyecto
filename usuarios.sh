#!/bin/bash

consultar_usuario_actual() {
    echo "===== USUARIO ACTUAL ====="
    whoami
}

listar_usuarios() {
    echo "===== USUARIOS DEL SISTEMA ====="
    cut -d: -f1 /etc/passwd
}

crear_usuario() {
    echo "===== CREAR USUARIO ====="
    read -rp "Ingrese el nombre del nuevo usuario: " usuario

    if [[ -z "$usuario" ]]; then
        echo "Debe ingresar un nombre."
    elif [[ ! "$usuario" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
        echo "Nombre de usuario no valido."
    elif id "$usuario" >/dev/null 2>&1; then
        echo "El usuario ya existe."
    else
        sudo adduser "$usuario"
    fi
}

menu_usuarios() {
    while true; do
        clear
        echo "======= ADMINISTRACION DE USUARIOS ======="
        echo "1. Consultar usuario actual"
        echo "2. Listar usuarios del sistema"
        echo "3. Crear usuario"
        echo "4. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) consultar_usuario_actual; pausa ;;
            2) listar_usuarios; pausa ;;
            3) crear_usuario; pausa ;;
            4) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
