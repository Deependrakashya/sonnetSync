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

class Suggestions {
  String? title;
  String? author;
  List<String>? lines;
  String? linecount;

  Suggestions({this.title, this.author, this.lines, this.linecount});

  Suggestions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    lines = json['lines'].cast<String>();
    linecount = json['linecount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['lines'] = this.lines;
    data['linecount'] = this.linecount;
    return data;
  }
}
