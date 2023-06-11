class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromMap(Map<String, dynamic> data) {
    return Album(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
    );
  }
}