class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromMap(Map<String, dynamic> data) {
    return Photo(
      id: data['id'],
      albumId: data['albumId'],
      title: data['title'],
      url: data['url'],
      thumbnailUrl: data['thumbnailUrl'],
    );
  }
}
