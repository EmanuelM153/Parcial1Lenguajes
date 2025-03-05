def mersenne():
    for i in range(2, 40):
        n = (1 << i) - 1
        p = 1
        for j in range(2, n):
            if n % j == 0:
                p = 0
                break
        if p:
            print(n)

mersenne()
