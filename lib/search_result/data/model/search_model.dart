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

class SearchPoem {
  final List<Poem> poems;

  SearchPoem({required this.poems});

  factory SearchPoem.fromJson(List<dynamic> jsonList) {
    return SearchPoem(poems: jsonList.map((e) => Poem.fromJson(e)).toList());
  }
}
