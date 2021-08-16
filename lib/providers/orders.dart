import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateOrder;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateOrder,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItems> cartProducts, double total) {
    // 0 mean that add order to begging of List
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateOrder: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
