import 'dart:convert';

void main(List<String> args) {
  var jsonString = """
  [
    {
      "score" : 40
    },
    {
      "score" : 80
    }
  ]
  """;
  var scores = jsonDecode(jsonString);
  print(scores is List);
  print(scores);
}
