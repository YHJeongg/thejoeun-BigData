void main(List<String> args) {
  checkVersion();
  print('end Process');
}

Future checkVersion() async {
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion() {
  return 12;
}
