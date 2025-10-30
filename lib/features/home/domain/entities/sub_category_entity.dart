import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String id;
  final String categoryId;
  final String name;
  final String? imagePath;
  final double? price;
  final String? description;

  const SubCategoryEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    this.imagePath,
    this.price,
    this.description,
  });

  /// لتحويل الموديل إلى Map (لو بتتعامل مع Firebase أو JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'imagePath': imagePath,
      'price': price,
      'description': description,
    };
  }

  /// لتحويل البيانات القادمة من Map إلى كائن
  factory SubCategoryEntity.fromMap(Map<String, dynamic> map) {
    return SubCategoryEntity(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'],
      price: map['price'] != null
          ? double.tryParse(map['price'].toString())
          : null,
      description: map['description'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    categoryId,
    name,
    imagePath,
    price,
    description,
  ];
}
