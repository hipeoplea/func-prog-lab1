def collatz_len(n):
    length = 1
    while n != 1:
        if n % 2 == 0:
            n //= 2
        else:
            n = 3 * n + 1
        length += 1
    return length


def solve_pe14():
    best_n = 1
    best_len = 1
    for n in range(1, 1_000_000):
        length = collatz_len(n)
        if length > best_len:
            best_len = length
            best_n = n
    return best_n, best_len


if __name__ == "__main__":
    n, length = solve_pe14()
    print(n, length)
