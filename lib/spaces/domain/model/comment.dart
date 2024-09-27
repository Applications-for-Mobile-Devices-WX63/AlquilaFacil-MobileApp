class Comment {
  final int id;
  final int authorId;
  final int spaceId;
  final String text;
  final double rating;

  Comment({
    required this.id,
    required this.authorId,
    required this.spaceId,
    required this.text,
    required this.rating,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      authorId: json['authorId'],
      spaceId: json['spaceId'],
      text: json['text'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'spaceId': spaceId,
      'text': text,
      'rating': rating,
    };
  }
}