import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final String category;
  final String image;
  final int id;

  Category({
    required this.category,
    required this.image,
    this.id=0,
  });

  Category copyWith({
    String? category,
    String? image,
    int? id,
  }) {
    return Category(
      category: category ?? this.category,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'image': image,
      'id': id,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      category: map['category'] as String,
      image: map['image'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(category: $category, image: $image, id: $id)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;
  
    return 
      other.category == category &&
      other.image == image &&
      other.id == id;
  }

  @override
  int get hashCode => category.hashCode ^ image.hashCode ^ id.hashCode;
}
