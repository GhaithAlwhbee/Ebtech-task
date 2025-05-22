import 'package:ebtech_task/View/Screens/Cart/cart.dart';
import 'package:ebtech_task/View/Screens/Home/Widgets/card_home_widget.dart';
import 'package:ebtech_task/View/Screens/Products/products.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardHomeWidget(
              screenName: 'Products',
              imageName: 'producstImage.jpg',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsScreen())),
            ),
            CardHomeWidget(
              screenName: 'Cart',
              imageName: 'cartImage.jpg',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
