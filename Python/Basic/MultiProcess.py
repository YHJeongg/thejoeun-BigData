# -- Before
# total1 = total2 = total3 = 0
# for i in range(0, 100000000):
#     total1 += i
# print(total1)

# for i in range(100000001, 200000000):
#     total2 += i
# print(total2)

# for i in range(200000001, 300000000):
#     total3 += i
# print(total3)

# -- After
from multiprocessing import Process

def start_get(start, end):
    total = 0
    for i in range(start, end):
        total += i
    print(total)

if __name__ == '__main__':
    # Process를 생성합니다.
    p0 = Process(target = start_get, args = (0,100000000))
    p1 = Process(target = start_get, args = (100000001,200000000))
    p2 = Process(target = start_get, args = (200000001,300000000))

    # start로 각 프로세스를 시작 합니다. (무작위 실행)
    p0.start()
    p1.start()
    p2.start()

    # 순서 정렬
    p0.join()
    p1.join()
    p2.join()