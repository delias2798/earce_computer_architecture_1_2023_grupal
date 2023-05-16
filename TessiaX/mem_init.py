import cv2
import numpy as np
 
def dec_to_hex_concat(pixel_array):
    # Convert each decimal number to a hexadecimal string with 2 digits
    hex_N1 = hex(pixel_array[0])[2:].zfill(2)
    hex_N2 = hex(pixel_array[1])[2:].zfill(2)
    hex_N3 = hex(pixel_array[2])[2:].zfill(2)
    hex_N4 = hex(pixel_array[3])[2:].zfill(2)

    # Concatenate the hexadecimal strings
    hex_concat = hex_N1 + hex_N2 + hex_N3 + hex_N4

    # Return the concatenated hexadecimal string
    return hex_concat

def create_mem_dat(output_filename="tessia.dat", image_file1="tessia1.jpg", image_file2="tessia2.jpg"):
    dat = open(output_filename, "a")
    # Write 100 words with 0
    # for i in range(0, 100):
    #     dat.write(f'{dec_to_hex_concat([0, 0, 0, 0])}\n')
        
    # # Read the image 1 and convert it to Gray Scale
    A = cv2.imread(image_file1, cv2.IMREAD_GRAYSCALE)
    A = cv2.resize(A, (300, 300))
    A = A.flatten()
    # Loop the image 1 row and colums
    
    counter = 100
    quarter_counter = 1
    quarter_pixels = []
    max_value = len(A)
    for i in range(0, max_value):
        quarter_pixels.append(A[i])
        if (quarter_counter == 4):
            quarter_pixels = quarter_pixels[::-1]
            string_to_write = dec_to_hex_concat(quarter_pixels)
            dat.write(f'{string_to_write}\n')
            quarter_counter = 1
            counter += 1
            quarter_pixels = []
        else:
            quarter_counter += 1
            
    dat.write(f'{dec_to_hex_concat([0, 0, 0, 0])}\n')
    
    # Read the image 2 and convert it to Gray Scale
    A = cv2.imread(image_file2, cv2.IMREAD_GRAYSCALE)
    A = cv2.resize(A, (300, 300))
    A = A.flatten()
    # Loop the image 2 row and colums
    quarter_counter = 1
    quarter_pixels = []
    max_value = len(A)
    for i in range(0, max_value):
        quarter_pixels.append(A[i])
        if (quarter_counter == 4):
            quarter_pixels = quarter_pixels[::-1]
            string_to_write = dec_to_hex_concat(quarter_pixels)
            dat.write(f'{string_to_write}\n')
            quarter_counter = 1
            counter += 1
            quarter_pixels = []
        else:
            quarter_counter += 1
               

create_mem_dat()


        
