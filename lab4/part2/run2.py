import os

#N = 1000
#L = 100

N = 1000 * 2
L = 100 * 2

def find_B_max(r):
    tr_file = "tr_out_N_%d_L_%d_r_%d.txt"%(N,L,r)
    B = []

    with open(tr_file) as f:
        for line in f.readlines():
            (seqNo, dept, arr) = line.split()
            B.append(int(arr)-int(dept))
    return max(B)

def getS(r, B_max):
    s = []
    tr_file = "tr_out_N_%d_L_%d_r_%d.txt"%(N,L,r)
    with open(tr_file) as f:
        with open("S_r_%d.txt"%(r), "w") as ff:
            for line in f.readlines():
                (seqNo, dept, arr) = line.split()
                c = r*int(dept)-B_max
#                print c
                s.append(c)
                ff.write("%d\n"%(c))
    return s

if __name__ == "__main__":
#    r = 1000
    B_max_prev = 0
    S = []
    os.system("./make.sh")
    for r in [980,1000,1020,1040,1060, 1080]:
#    for r in [900*1000,1000*1000,1100*1000]:
        cmd = "./launch_prob.sh %d %d %d  "%(N,L,r)
        print "run r = " + str(r)
        os.system(cmd)
        B_max = find_B_max(r)
#        print B_max
        getS(r, B_max)
#        if B_max < B_max_prev:
#            break
        B_max_prev = B_max
        r += 100

