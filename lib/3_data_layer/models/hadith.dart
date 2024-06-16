// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hadith {
  String id;
  String title;
  String hadeeth;
  String attribution;
  String grade;
  String explanation;
  Hadith({
    required this.id,
    required this.title,
    required this.hadeeth,
    required this.attribution,
    required this.grade,
    required this.explanation,
  });

  Hadith copyWith({
    String? id,
    String? title,
    String? hadeeth,
    String? attribution,
    String? grade,
    String? explanation,
  }) {
    return Hadith(
      id: id ?? this.id,
      title: title ?? this.title,
      hadeeth: hadeeth ?? this.hadeeth,
      attribution: attribution ?? this.attribution,
      grade: grade ?? this.grade,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'hadeeth': hadeeth,
      'attribution': attribution,
      'grade': grade,
      'explanation': explanation,
    };
  }

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      id: map['id'] as String,
      title: map['title'] as String,
      hadeeth: map['hadeeth'] as String,
      attribution: map['attribution'] as String,
      grade: map['grade'] as String,
      explanation: map['explanation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hadith.fromJson(String source) =>
      Hadith.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hadith(id: $id, title: $title, hadeeth: $hadeeth, attribution: $attribution, grade: $grade, explanation: $explanation)';
  }

  @override
  bool operator ==(covariant Hadith other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.hadeeth == hadeeth &&
        other.attribution == attribution &&
        other.grade == grade &&
        other.explanation == explanation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        hadeeth.hashCode ^
        attribution.hashCode ^
        grade.hashCode ^
        explanation.hashCode;
  }
}
