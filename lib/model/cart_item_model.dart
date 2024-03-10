class CartItem {
  int? id;
  int productVariationId;
  int quantity; //user can add one or multiple items of the same product variation at once

  CartItem({
    this.id,
    required this.productVariationId,
    required this.quantity,
  });


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productVariationId: json['product_variation_id'],
      quantity: json['quantity'],
    );
  }

}
