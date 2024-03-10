import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ProductsService {
  String apiUrl = 'https://slash-backend.onrender.com/product';

  Future<List<Product>> fetchAllProducts() async {
    try {
      final dio = Dio();
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        List<Product> products = [];
        for (var productData in response.data['data']) {
          products.add(Product.fromJson(productData));
        }
        return products;
      }
    } catch (e) {
      print('error: $e');
    }
    return [];
  }

  Future<Product> fetchProductDetails(productId) async {
    final dio = Dio();
    try {
      final productResponse = await dio.get('$apiUrl/$productId');

      if (productResponse.statusCode == 200) {
        final productDetails = productResponse.data['data'];
        final Product product = Product.fromJson(productDetails);
        if (product.availableProperties.isEmpty) {
        } else {
        }

        return product;
      }
    } catch (e) {
      print('Error fetching product details: $e');
    }
    return Product(
      id: 0,
      name: '',
      description: '',
      brandId: 0,
      brandName: '',
      brandLogoUrl: '',
      rating: 0,
      variations: [],
      availableProperties: [],
    );
  }

}
