import pygame, sys, time, threading
from pygame.locals import *
 
# Initialize program
pygame.init()
 
# Setting up color objects
GREY = (173, 173, 173)
WHITE = (240, 240, 240)
COL = (233, 12, 89)
 
# Setup a 300x300 pixel display with caption
DISPLAYSURF = pygame.display.set_mode((500,500))
DISPLAYSURF.fill(WHITE)
pygame.display.set_caption("Edann")


def drawLine():
    for i in range(10):
        pygame.draw.rect(DISPLAYSURF, GREY, (i * 50, 0, 3, 500))
        pygame.draw.rect(DISPLAYSURF, GREY, (0, i * 50, 500, 3))

def drawSquareInside(x, y):
    pygame.draw.rect(DISPLAYSURF, COL, (x + 3, y + 3, 47, 47))


def doother():
    for i in range(10):
        for j in range(10):
            time.sleep(1)
            drawSquareInside(i * 50, j * 50)

x = threading.Thread(target=doother, args=())
x.start()


# Beginning Game Loop
while True:
    pygame.display.update()

    drawLine()
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.MOUSEBUTTONDOWN:
            mouse_pos = event.pos 

            print(mouse_pos)


    