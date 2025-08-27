// ignore_for_file: public_member_api_docs, sort_constructors_first
class Qoute {
  String content;
  String author;

  Qoute({required this.content, required this.author});

  factory Qoute.fromJson(Map<String, dynamic> jsonData) {
    return Qoute(
      content: jsonData["q"]??'',
      author: jsonData["a"]??'',
    );
  }
}
