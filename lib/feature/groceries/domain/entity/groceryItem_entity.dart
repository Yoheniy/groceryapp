import 'package:equatable/equatable.dart';

class GroceryItemEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<OptionEntity> options;

  GroceryItemEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });
  
  @override
  
  List<Object?> get props =>[
    id,title,imageUrl,
    rating,
    
    price,
    
    discount,
    
    description,
    
    options,
  ] ;
}

class OptionEntity extends Equatable{
  final String id;
  final String name;
  final double price;

  OptionEntity({
    required this.id,
    required this.name,
    required this.price,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [

     id,
    name,
    price,
  ];
}
