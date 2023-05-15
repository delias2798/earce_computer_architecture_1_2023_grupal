import numpy
from PIL import Image


def matriz_to_array(imagen_matriz):
    """
    Esta funcion recibe una matriz con los pixeles de una imagen y retorna
    un array de elementos, donde cada elemento es la representacion RGB de 24 bits
    de un pixel de la imagen
    """
    imagen_array = []
    for fila in imagen_matriz:
        for pixel in fila:
            R = pixel[0]
            G = pixel[1]
            B = pixel[2]
            decimal_rgb = (R * 256 * 256) + (G * 256) + B
            imagen_array.append(decimal_rgb)
    return imagen_array

def imagen_pixeles(image_path, ancho, alto):
    """
    Esta funcion recibe la ruta de una imagen y retorna una array conteniendo
    a todos los pixeles RGB
    """
    image = Image.open(image_path, "r")
    # Cambair la resolucion de la imagen
    image = image.resize((ancho,alto))
    width, height = image.size
    pixel_values = list(image.getdata())
    if image.mode == "RGB":
        channels = 3
    else:
        print(f'Unknown mode: {image.mode}')
        return None
    pixel_values = numpy.array(pixel_values).reshape((height, width, channels))
    imagen_array = matriz_to_array(pixel_values)
    return imagen_array

def crear_rom_init(tam_palabra, profundidad, ancho, alto, img):
    """
    Esta funcion se encarga de crear un archivo de inicialización de una memoria ROM
    conteniendo los pixeles de una imagen.
    """
    # abrir o crear un nuevo archivo de texto en modo append
    archivo_rom = open("ram_init.mif", "a")
    
    # Agregar la estructura inicial del archivo .mif
    archivo_rom.write("-- Brrr real hasta la muerte bebecita....\n")
    archivo_rom.write("-- Mc Kevinho\n \n")
    archivo_rom.write(f'WIDTH={tam_palabra};\nDEPTH={profundidad};\n \n')
    archivo_rom.write("ADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\n \n")
    archivo_rom.write("CONTENT BEGIN\n")
    
    # Dejar 5 posiciones de memoria libres
    archivo_rom.write(f'\t{0}\t :\t {0};\n')
    contador = 1
    for pixel in img:
        archivo_rom.write(f'\t{contador}\t :\t {pixel};\n')
        contador += 1
        
    # Escribir un 1 para indicar el fin de los pixeles de la imagen
    archivo_rom.write(f'\t{contador}\t :\t {1};\n')
    # Llenar los espacios vacios con ceros
    contador += 1
    archivo_rom.write(f'\t[{contador}..{profundidad-1}]\t :\t {0};\n')
    
    archivo_rom.write("END;")
    archivo_rom.close()
        
imagen = imagen_pixeles("baby.jpg", 200, 120)
crear_rom_init(24, 64000, 200, 120, imagen)

