import numpy as np
import cv2
import matplotlib.pyplot as plt

# Leer la imagen y convertirla a escala de grises
A = cv2.imread('tessia.jpg', cv2.IMREAD_GRAYSCALE)
A = cv2.resize(A, (300, 300))
plt.subplot(1, 2, 1)
plt.imshow(A, cmap='gray')

# Extraemos los parámetros
m, n = A.shape

# Período y amplitudes
Lx = 75
Ly = 75

# Primer frame
Y = np.zeros((m, n, 41), dtype=np.uint8)
Y[:, :, 0] = A

for k in range(5, 200, 5):
    Ax = k
    Ay = k
    # Genera una imagen en blanco
    B = np.zeros((m, n), dtype=np.uint8)
    for x in range(m):
        for y in range(n):
            xnew = np.mod(round(x + Ax * np.sin(2 * np.pi * y / Lx)), m)
            xaux = round(x + Ax * np.sin(2 * np.pi * y / Lx))
            ynew = np.mod(round(y + Ay * np.sin(2 * np.pi * x / Ly)), n)
            yaux = round(y + Ay * np.sin(2 * np.pi * x / Ly))
            if (xnew == xaux) and (ynew == yaux):
                B[xnew, ynew] = A[x, y]
    plt.subplot(1, 2, 2)
    plt.imshow(B, cmap='gray')
    plt.pause(0.1)
    Y[:, :, k // 5] = B