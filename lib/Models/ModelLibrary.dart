class Article {
  int id;
  String by;
  var kids;
  int score;
  int time;
  String title;
  String type;
  String url;
  int descendants;
  Article.make(this.id, this.descendants, this.type, this.by, this.time,
      this.kids, this.url, this.score, this.title);
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article.make(
        json['id'],
        json['descendants'],
        json['type'],
        json['by'],
        json['time'],
        json['kids'],
        json['url'],
        json['score'],
        json['title']);
  }
}
