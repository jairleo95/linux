#!/bin/bash

# Obtener la resolución de la pantalla
resolution=$(xrandr | grep '*' | awk '{print $1}')

# Separar la resolución en ancho y alto
screen_width=$(echo $resolution | cut -d 'x' -f 1)
screen_height=$(echo $resolution | cut -d 'x' -f 2)

# Definir las dimensiones de la terminal en píxeles
terminal_width=1280  # Ajusta este valor según las proporciones
terminal_height=720  # Ajusta este valor según las proporciones

# Calcular las coordenadas para centrar la terminal
center_x=$(( (screen_width - terminal_width) / 2 ))
center_y=$(( (screen_height - terminal_height) / 2 ))

# Convertir las dimensiones a columnas y filas aproximadas (asumiendo 8x16 píxeles por carácter)
columns=$((terminal_width / 8))
rows=$((terminal_height / 16))

# Abrir la primera terminal centrada en la pantalla
gnome-terminal --geometry=100x24+0+0 -- bpytop
sleep 1
gnome-terminal --geometry=100x24+0+600 -- nvtop
sleep 1
# Abrir la segunda terminal centrada en la pantalla y mantenerla abierta
gnome-terminal --geometry=${columns}x${rows}+${center_x}+${center_y} -- bash -c "echo 'Hello, Jair!'; zsh"