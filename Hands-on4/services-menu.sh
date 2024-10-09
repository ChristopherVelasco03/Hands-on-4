# Función para mostrar el menú
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un fichero/carpeta"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar el uso del comando 'awk'"
    echo "5. Mostrar el uso del comando 'grep'"
    echo "6. Salir"
}

# Función para listar contenido de un fichero o carpeta
listar_contenido() {
    read -p "Ingrese la ruta absoluta del fichero/carpeta: " ruta
    if [ -d "$ruta" ]; then
        echo "Contenido de la carpeta $ruta:"
        ls "$ruta"
    elif [ -f "$ruta" ]; then
        echo "Contenido del fichero $ruta:"
        cat "$ruta"
    else
        echo "Ruta no válida."
    fi
}

# Función para crear un archivo de texto
crear_archivo_texto() {
    read -p "Ingrese la ruta donde quiere crear el archivo: " ruta_archivo
    read -p "Ingrese la línea de texto para almacenar: " texto
    echo "$texto" > "$ruta_archivo"
    echo "Archivo creado con éxito en $ruta_archivo"
}

# Función para comparar dos archivos de texto
comparar_archivos() {
    read -p "Ingrese la ruta del primer archivo: " archivo1
    read -p "Ingrese la ruta del segundo archivo: " archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2" > /dev/null
        if [ $? -eq 0 ]; then
            echo "Los archivos son idénticos."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Función para mostrar el uso de awk
uso_awk() {
    echo "Uso de 'awk': Procesando archivo de ejemplo"
    echo "Nombre, Edad" > ejemplo.txt
    echo "Ana, 25" >> ejemplo.txt
    echo "Luis, 30" >> ejemplo.txt
    awk -F, '{print $1 " tiene " $2 " años."}' ejemplo.txt
    rm ejemplo.txt
}

# Función para mostrar el uso de grep
uso_grep() {
    echo "Uso de 'grep': Buscando 'Linux' en archivo de ejemplo"
    echo -e "Linux es genial.\nAmo Linux.\nNo uso Windows." > ejemplo.txt
    grep 'Linux' ejemplo.txt
    rm ejemplo.txt
}

# Bucle principal del menú
while true; do
    mostrar_menu
    read -p "Ingrese una opción: " opcion
    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo_texto ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) echo "Saliendo..." ; exit ;;
        *) echo "Opción no válida. Intente de nuevo." ;;
    esac
    echo ""
done
