void main(List<String> args) {
  final String name1 = '유비';
  const String name2 = '관우';

  // final은 실행시에 결정
  final now1 = DateTime.now();
  print(now1);

  // 실행시 결정되는 값으로 정할 수 없다. 정해진 값만 수용.
  // const now2 = DateTime.now();
}
