// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  String id;
  String title;
  int? hadeethsCount;
  Category({
    required this.id,
    required this.title,
    this.hadeethsCount,
  });

  Category copyWith({
    String? id,
    String? title,
    int? hadeethsCount,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      hadeethsCount: hadeethsCount ?? this.hadeethsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'hadeethsCount': hadeethsCount,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      title: map['title'] as String,
      hadeethsCount:
          map['hadeethsCount'] != null ? map['hadeethsCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Category(id: $id, title: $title, hadeethsCount: $hadeethsCount)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.hadeethsCount == hadeethsCount;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ hadeethsCount.hashCode;
}
