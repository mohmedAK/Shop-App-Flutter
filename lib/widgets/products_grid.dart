import 'package:flutter/material.dart';
import 'package:shop_app/providers/products_provider.dart';
 
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool isFavorit;
  ProductGrid(this.isFavorit);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = isFavorit ? productData.itemFavorit : productData.item;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            // id: loadProduct[i].id,
            // imageUrl: loadProduct[i].imageUrl,
            // title: loadProduct[i].title,
            ),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
