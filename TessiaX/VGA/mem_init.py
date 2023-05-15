import numpy as np
import cv2
import matplotlib.pyplot as plt

     
def init(imageName):
    # Read the image 1 and convert it to Gray Scale
    A = cv2.imread(imageName, cv2.IMREAD_GRAYSCALE)
    # Resize the image 1 to 300 x 300
    A = cv2.resize(A, (300, 300))
    # Extract parameters for the image 1
    m, n = A.shape
    # Loop the image 1 row and colums
    pixel_counter = 1
    file = open("tessia.dat", "a")
    for x in range(m):
        for y in range(n):
            pixel = A[x, y]
            binary_pixel = bin(pixel)[2:].zfill(32)
            file.write(f"{binary_pixel}")
            pixel_counter += 1
            file.write("\n")

    file.close()
            
init("tessia1.jpg")

