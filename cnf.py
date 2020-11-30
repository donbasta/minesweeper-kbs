


def get_cnf(i, j):
    """
    Generate the logical expression for boxes that adjacent to box [i, j]
    that has been probed.
    """
    if unprobed(i, j):
        return
    num_bombs = get_num_bombs(i, j)
    unprobed_adjacent_boxes = get_unprobed_adjacent(i, j)
