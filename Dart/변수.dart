main() {
  var name = '유비';
  print(name);

  int intNum1 = 30;
  int intNum2 = 20;

  print(intNum1 / intNum2);
  print(intNum1 ~/ intNum2);

  // 문자열
  String str1 = '유비';
  String str2 = '장비';

  print(str1 + " : " + str2);

  // 문자열 보간법 (String Interpolation)
  print('$str1 : $str2');

  print('intNum1과 intNum2의 합은 ${intNum1 + intNum2} 입니다.');
}
