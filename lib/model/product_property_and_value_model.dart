// product_property_and_value.dart
class ProductPropertyAndValue {
  final String property;
  final String value;

  ProductPropertyAndValue({
    required this.property,
    required this.value,
  });

  factory ProductPropertyAndValue.fromJson(Map<String, dynamic> json) {
    String value = '';
    if (json['value'] != null) {
      value = json['value'];
    }
    return ProductPropertyAndValue(
      property: json['property'],
      value: value,
    );
  }
}
