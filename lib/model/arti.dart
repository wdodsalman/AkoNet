import 'dart:convert';

class Arti {
  final String image;
  final String title;
  final String description;
  Arti({
    required this.image,
    required this.title,
    required this.description,
  });

  Arti copyWith({
    String? image,
    String? title,
    String? description,
  }) {
    return Arti(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
    };
  }

  factory Arti.fromMap(Map<String, dynamic> map) {
    return Arti(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Arti.fromJson(String source) => Arti.fromMap(json.decode(source));

  @override
  String toString() => 'Arti(image: $image, title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Arti &&
      other.image == image &&
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ description.hashCode;
}