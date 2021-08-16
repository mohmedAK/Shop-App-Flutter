import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import './screens/user_product_screen.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './providers/cart.dart';
import './providers/products_provider.dart';

import './screens/product_detail_screen.dart';

import 'screens/prodacts_overview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            // accentColor: Colors.deepOrange,
            colorScheme: ColorScheme(
                background: Colors.white,
                brightness: Brightness.light,
                error: Colors.red,
                onBackground: Colors.black,
                onError: Colors.red,
                onPrimary: Colors.white,
                onSecondary: Colors.amber,
                //with snack bar
                onSurface: Colors.black,
                primary: Colors.purple,
                primaryVariant: Colors.purple,
                secondary: Colors.orange,
                secondaryVariant: Colors.amber,
                surface: Colors.white),
            fontFamily: 'Lato'),
        home: ProdactOverview(),
        //initialRoute: '/',
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen()
        },
      ),
    );
  }
}
