import pygame, sys
from pygame.locals import *
from agent import KBAgent
from utils import *

mov = [[1, 1], [1, -1], [-1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1]]
 
# Initialize PyGame
pygame.init()
pygame.font.init()
myfont = pygame.font.SysFont('None', 20)

# Setting up color objects
GREY = (173, 173, 173)
DARKGREY = (100, 100, 100)
WHITE = (240, 240, 240)
COL = (233, 12, 89)
 
# Setup a 300x300 pixel display with caption
DISPLAYSURF = pygame.display.set_mode((500,700))
DISPLAYSURF.fill(WHITE)
pygame.display.set_caption("Minesweeper Ojan Rafi Sidiq")
font = pygame.font.SysFont('Calibri', 35, True, False)


# Function2 untuk menggambar di PyGame

def drawLine():
    for i in range(11):
        pygame.draw.rect(DISPLAYSURF, GREY, (i * 50, 0, 3, 500))
        pygame.draw.rect(DISPLAYSURF, GREY, (0, i * 50, 500, 3))

def drawNextButton():
    text = font.render("Next", True, WHITE)
    pygame.draw.rect(DISPLAYSURF, COL, (200, 575, 100, 50))
    DISPLAYSURF.blit(text, [215, 585])


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


# Function untuk membuat representasi matriks
def createMat(mat, siz):
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


# Baca input.txt dan ambil state gamenya
file_input_path = sys.argv[1]
file_input = open(file_input_path)
lines = file_input.readlines()

siz = int(lines[0])

ketemuMines = False
mat1 = [[0 for j in range(siz)] for i in range(siz)]
mat_status = [[0 for j in range(siz)] for i in range(siz)]

for i in range(2, len(lines)):
    a = lines[i].split(", ")
    mat1[int(a[0])][int(a[1])] = 1

agent = KBAgent(file_input_path)
rep_mat = createMat(mat1, siz)

# x,y harus belum dibuka
def openCell(i, j):
    if(rep_mat[i][j] > 0):
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
            if (mat_status[i][j] == 1):
                drawNumber(rep_mat[i][j], j, i)


def checkWinCondition():
    if(ketemuMines):
        return -1
    else:
        win = True
        for i in range(siz):
            for j in range(siz):
                if(rep_mat[i][j] != -1 and mat_status[i][j] == 0):
                    win = False 
        if(win):
            return 1
        else: 
            return 0


def showLosePage():
    text = font.render("You Lose!", True, COL)
    DISPLAYSURF.blit(text, [180, 630])

def showWinPage():
    text = font.render("You Win!", True, COL)
    DISPLAYSURF.blit(text, [180, 630])


# CLIPS Jalanin didalam sini ya yang next movenya

def getNextMove():
    return 0, 0


# Beginning Game Loop
while True:
    pygame.display.update()

    drawLine()
    drawNextButton()
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == pygame.MOUSEBUTTONDOWN:
            mouse_pos = event.pos 
            x = mouse_pos[0] // 50
            y = mouse_pos[1] // 50
            x, y = y, x

            if(x < siz and y < siz):
                openCell(x, y)

                if(rep_mat[x][y] == -1):
                    ketemuMines = True
                updateDisplay()
            else:
                # klik next button
                if(x >= 11 and x <= 12 and y >= 4 and y <= 5):
                    rep_mat, mat_status = agent.return_board()
                    updateDisplay()
            checkNumber = checkWinCondition()
            if(checkNumber == -1):
                showLosePage()
            elif(checkNumber == 1):
                showWinPage()

    
    
    
    
    
    
