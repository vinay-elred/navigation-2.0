// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

class ProductModel {
  final String id;
  final int price;
  final int sold;
  final bool liked;
  ProductModel({
    required this.id,
    required this.price,
    required this.sold,
    required this.liked,
  });

  factory ProductModel.create(String id) {
    return ProductModel(
      id: id,
      price: math.Random().nextInt(10000) + 99,
      sold: math.Random().nextInt(8000),
      liked: math.Random().nextBool(),
    );
  }
}
