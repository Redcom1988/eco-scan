class EducationalContent {
  final int id;
  final String title;
  final String description;
  final String category;
  final String mediaUrl;
  final DateTime publishDate;

  EducationalContent({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.mediaUrl,
    required this.publishDate,
  });

  factory EducationalContent.fromJson(Map<String, dynamic> json) {
    return EducationalContent(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      mediaUrl: json['media_url'],
      publishDate: DateTime.parse(json['publish_date']),
    );
  }
}
