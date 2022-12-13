void main(List<String> args) {
  List<int> intArray = [1, 2, 3];

  for (int i = 0; i < intArray.length; i++) {
    print(intArray[i]);
  }

  for (int i in intArray) {
    print(i);
  }
}
