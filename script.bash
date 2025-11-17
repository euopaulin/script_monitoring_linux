#!/bin/bash

#Esse script tem como objetivo monitor uso de CPU e memória do sistema.

echo "Monitoramento de CPU e Memória"
echo "============================================"
echo ""

monitoramento_cpu() {
    while true; do
        echo "Uso de CPU:"

        USO_CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

        USO_SISTEMA=$(top -bn1 | grep "Cpu(s)" | awk '{print $4}' | cut -d'%' -f1)

        USO_TOTAL=$(echo "$USO_CPU + $USO_SISTEMA" | bc -l)

        echo "Uso de CPU pelo sistema: $USO_SISTEMA%"
        echo "Uso de CPU pelo usuário: $USO_CPU%"
        echo "Uso total de CPU: $USO_TOTAL%"
        echo ""
        sleep 5
    done
}

monitoramento_cpu