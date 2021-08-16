import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/user_ptoduct_item.dart';

class UserProductScreen extends StatelessWidget {
  static const String routeName = '/UserProductScreen';
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName,);
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: products.item.length,
            itemBuilder: (_, i) {
              print(products.item[i].title);
              return Column(
                children: [
                  UserProductItem(
                      id: products.item[i].id,
                      title: products.item[i].title,
                      imageUrl: products.item[i].imageUrl),
                  Divider()
                ],
              );
            }),
      ),
    );
  }
}
