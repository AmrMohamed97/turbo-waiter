import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String id;
  final String categoryId;
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final int quantity;

  const SubCategoryEntity({
    required this.quantity,
    required this.id,
    required this.categoryId,
    required this.name,
    required  this.imagePath,
    required  this.price,
    required this.description,
    
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
      'quantity': quantity,
    };
  }

  /// لتحويل البيانات القادمة من Map إلى كائن
  factory SubCategoryEntity.fromMap(Map<String, dynamic> map) {
    return SubCategoryEntity(
      quantity: map['quantity'] ?? 0,
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      price: map['price'] ?? 0,
      description: map['description'] ?? '',
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
