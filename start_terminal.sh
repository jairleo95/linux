#!/bin/bash

# Obtener la resolución de la pantalla
resolution=$(xrandr | grep '*' | awk '{print $1}')

# Separar la resolución en ancho y alto
screen_width=$(echo $resolution | cut -d 'x' -f 1)
screen_height=$(echo $resolution | cut -d 'x' -f 2)

# Calcular las coordenadas para centrar la terminal
terminal_width=800
terminal_height=600

center_x=$(( (screen_width - terminal_width) / 2 ))
center_y=$(( (screen_height - terminal_height) / 2 ))

gnome-terminal --geometry=100x24+0+0 -- bpytop
sleep 1
gnome-terminal --geometry=100x24+0+600 -- nvtop
sleep 1
#gnome-terminal --geometry=80x24+$center_x+$center_y -- bash -c "htop"
gnome-terminal --geometry=80x24+$center_x+$center_y -- bash -c "echo 'Hello, Jair!'; zsh"
