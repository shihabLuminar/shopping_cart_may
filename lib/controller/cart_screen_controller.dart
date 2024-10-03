import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_cart_may/model/cart_model.dart';

class CartScreenController with ChangeNotifier {
  final cartbox = Hive.box<CartModel>("cartBox");
  List<CartModel> cart = [];
  List keys = [];

  void addProduct(
      {required String name,
      String? image,
      String? desc,
      required int id,
      required double price}) {
    cartbox.add(CartModel(
      name: name,
      id: id,
      desc: desc,
      image: image,
      price: price,
      qty: 1,
    ));

    keys = cartbox.keys.toList();
  }

  void getProducts() {}
  void removeProcuct() {}
  void incrementQty() {}
  void decrementQty() {}
}
