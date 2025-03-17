class Authors {
  List<String>? authors;

  Authors({this.authors});

  Authors.fromJson(Map<String, dynamic> json) {
    authors = json['authors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authors'] = this.authors;
    return data;
  }
}

class Poem {
  final String title;
  final String author;
  final List<String> lines;

  Poem({required this.title, required this.author, required this.lines});

  factory Poem.fromJson(Map<String, dynamic> json) {
    return Poem(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      lines: List<String>.from(json['lines'] ?? []),
    );
  }
}

class Suggestions {
  final List<Poem> poems;

  Suggestions({required this.poems});

  factory Suggestions.fromJson(List<dynamic> jsonList) {
    return Suggestions(poems: jsonList.map((e) => Poem.fromJson(e)).toList());
  }
}
