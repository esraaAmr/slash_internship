import 'package:flutter/material.dart';
import 'package:slash_internship/services/product_service_api.dart';
import 'package:slash_internship/view/product_details.dart';

import '../model/product_model.dart';


class ViewProducts extends StatefulWidget {
  const ViewProducts({super.key});

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return _productsGrid();
  }

  Widget _productsGrid() {
    return FutureBuilder(
      future: ProductsService().fetchAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<Product>;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {

              return _productCard(products[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _productCard(Product product) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Card(
      color: Colors.black,
      child: Column(
        //Product image
        children: [
          _buildProductImage(product, size),
          //Product name
          _buildProductNameRow(product),
          _buildProductPriceRow(product),
        ],
      ),
    );
  }

  _buildProductImage(Product product, size) {
    final image = NetworkImage(product.variations[0].productVariantImages[0]);
    return GestureDetector(
      onTap: ()async{
        product = await ProductsService().fetchProductDetails(product.id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(product: product,)));

      },
      child: Container(
        
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildProductNameRow(Product product) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              product.name,
              style: _detailsTextStyle(),
              textAlign: TextAlign.start,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: ClipOval(
                child: Image.network(product.brandLogoUrl!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPriceRow(Product product) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'EGP ${product.variations[0].price}',
            style: _detailsTextStyle(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }


  TextStyle _detailsTextStyle() {
    return const TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
