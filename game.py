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
        if (fact_str.find("ask-isi") > -1):
            # print("~~~~~~")
            # print(str(fact).split(" "))
            fact_id = fact_str.split(" ")[0]
            x = int(fact_str.split(" ")[4])
            y = int(fact_str.split(" ")[5][:-1])
            list_ask_isi.append("(isi {} {} {})".format(x, y, E[x][y]))
            # fact.retract()
    return list_ask_isi

def handle_bomb(env, board):
    list_tandain_bomb = []
    for fact in env.facts():
        if (str(fact).find("(bomb") > -1):
            list_tandain_bomb.append(fact)
    for fact in list_tandain_bomb:
        print(str(fact).split(" "))
        x = int(str(fact).split(" ")[4])
        y = int(str(fact).split(" ")[5][:-1])
        board[x][y] = "x" #tandain sebuah kotak jadi bom
        #TODO: tandain kotak (x,y) itu bom di GUInya, atau di board
    return board

def print_board(board):
    for row in board:
        for cell in row:
            print(cell, end=' ')
        print()

def main():
    env = clips.Environment()
    # env.watch = True

    game_config = load_game('game2.txt')
    assert [0, 0] not in game_config["loc_bombs"]

    print("Game Configuration for the agent:")
    print(game_config)
    rem_bombs = game_config["num_bombs"]
    b = game_config["board_size"]
    board = [['*' for i in range(b)] for i in range(b)]
    board[0][0] = 0

    # init facts for the agent
    directions = [1, 0, -1]
    env.assert_string("(rem-bombs {})".format(rem_bombs))
    env.assert_string("(safe 0 0)")
    env.assert_string("(isi 0 0 0)")
    dx = [0, 0, 1, -1, 1, 1, -1, -1]
    dy = [1, -1, 0, 0, -1, 1, 1, -1]
    for row in range(b):
        for col in range(b):
            env.assert_string("(coordinate {} {})".format(row, col))
            cntAdj = 0
            for k in range(8):
                nrow = row + dx[k]
                ncol = col + dy[k]
                if nrow < 0 or nrow >= b or ncol < 0 or ncol >= b:
                    continue
                cntAdj += 1
                if dx[k] == 0 or dy[k] == 0:
                    env.assert_string("(adjacent-by-edge {} {} {} {})".format(row, col, nrow, ncol))
                env.assert_string("(adjacent {} {} {} {})".format(row, col, nrow, ncol))
            tempat = ""
            if cntAdj == 3:
                tempat = "pojok"
            elif cntAdj == 5:
                tempat = "sisi"
            else:
                tempat = "tengah"
            env.assert_string("({} {} {})".format(tempat, row, col))
            if row + 2 < b:
                env.assert_string("(successive {} {} {} {} {} {})".format(row, col, row+1, col, row+2, col))
                env.assert_string("(successive {} {} {} {} {} {})".format(row+2, col, row+1, col, row, col))
            if col + 2 < b:
                env.assert_string("(successive {} {} {} {} {} {})".format(row, col, row, col+1, row, col+2))
                env.assert_string("(successive {} {} {} {} {} {})".format(row, col+2, row, col+1, row, col))
            if row == 0 and col == 0:
                continue
            env.assert_string("(unknown {} {})".format(row, col))
    
    E = generate_e(game_config)
    # print(E)
    
    # env.run(1)

    env.load('./clips/rule-expand-nol.clp')

    env.load('./clips/rule-pattern.clp')
    env.load('./clips/rule-pojok.clp')
    env.load('./clips/rule-sisi.clp')
    env.load('./clips/rule-tengah.clp')
    # for rule in env.rules():
    #     print("Rules", rule)
    
    pattern_1 = env.find_rule("pattern_1")
    print("Pattern 1 ditemukan: ", pattern_1)
    pattern_1.watch_firings = True

    expand_nol_pojok = env.find_rule("expand_nol_pojok")
    expand_nol_sisi = env.find_rule("expand_nol_sisi")
    expand_nol_tengah = env.find_rule("expand_nol_tengah")

    expand_nol_pojok.watch_firings = True
    expand_nol_sisi.watch_firings = True
    expand_nol_tengah.watch_firings = True
    
    i = 0
    while True:
        _ = input("press any key....") 
        print("-" * 50)
        i += 1
        print("after iteration {}".format(i))
        env.run(1)
        ask_isi_list = handle_ask_isi(env, E)
        board = handle_bomb(env, board)
        for fact_str in ask_isi_list:
            # print("fact_str")
            # print(fact_str)
            fact_split = fact_str.split()
            x = int(fact_split[1])
            y = int(fact_split[2])
            z = int(fact_split[3][:-1])
            board[x][y] = z
            # print("fact_str")
            # print(fact_str)
            try:
                env.assert_string(fact_str)
            except:
                pass
        # for fact in env.facts():
        #     print(fact)
        print("Board Condition")
        print_board(board)
        print("-" * 50)


if __name__ == "__main__":
    main()