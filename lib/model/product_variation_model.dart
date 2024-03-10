// product_variation.dart
import 'product_property_and_value_model.dart';

class ProductVariation {
  final int id;
  final int productId;
  final num price;
  final int quantity;
  bool inStock; // to enable/disable addToCart button
  final List<String> productVariantImages;
  final List<ProductPropertyAndValue> productPropertiesValues;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVariantImages,
    required this.productPropertiesValues,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json, int productId) {
    List<ProductPropertyAndValue> propertiesValues = [];
    List<String> productVariantImages = [];

    if (json['productPropertiesValues'] != null) {
      propertiesValues = (json['productPropertiesValues'] as List<dynamic>?)
              ?.map<ProductPropertyAndValue>(
                  (property) => ProductPropertyAndValue.fromJson(property))
              .toList() ??
          [];
    }

    if (json['ProductVarientImages'] != null) {
      productVariantImages = (json['ProductVarientImages'] as List<dynamic>?)
              ?.map<String>((image) => image['image_path'] as String)
              .toList() ??
          [];
    }

    return ProductVariation(
      id: json['id'],
      productId: productId,
      price: json['price'],
      quantity: json['quantity'],
      inStock: json['inStock'] ?? false,
      productVariantImages: productVariantImages,
      productPropertiesValues: propertiesValues,
    );
  }
}
