import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
 
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';

import '../widgets/products_grid.dart';

enum FilterOption { Favorit, All }

class ProdactOverview extends StatefulWidget {
  static const String routeName = '/ProdactOverview';

  ProdactOverview({Key? key}) : super(key: key);

  @override
  State<ProdactOverview> createState() => _ProdactOverviewState();
}

class _ProdactOverviewState extends State<ProdactOverview> {
  var isFavorit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorit) {
                  isFavorit = true;
                } else {
                  isFavorit = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favoites'),
                value: FilterOption.Favorit,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: ch as Widget,
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                }),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(isFavorit),
    );
  }
}
