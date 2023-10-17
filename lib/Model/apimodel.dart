class News_Model {
  var author;
  var title;
  var description;
  var url;
  var source;
  var image;
  var category;
  var country;
  var language;

  News_Model({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    required this.category,
    required this.country,
    required this.language,
  });

  factory News_Model.fromJSON({required Map data}) {
    return News_Model(
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      source: data['source'],
      image: data['image'],
      category: data['category'],
      country: data['country'],
      language: data['language'],
    );
  }
}
