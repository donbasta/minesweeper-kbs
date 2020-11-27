import pygame, sys, time, threading
from pygame.locals import *

mov = [[1, 1], [1, -1], [-1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]]
 
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
    if(num == 0):
        pygame.draw.rect(DISPLAYSURF, DARKGREY, (x * 50 + 3, y * 50 + 3, 47, 47))
    elif (num == -1):
        pygame.draw.rect(DISPLAYSURF, DARKGREY, (x * 50 + 3, y * 50 + 3, 47, 47))
        pygame.draw.circle(DISPLAYSURF, COL, (x * 50 + 25, y * 50 + 25), 12)
    else:
        text = font.render(str(num), True, (0, 0, 0))
        pygame.draw.rect(DISPLAYSURF, DARKGREY, (x * 50 + 3, y * 50 + 3, 47, 47))
        DISPLAYSURF.blit(text, [50 * x + 17, 50 * y + 12])


file_input = open('input.txt')
lines = file_input.readlines()

siz = int(lines[0])

mat1 = [[0 for j in range(siz)] for i in range(siz)]
mat_status = [[0 for j in range(siz)] for i in range(siz)]

for i in range(2, len(lines)):
    a = lines[i].split(", ")
    mat1[int(a[0])][int(a[1])] = 1

def createMat(mat):
    mat_baru = [[0 for j in range(siz)] for i in range(siz)]
    for i in range(siz):
        for j in range(siz):
            if(mat[i][j] == 1):
                mat_baru[i][j] = -1
            else:
                cnt = 0
                for k in range(8):
                    newi = i + mov[k][0]
                    newj = j + mov[k][1]
                    if(newi >= 0 and newi < siz and newj >= 0 and newj < siz and mat[newi][newj] == 1):
                        cnt += 1
                
                mat_baru[i][j] = cnt

    return mat_baru


rep_mat = createMat(mat1)

for i in range(siz):
    for j in range(siz):
        print(rep_mat[i][j], end=" ")
    print()





# x,y harus belum dibuka
def openCell(i, j):
    if(rep_mat[i][j] > 0):
        print("hihi ", i, j)
        mat_status[i][j] = 1
    elif (rep_mat[i][j] == 0):
        mat_status[i][j] = 1
        for k in range(8):
            newi = i + mov[k][0]
            newj = j + mov[k][1]
            if(newi >= 0 and newi < siz and newj >= 0 and newj < siz and mat_status[newi][newj] == 0):
                openCell(newi, newj) 


def updateDisplay():
    for i in range(siz):
        for j in range(siz):
            if(mat_status[i][j] == 1):
                drawNumber(rep_mat[i][j], j, i)


# def doother():
#     openCell(0, 0)
#     updateDisplay()

# x = threading.Thread(target=doother, args=())
# x.start()


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
            x = mouse_pos[0] // 50
            y = mouse_pos[1] // 50
            openCell(y, x)
            updateDisplay()
            print(mouse_pos)


    