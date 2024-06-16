// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HadithTitle {
  String id;
  String title;
  HadithTitle({
    required this.id,
    required this.title,
  });

  HadithTitle copyWith({
    String? id,
    String? title,
  }) {
    return HadithTitle(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory HadithTitle.fromMap(Map<String, dynamic> map) {
    return HadithTitle(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HadithTitle.fromJson(String source) =>
      HadithTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HadithTitle(id: $id, title: $title)';

  @override
  bool operator ==(covariant HadithTitle other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}