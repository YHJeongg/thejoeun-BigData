void main(List<String> args) {
  ThreeKingdoms threeKingdoms = ThreeKingdoms('유비', '촉');
  threeKingdoms.SaySomething();
}

class ThreeKingdoms {
  // Field or Property
  String? name;
  late String nation;

  // Constructor
  ThreeKingdoms(String name, String nation)
      : this.name = name,
        this.nation = nation;

  // Function
  SaySomething() {
    print('제 이름은 ${this.name} 이고 조국은 ${this.nation} 입니다.');
  }
}
