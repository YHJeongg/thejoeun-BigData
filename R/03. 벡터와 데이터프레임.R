# 1 3 5 1 2 3 4 5 6 7 8 9 10 1 3 5 7 9 1 2 3 1 2 3
c(seq(1,5,2),1:10,seq(1,10,2),rep(1:3,2))


head(iris)
iris[1:5,]
iris[seq(1,150,2),]

irisTemp <- iris[1:5,c(-5)]
irisTemp

# 행과 열을 뒤집기
t(irisTemp)

# iris 데이터의 10의 배수 행만 출력하기
iris[seq(10,nrow(iris),10),]

ncol(iris)

# iris의 1~10까지의 데이터중 Sepal.Length와 Sepal.Width만 출력하기
iris[1:10,c("Sepal.Length","Sepal.Width")]

# 기본 통계량
summary(iris)

