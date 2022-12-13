void main(List<String> args) {
  int num1 = 100;
  int? num2 = null;

  num2 ??= 0; // num2가 null이면 0 (null병합 연산자)
}
