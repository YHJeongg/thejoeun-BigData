void main(List<String> args) {
  List threeKingdoms = [];

  threeKingdoms.add("위");
  threeKingdoms[0] = "We";
  // threeKingdoms.removeAt(0);
  threeKingdoms.remove('We');
  threeKingdoms.add(1);
  threeKingdoms.length;
  print(threeKingdoms);

  List<String> threekingdoms2 = ["위", "촉", "오"];

  // Map : {K:V}
  Map fruits = {'apple': '사과', 'grape': '포도', 'watermelon': '수박'};
  print(fruits['apple']);
  fruits['watermelon'] = '시원한 수박';
  fruits['banana'] = '바나나';

  Map<String, int> fruitsPrice = {
    'apple': 1000,
  };

  print(fruitsPrice['apple']);
  int applePrice = fruitsPrice['apple']!;
}
