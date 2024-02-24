// ignore_for_file: public_member_api_docs, sort_constructors_first
// bikin model artikel
// copy property dari struktur json
// bikin objek dart

import 'source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  // bikin constructor
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  // bikin fungsi buat map json menjadi list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      urlToImage: json['urlToImage']?.toString() ?? '',
      publishedAt: json['publishedAt']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return 'Article{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }
}
