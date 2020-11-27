import pygame, sys, time, threading
from pygame.locals import *
 
# Initialize program
pygame.init()
pygame.font.init()
myfont = pygame.font.SysFont('None', 20)

# Setting up color objects
GREY = (173, 173, 173)
DARKGREY = (100, 100, 100)
WHITE = (240, 240, 240)
COL = (233, 12, 89)
 
# Setup a 300x300 pixel display with caption
DISPLAYSURF = pygame.display.set_mode((500,500))
DISPLAYSURF.fill(WHITE)
pygame.display.set_caption("Edann")
# Select the font to use, size, bold, italics
font = pygame.font.SysFont('Calibri', 35, True, False)


def drawLine():
    for i in range(10):
        pygame.draw.rect(DISPLAYSURF, GREY, (i * 50, 0, 3, 500))
        pygame.draw.rect(DISPLAYSURF, GREY, (0, i * 50, 500, 3))

def drawSquareInside(x, y):
    pygame.draw.rect(DISPLAYSURF, COL, (x * 50 + 3, y * 50 + 3, 47, 47))


def drawNumber(num, x, y):
    text = font.render(str(num), True, (0, 0, 0))
    pygame.draw.rect(DISPLAYSURF, DARKGREY, (x * 50 + 3, y * 50 + 3, 47, 47))
    DISPLAYSURF.blit(text, [50 * x + 17, 50 * y + 12])



def doother():
    for i in range(10):
        for j in range(10):
            time.sleep(1)
            drawSquareInside(i, j)
            drawNumber(2, i, j)

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


    