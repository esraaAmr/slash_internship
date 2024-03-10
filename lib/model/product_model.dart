
import 'available_properties_model.dart';
import 'product_variation_model.dart';

// product.dart

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String? brandName;
  final String? brandLogoUrl;
  final double rating;
  final List<ProductVariation> variations;
  final List<AvailableProperties> availableProperties;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    this.brandName,
    this.brandLogoUrl,
    required this.rating,
    required this.variations,
    required this.availableProperties,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<ProductVariation> variations = [];
    List<AvailableProperties> availableProperties = [];

    if (json['variations'] != null) {
      variations = (json['variations'] as List<dynamic>?)
              ?.map<ProductVariation>((variation) =>
                  ProductVariation.fromJson(variation, json['id']))
              .toList() ??
          [];
    } else if (json['ProductVariations'] != null) {
      variations = (json['ProductVariations'] as List<dynamic>?)
              ?.map<ProductVariation>((variation) =>
                  ProductVariation.fromJson(variation, json['id']))
              .toList() ??
          [];
    }

    if (json['avaiableProperties'] != null) {
      availableProperties = (json['avaiableProperties'] as List<dynamic>)
          .map<AvailableProperties>(
              (property) => AvailableProperties.fromJson(property))
          .toList();
    }

    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brandId: json['brand_id'],
      brandName: json['brandName'],
      brandLogoUrl:
          json['brandImage'] ?? json['Brands']['brand_logo_image_path'],
      rating: json['product_rating'].toDouble(),
      variations: variations,
      availableProperties: availableProperties,
    );
  }
}
