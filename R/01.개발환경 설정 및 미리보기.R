head(iris)
plot(iris)
1 + 2
num1 = 1 + 2
num1

num2 = "korea"
num2

num3 <- 2+3 # comment
num3

iris
tail(iris)

search() # 현제 내 PC에 패킷보는 명령어

help(iris)
head(iris, 10)
help(head)
example(head)

aaa <- head(iris, 10)
aaa

ls()
rm(aaa)

# 산술연산자
1 + 2
2 * 3
3 - 2

22 / 5
22 %% 5 # 나머지
22 %/% 5 # 몫

2**2
2^2

sqrt(8) # 루트
abs(-10) # 절대값

runif(10) # 난수

trunc(100.5) # truncate(정수)

trunc(runif(10) * 100)

trunc(runif(6, min = 1, max = 45))

help(runif)

round(100.567) # 반올림
round(100.567, 2)

data()

head(Nile)
tail(Nile)

hist(Nile) # 정규분포
plot(iris) # 산포도

plot(iris$Petal.Length,
     iris$Sepal.Length,
     col = iris$Species
     )
