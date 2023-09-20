class Quote {
  String? id;
  String? author;
  String? author_permalink;
  String? body;
  String? url;

  Quote({this.id, this.author, this.author_permalink, this.body, this.url});
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        id: json['id'].toString(),
        author: json['author'],
        author_permalink: json['author_permalink'],
        body: json['body'],
        url: json['url']);
  }
}
