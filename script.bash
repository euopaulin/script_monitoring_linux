#!/bin/bash

#Esse script tem como objetivo monitor uso de CPU e memória do sistema.

echo "Monitoramento de CPU e Memória"
echo "============================================"
echo ""

monitoramento_cpu() {
    while true; do
        echo "Uso de CPU:"

        TEMPO_OCIOSO=$(top -bn1 | grep "Cpu(s)" | sed -n 's/.*, *\([0-9.]*\) *id,.*/\1/p')

        if [ -z "$TEMPO_OCIOSO" ]; then
            TEMPO_OCIOSO=0.0
            echo "Não foi possível obter o uso de CPU."
            exit 1
        fi

        USO_TOTAL=$(echo "scale=2; 100 - $TEMPO_OCIOSO" | bc)

        echo "Uso total de CPU: $(printf "%.2f" $USO_TOTAL)%"
        echo "(Ocioso: $TEMPO_OCIOSO%)"
        echo ""
        sleep 5
    done
}

monitoramento_cpu