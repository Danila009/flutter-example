
class NoteEntity {

  String id;
  String title;
  String description;

  NoteEntity({
    required this.id,
    required this.title,
    required this.description,
  });

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}