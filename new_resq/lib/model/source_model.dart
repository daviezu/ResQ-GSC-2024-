// bikin class Source biar gampang untuk parse Json

class Source {
  String id;
  String name;

  // bikin constructor
  Source({this.id = '', this.name = ''});
  // Source({this.id, this.name});

  // bikin function factory buat map json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      // Add other fields as needed
    );
  }
}
