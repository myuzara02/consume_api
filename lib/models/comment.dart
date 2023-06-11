class Comment {
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromMap(Map<String, dynamic> data) {
    return Comment(
      id: data["ïd"],
      name: data["name"],
      email: data["email"],
      body: data["body"],
    );
  }
}
