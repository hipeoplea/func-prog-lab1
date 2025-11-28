def solve_pe16():
    n = 2 ** 1000
    return sum(int(d) for d in str(n))


if __name__ == "__main__":
    print(solve_pe16())  
