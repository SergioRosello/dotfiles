#!/bin/bash

#Copiar el archivo de colores
colorsFile=$1

#Ir al directorio donde se encuentra el archivo de configuración
cd ~/.config/termite

#Eliminar la parte inferior del archivo de configuración
sed -i '/colors/Q' config

#Append el contenido del archivo de tema al archivo de configuración
cat $colorsFile >> config
