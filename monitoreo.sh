#!/bin/bash

consultar_ram() {
    echo "===== USO DE MEMORIA RAM ====="
    free -h
}

consultar_cpu_procesos() {
    echo "===== INFORMACION DEL CPU ====="
    lscpu | head -n 15
    echo
    echo "===== PROCESOS ACTIVOS (MAYOR USO DE CPU) ====="
    ps aux --sort=-%cpu | head -n 10
}

consultar_almacenamiento() {
    echo "===== ALMACENAMIENTO ====="
    df -h
}

consultar_tiempo_encendido() {
    echo "===== TIEMPO DE FUNCIONAMIENTO ====="
    uptime -p
}

menu_monitoreo() {
    while true; do
        clear
        echo "======= MONITOREO DEL SISTEMA ======="
        echo "1. Consultar memoria RAM"
        echo "2. Consultar CPU y procesos"
        echo "3. Consultar almacenamiento"
        echo "4. Consultar tiempo encendido"
        echo "5. Regresar"
        read -rp "Seleccione: " opcion
        case "$opcion" in
            1) consultar_ram; pausa ;;
            2) consultar_cpu_procesos; pausa ;;
            3) consultar_almacenamiento; pausa ;;
            4) consultar_tiempo_encendido; pausa ;;
            5) break ;;
            *) echo "Opcion incorrecta."; pausa ;;
        esac
    done
}
