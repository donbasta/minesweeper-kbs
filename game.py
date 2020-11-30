import clips
import sys
from utils import *

def main():
    env = clips.Environment()

    game_file_name = sys.argv[1]

    game_config = load_game(game_file_name)

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
    
    global_file_path = './clips/global.clp'
    with open(global_file_path, 'w') as global_file:
        global_file.write("(defglobal ?*B-SIZE* = {})".format(b))
    env.load(global_file_path)
    env.load('./clips/rule-expand-nol.clp')
    env.load('./clips/rule-pattern-1-1-adjacent.clp')
    env.load('./clips/rule-pattern-1-2-adjacent.clp')
    env.load('./clips/rule-pattern-1-2-1.clp')
    env.load('./clips/rule-pattern.clp')
    env.load('./clips/rule-pojok.clp')
    env.load('./clips/rule-sisi.clp')
    env.load('./clips/rule-tengah.clp')

    glob_b_size = env.find_global("B-SIZE")

    for rule in env.rules():
        rule.watch_firings = True

    while True:

        _ = input("press any key....") 
        print("-" * 50)

        to_be_fired_rule = None
        for act in env.activations():
            to_be_fired_rule = act.name
            break

        if to_be_fired_rule in ["expand_nol_pojok", "expand_nol_sisi", "expand_nol_tengah"]:
            while to_be_fired_rule in ["expand_nol_pojok", "expand_nol_sisi", "expand_nol_tengah"]:
                env.run(1)
                board = handle_board(env, E, board)
                for act in env.activations():
                    to_be_fired_rule = act.name
                    break
        else:
            env.run(1)
            board = handle_board(env, E, board)
            
        print_board(board)


if __name__ == "__main__":
    main()