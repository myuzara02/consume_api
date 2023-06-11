class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> data) {
    return Post(
      userId: data["userId"],
      id: data["id"],
      title: data["title"],
      body: data["body"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
