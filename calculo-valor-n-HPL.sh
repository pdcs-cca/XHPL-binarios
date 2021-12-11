#!/bin/bash

    for node in /sys/devices/system/node/node*;
    do
        echo "Valor de n para el uso del 80% de memoria del nodo NUMA $node == ";
        echo sqrt \( \( $(awk '/MemTotal:/{print $4}' $node/meminfo ) \* 800 \) / 8 \) | bc;
    done;
    
    echo "Valor de n para el uso del 80% de la memoria disponible en todo el sistema  == ";
    echo sqrt \( \( $(awk '/MemTotal:/{print $2}' /proc/meminfo ) \* 800 \) / 8 \) | bc


