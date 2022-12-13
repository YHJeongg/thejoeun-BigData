void main(List<String> args) {
  getVersionname().then((value) => print(value));
  print('end Process');
}

Future<String> getVersionname() async {
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName() {
  return "Android Q";
}
