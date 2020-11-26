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

def main():
    env = clips.Environment()

    game_config = load_game('game.txt')
    assert [0, 0] not in game_config["loc_bombs"]

    print("Game Configuration for the agent:")
    print(game_config)
    rem_bombs = game_config["num_bombs"]
    b = game_config["board_size"]

    # init facts for the agent
    
    env.assert_string("(rem-bombs {})".format(rem_bombs))
    env.assert_string("(safe-box 0 0)")
    env.assert_string("(isi 0 0 0)")
    for row in range(b):
        for col in range(b):
            if row == 0 and col == 0:
                continue
            env.assert_string("(unknown {} {})".format(row, col))
    
    E = generate_e(game_config)
    print(E)
    
    for fact in env.facts():
        print(fact)

    # init rules for the agent
    # TODO:
    # 1. angka kotak i, tetangga udah ada i bom => buka tetangga yg msh unknown
    # 2. angka kotak 0, buka semua tetangga yg belum kebuka


    rule_expand_nol_test = """\
(defrule expand_nol
    (isi ?i ?j 0)
    (test (< (+ ?i 1) 4))
    (test (< (+ ?j 1) 4))
    (unknown ?a ?j)
    (unknown ?i ?b)
    (unknown ?a ?b)
    ?f <- (unknown ?a ?j)
    ?g <- (unknown ?i ?b)
    ?h <- (unknown ?a ?b)
    => 
    (
        if (and (= (+ ?i 1) ?a) (= (+ ?j 1) ?b))
        then 
            (assert (safe-box ?a ?j))
            (retract ?f)
            (assert (ask-isi ?a ?j))
            (assert (safe-box ?i ?b))
            (retract ?g)
            (assert (ask-isi ?i ?b))
            (assert (safe-box ?a ?b))
            (retract ?h)
            (assert (ask-isi ?a ?b))
    )
)
"""

    env.build(rule_expand_nol_test)
    
    env.run(1)

    print("Fakta setelah run sekali")
    for fact in env.facts():
        print(fact)

    env.build(something)

    env.run(1)

    
    rule_cek = """\
(defrule tes
    (safe ?i ?j)
    => 
    (assert (aku-mau-buka ?i ?j))
)
"""


if __name__ == "__main__":
    main()