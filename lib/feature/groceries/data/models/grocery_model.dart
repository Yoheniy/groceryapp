import 'package:equatable/equatable.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';

// OptionModel extending from OptionEntity
class OptionModel extends OptionEntity {
  OptionModel({
    required super.id,
    required super.name,
    required super.price,
  });

  // Factory method to create an OptionModel from a JSON object
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  // Method to convert an OptionModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  // Method to convert OptionModel to OptionEntity
  OptionEntity toEntity() {
    return OptionEntity(
      id: id,
      name: name,
      price: price,
    );
  }
}

// GroceryModel extending from GroceryItemEntity
class GroceryModel extends GroceryItemEntity {
  GroceryModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.rating,
    required super.price,
    required super.discount,
    required super.description,
    required super.options,
  });

  // Factory method to create a GroceryModel from a JSON object
  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>)
          .map((option) => OptionModel.fromJson(option))
          .toList(),
    );
  }

  // Method to convert a GroceryModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }

  // Method to convert GroceryModel to GroceryItemEntity
  GroceryItemEntity toEntity() {
    return GroceryItemEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options.map((option) => (option as OptionModel).toEntity()).toList(),
    );
  }
}
