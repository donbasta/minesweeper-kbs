import clips
import sys
from utils import *

class KBAgent():
    def __init__(self, config_path):
        self.env = clips.Environment()
        print("strategy used: {}".format(self.env.strategy))
        print("config_path: ", config_path)
        self.game_config = load_game(config_path)
        self.rem_bombs = self.game_config["num_bombs"]
        self.b = self.game_config["board_size"]
        self.board = [['*' for i in range(self.b)] for i in range(self.b)]
        self.board[0][0] = 0        
        self.opened = [[0 for i in range(self.b)] for i in range(self.b)]
        self.opened[0][0] = 1
        self.E = generate_e(self.game_config)
        self.init_facts()
    
    def init_facts(self):
        # init facts for the agent
        directions = [1, 0, -1]
        b = self.b
        rem_bombs = self.rem_bombs
        self.env.assert_string("(rem-bombs {})".format(rem_bombs))
        self.env.assert_string("(safe 0 0)")
        self.env.assert_string("(isi 0 0 0)")
        dx = [0, 0, 1, -1, 1, 1, -1, -1]
        dy = [1, -1, 0, 0, -1, 1, 1, -1]
        for row in range(b):
            for col in range(b):
                self.env.assert_string("(coordinate {} {})".format(row, col))
                cntAdj = 0
                for k in range(8):
                    nrow = row + dx[k]
                    ncol = col + dy[k]
                    if nrow < 0 or nrow >= b or ncol < 0 or ncol >= b:
                        continue
                    cntAdj += 1
                    if dx[k] == 0 or dy[k] == 0:
                        self.env.assert_string("(adjacent-by-edge {} {} {} {})".format(row, col, nrow, ncol))
                    self.env.assert_string("(adjacent {} {} {} {})".format(row, col, nrow, ncol))
                tempat = ""
                if cntAdj == 3:
                    tempat = "pojok"
                elif cntAdj == 5:
                    tempat = "sisi"
                else:
                    tempat = "tengah"
                self.env.assert_string("({} {} {})".format(tempat, row, col))
                if row + 2 < b:
                    self.env.assert_string("(successive {} {} {} {} {} {})".format(row, col, row+1, col, row+2, col))
                    self.env.assert_string("(successive {} {} {} {} {} {})".format(row+2, col, row+1, col, row, col))
                if col + 2 < b:
                    self.env.assert_string("(successive {} {} {} {} {} {})".format(row, col, row, col+1, row, col+2))
                    self.env.assert_string("(successive {} {} {} {} {} {})".format(row, col+2, row, col+1, row, col))
                if row == 0 and col == 0:
                    continue
                self.env.assert_string("(unknown {} {})".format(row, col))
                    
        global_file_path = './clips/global.clp'
        with open(global_file_path, 'w') as global_file:
            global_file.write("(defglobal ?*B-SIZE* = {})".format(b))
            
        self.env.load(global_file_path)
        self.env.load('./clips/rule-expand-nol.clp')
        self.env.load('./clips/rule-pattern-1-1-adjacent.clp')
        self.env.load('./clips/rule-pattern-1-2-adjacent.clp')
        self.env.load('./clips/rule-pattern-1-2-1.clp')
        self.env.load('./clips/rule-pattern.clp')
        self.env.load('./clips/rule-pojok.clp')
        self.env.load('./clips/rule-sisi.clp')
        self.env.load('./clips/rule-tengah.clp')
        for rule in self.env.rules():
            rule.watch_firings = True
        
    def return_board(self):        
        print("-" * 50)
        to_be_fired_rule = None
        for act in self.env.activations():
            to_be_fired_rule = act.name
            break

        if to_be_fired_rule in ["expand_nol_pojok", "expand_nol_sisi", "expand_nol_tengah"]:
            while to_be_fired_rule in ["expand_nol_pojok", "expand_nol_sisi", "expand_nol_tengah"]:
                self.env.run(1)
                self.board, self.opened = handle_board(self.env, self.E, self.board, self.opened)
                for act in self.env.activations():
                    to_be_fired_rule = act.name
                    break
        else:
            self.env.run(1)
            self.board, self.opened = handle_board(self.env, self.E, self.board, self.opened)
        print_board(self.board)
        # print_board(board)
        return self.board, self.opened