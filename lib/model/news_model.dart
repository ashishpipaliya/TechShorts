class NewsModel {
  final String posturl;
  final String source;
  final String title;
  final String imageurl;
  final String description;

  NewsModel({
    this.title,
    this.description,
    this.source,
    this.posturl,
    this.imageurl,
  });

  factory NewsModel.fromJson(Map map) {
    return NewsModel(
        title: map["title"],
        description: map["description"],
        imageurl: map["imageurl"],
        source: map["source"],
        posturl: map["posturl"]);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        "imageurl": imageurl,
        "source": source,
        "posturl": posturl,
      };
}
