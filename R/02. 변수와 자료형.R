var1 <- 2
2 -> var1
var1 = 2

head(iris)
sum(iris$Sepal.Length) + sum(iris$Sepal.Width)

iris$Sepal.Length[1:10]

sum(1:100)
sum(10, 20, 30)

NA # null값, 결측치

num2 <- c(10, 20, 30)
num2
num2[1] + num2[2]
sum(num2)

# NA
sum(10, 20, 30, NA)
sum(10, 20, 30, NA, na.rm = T)

# 자료형 확인
is.numeric(iris$Sepal.Length)
is.integer(iris$Sepal.Length)
is.double(iris$Sepal.Length)
class(iris$Sepal.Length)
is.data.frame(iris)
class(iris)
isTRUE(is.na(iris$Sepal.Length))
sum(is.na(iris$Sepal.Length))

# iris의 자료구조 확인하기
str(iris)

num1 <- "123456"
is.numeric(num1)
num1 <- c(1,2,3,"4")
num1

num2 <- as.numeric(num1) # 숫자로 변환
num2
class(num2)

# Factor(요인형: 범주형 (category)) 변환
gender <- c("man", "woman", "woman", "man", "man")
gender
class(gender)

# 빈도수 확인
table(gender)
#hist(gender)

# 문자열 데이터를 factor로 변환하기
Ngender <- as.factor(gender)
Ngender
table(Ngender)
plot(Ngender)

str(Ngender)

# 날짜형 변환
date1 <- "17-02-28"
date1

as.Date(date1, "%y-%m-Yd")
as.Date("2018/12/31", "%Y/%m/%d")

# 진짜 요일 데이터인지 확인하기
datas <- c("02/28/17", "02/29/17", "03/01/17")
datas
as.Date(datas, "%m%d%y")

# 날짜 계산
mydates <- as.Date(c("2007-07-22", "2004-02-13"))
mydates
mydates[1] - mydates[2]

# 현재 일자 기준으로 날짜 계산하기
Sys.Date()
class(Sys.Date())

Sys.Date() - as.Date("1993-11-14")
num1 <- 1234
as.character(num1)

# Vector 자료 구조
# - 1차원 선형 자료 구조 형태
# - 구성 : 변수[첨자], 첨자는 1부터 시작
# - 동일한 자료형의 데이터만 저장 할 수 있다.
# - 벡터 생성 함수 : c(), seq(), rep(), :
# - 벡터 처리 함수 : sum(), mean(), sd(). union()

head(iris)
# iris의 Sepal.Length 컬럼의 내용을 1차원 벡터로 만들기
irisSepalLength <- iris$Sepal.Length
irisSepalLength

# 벡터인지 확인하기
is.vector(irisSepalLength)

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
median(iris$Petal.Length)

range(irisSepalLength)[1] == min(irisSepalLength)

sd(irisSepalLength) # 표준편차

a <- c(1, 1, 3, 4, 5)
mean(a)
sd(a)

sum(irisSepalLength[c(1,10,11)])

# iris의 Sepal.length Dataset중 1번지~20번지, 30번지, 40번지 합계 구하기
sum(irisSepalLength[c(1:20, 30, 40)])

# 벡터형 자료의 일부를 변경
x <- c(10, 20, 30, 40, 50)
x
y <- replace(x, c(2, 4), c(200, 400))

# seq() 초깃값, 최종값, 증가값으로 구성되는 벡터 함수 생성
help(seq)
seq(1, 10, 0.5)

# 1에서 10까지의 홀수, 1에서 10, 50, 60을 벡터로 만들어 합계 구하기
sum(seq(1, 10, 2), seq(50, 60, 10), 1:10)

# 반복 repeat
rep(1:3, 3)
rep(c(1, 4, 7, 9), 3)
rep(1:3, each = 3)         

# 1 ~ 20까지의 숫자중 짝수만 2번 반복하여 벡터를 만들고 합계를 구하기
sum(seq(1, 20, 2), rep(seq(2, 20, 2), each = 2))

# 합집합
x <- c(1, 3, 5, 7, 9)
y <- c(3, 5)

union(x, y)

# 교집합
intersect(x, y)

# 차집합
setdiff(x, y)



sample(1:10, 5)
sample(1:10, 10)
sample(1:45, 6) # 난수

sort(sample(1:45, 6)) # 정렬

# iris의 Sepal.Length와 Petal.Length의 교집합
intersect(iris$Sepal.Length, iris$Petal.Length)

# iris의 Sepal.Length와 Petal.Length의 합집합 갯수
length(union(iris$Sepal.Length, iris$Petal.Length))

# 1차원 벡터 Data에 이름 설정하기
age <- c(30, 35, 40); age
names(age) <- c("유비", "관우", "장비"); age

# 중복값을 제거하기
unique(iris$Sepal.Length)

x <- rep(c("a", "b", "c"), 4)

# 벡터에 a가 있으면 1을 보여준다.
match(x, "a")

sum(match(x, "a"), na.rm = T)
table(match(x, "a"))

name <- c("Apple", "Compuer", "Samsung", "Communication")

# name에서 Co를 가지고 잇는 단어의 번지수
grep("Co", name)
name[grep("Co", name)]

# name에서 om를 가지고 잇는 단어 출력
name[grep("om", name)]



a <- 1:500
# 10번 ~ 전체 Data중에 끝에서 5개는 빼고 출력
a[10:(length(a) - 5)]

a <- 10:50
# 1번지 값 지우기
a <- a[-1]

# 10, 11 12번지 값 지우기
a <- a[-c(10:12)]
a

a <- 10:50
# a의 홀수 번지 Data의 합계 구하기

sum(a[seq(2, length(a), 2)])

# 최대값과 최소값의 차이가 3보다 큰지 확인
max(a) - min(a) > 3
