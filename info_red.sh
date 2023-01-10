#!/bin/bash

#PING A GOOGLE
google=$(ping -qc1 8.8.8.8 2>&1 | awk -F'/' 'END{ if ($0 ~ /rtt/) printf("(%02d ms) ", $5); else print "FAIL" }')

echo "Ping a google: $google"

# Obtener la dirección IP de la puerta de enlace
gateway=$(ip r | awk '/^def/{print $3}')

# Ejecutar el comando ping
ping=$(ping -qc1 "$gateway" 2>&1 | awk -F'/' 'END{ if ($0 ~ /rtt/) printf("(%1d ms) ", $5); else print "FAIL" }')

# Mostrar el resultado
echo "Ping a $gateway" "$ping"

#IP LOCAL
IPv4=$(hostname -I | awk '{print $1}')

echo "IP Local: $IPv4"

#IP PUBLIC.
IPv4_pub=$(curl -s ifconfig.me)

echo "IP publica: $IPv4_pub"
