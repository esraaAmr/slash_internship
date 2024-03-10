class AvailableProperties {
  String property;
  List<PropertyValue> values;

  AvailableProperties({
    required this.property,
    required this.values,
  });

  factory AvailableProperties.fromJson(Map<String, dynamic> json) {
    return AvailableProperties(
      property: json['property'],
      values: List<PropertyValue>.from(json['values'].map((value) => PropertyValue.fromJson(value))),
    );
  }
}

class PropertyValue {
  String value;
  int id;

  PropertyValue({
    required this.value,
    required this.id,
  });

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return PropertyValue(
      value: json['value'],
      id: json['id'],
    );
  }
}
