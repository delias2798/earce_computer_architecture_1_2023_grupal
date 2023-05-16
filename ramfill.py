import cv2
import numpy as np
 
def dec_to_bin_concat(pixel_array):
    # Convert each decimal number to a hexadecimal string with 2 digits
    bin_N1 = bin(pixel_array[0])[2:].zfill(8)
    bin_N2 = bin(pixel_array[1])[2:].zfill(8)
    bin_N3 = bin(pixel_array[2])[2:].zfill(8)
    bin_N4 = bin(pixel_array[3])[2:].zfill(8)

    # Concatenate the hexadecimal strings
    bin_concat = bin_N1 + bin_N2 + bin_N3 + bin_N4

    # Return the concatenated hexadecimal string
    return bin_concat
 
def create_mem_file(word=32, deep=45100, image_file1="tessia1.jpg"):
    """
    Esta funcion se encarga de crear un archivo de inicialización de una memoria ROM
    conteniendo los pixeles de una imagen.
    """
    # abrir o crear un nuevo archivo de texto en modo append
    file = open("TessiaV1/ram_data.txt", "r+")

    # Agregar la estructura inicial del archivo .txt
    # Write 100 words with 0
    for i in range(94):
        file.write("00000000000000000000000000000000\n")
        if(i == 15):
            file.write("00000000000000000101100001001000\n")
            file.write("00000000000000000000000011111111\n")
            file.write("00000000000000010100011001000110\n")
            file.write("00000000000000000000000001111000\n")
            file.write("00000000000000000000000001110110\n")
            file.write("00000000000000000000000000000001\n")

    # Read the image 1 and convert it to Gray Scale
    A = cv2.imread(image_file1, cv2.IMREAD_GRAYSCALE)
    A = cv2.resize(A, (300, 300))
    A = A.flatten()
    # Loop the image 1 row and colums
    quarter_counter = 1
    quarter_pixels = []
    max_value = len(A)
    for i in range(0, max_value):
        quarter_pixels.append(A[i])
        if (quarter_counter == 4):
            quarter_pixels = quarter_pixels[::-1]
            string_to_write = dec_to_bin_concat(quarter_pixels)
            file.write(f'{string_to_write}')
            file.write('\n')
            quarter_counter = 1
            quarter_pixels = []
        else:
            quarter_counter += 1
              
    for i in range(22500):
        file.write("00000000000000000000000000000000\n")
    file.close()
        
create_mem_file(word=32, deep=45100, image_file1="tessia1.jpg")
