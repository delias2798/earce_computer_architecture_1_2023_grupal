from PIL import Image
import math

def apply_ripple(image, Lx, Ly):
    # Define a counter to label the images 
    counter = 0
    # Get the witdh and height of the image
    width, height = image.size
    # Iterate 40 times
    for k in range(5, 200, 5):
        # Increment the counter
        counter += 1
        # Set the new values for Ax and Ay
        Ax = k
        Ay = k
        # Create a new image with zeros
        new_image = Image.new("RGB", (width, height))
        # Iterate all rows and columns
        for x in range(width):
            for y in range(height):
                # Get the new cordinates and convert them to Integer just in case
                new_x = int(x + Ax * math.sin(2 * math.pi * y / Lx))
                new_y = int(y + Ay * math.sin(2 * math.pi * x / Lx))
                # Check if the new coordinates are in the image boundaries
                if (new_x >= 0 and new_x < width and new_y >= 0 and new_y < height):
                    # Extract the pixel from the (x,y) coordinates
                    color = image.getpixel((new_x, new_y))
                    # Put it into the new coordinates
                    new_image.putpixel((x, y), color)
                else:
                    # If the new coordinates exeed the boundaries, put a 0
                    new_image.putpixel((x, y), (0, 0, 0))
        # Generate a new Image
        new_image.save(f'barbarita{counter}.jpg')

    

# Load the input image
image = Image.open("barbara.jpg")

# Define the ripple parameters
Lx = 75
Ly = 75

# Apply the ripple effect
apply_ripple(image, Lx, Ly)
