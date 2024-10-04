import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_may/controller/cart_screen_controller.dart';
import 'package:shopping_cart_may/main.dart';
import 'package:shopping_cart_may/view/cart_screen/widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CartScreenController>().getProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerObj = context.watch<CartScreenController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    title: providerObj.cart[index].name.toString(),
                    desc: providerObj.cart[index].desc.toString(),
                    qty: providerObj.cart[index].qty.toString(),
                    image: providerObj.cart[index].image.toString(),
                    onIncrement: () {},
                    onDecrement: () {},
                    onRemove: () {
                      context.read<CartScreenController>().removeProcuct(index);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: providerObj.cart.length)),
      ),
    );
  }
}
