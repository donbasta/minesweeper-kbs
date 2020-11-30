import clips

def load_game(fpath):
    game_config = {}
    with open(fpath, "r") as f:
        game_config["board_size"] = int(f.readline())
        game_config["num_bombs"] = int(f.readline())
        num_bombs = game_config["num_bombs"]
        game_config["loc_bombs"] = []
        for i in range(num_bombs):
            loc = list(map(int, f.readline().split(',')))
            game_config["loc_bombs"].append(loc)
    return game_config

def generate_e(game_config):
    b = game_config["board_size"]
    board = [[0 for i in range(b)] for i in range(b)]
    bombs = [[False for i in range(b)] for i in range(b)]
    E = [[None for i in range(b)] for i in range(b)]
    for [x, y] in game_config["loc_bombs"]:
        bombs[x][y] = True
    dx = [0, 1, 1, 1, 0, -1, -1, -1]
    dy = [1, 1, 0, -1, -1, -1, 0, 1]
    for i in range(b):
        for j in range(b):
            if bombs[i][j]:
                continue
            cnt_bombs = 0
            for k in range(8):
                ni = i + dx[k]
                nj = j + dy[k]
                if ni < 0 or ni >= b or nj < 0 or nj >= b:
                    continue
                if bombs[ni][nj]:
                    cnt_bombs += 1
            E[i][j] = cnt_bombs
    return E

def handle_ask_isi(env, E):
    list_ask_isi = []
    list_retract = []
    for fact in env.facts():
        fact_str = str(fact)
        if (fact_str.find("ask-isi") == -1):
            continue
        x, y = int(fact_str[-4]), int(fact_str[-2])
        list_ask_isi.append("(isi {} {} {})".format(x, y, E[x][y]))
    return list_ask_isi

def handle_bomb(env, board, opened):
    for fact in env.facts():
        if (str(fact).find("(bomb") == -1):
            continue
        euy = [int(x) for x in str(fact) if x.isdigit()]
        x, y = euy[-2], euy[-1]
        board[x][y] = -1 # Tandain sebuah kotak jadi bom
        opened[x][y] = 1 # Tandain sebuah kotak telah dibuka
        #TODO: tandain kotak (x,y) itu bom di GUInya, atau di board
    return board, opened

def print_board(board):
    for row in board:
        for cell in row:
            print(cell, end=' ')
        print()

def handle_board(env, E, board, opened):
    ask_isi_list = handle_ask_isi(env, E)
    opened_after = None
    board, opened_after = handle_bomb(env, board, opened)
    for fact_str in ask_isi_list:
        x, y, z = int(fact_str[-6]), int(fact_str[-4]), int(fact_str[-2])
        board[x][y] = z
        opened_after[x][y] = 1
        try:
            env.assert_string(fact_str)
        except:        
            pass
    return board, opened_after
    print("Board Condition")
    print_board(board)
    print("-" * 50)