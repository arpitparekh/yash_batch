class Motive {
  int? id;
  String? phrase;
  String? author;
  int? religion;

  Motive({this.id, this.phrase, this.author, this.religion});

  Motive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phrase = json['phrase'];
    author = json['author'];
    religion = json['religion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phrase'] = this.phrase;
    data['author'] = this.author;
    data['religion'] = this.religion;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Id: $id\nPhase: $phrase\nAuthor: $author";
  }
}
