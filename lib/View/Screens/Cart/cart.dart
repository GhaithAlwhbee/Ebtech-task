import 'package:ebtech_task/View/Screens/Cart/Widgets/cart_widget.dart';
import 'package:ebtech_task/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        return Center(
            child: cartProvider.cartList != null
                ? cartProvider.cartList!.isNotEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: ListView.builder(
                                itemCount: cartProvider.cartList!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: CartProductWidget(
                                        cartModel: cartProvider.cartList![index],
                                        index: index,
                                      ));
                                }),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(border: Border(top: BorderSide(width: 0.2))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total: \$${cartProvider.getTotalPrice().toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10), // Set desired radius
                                            ),
                                          ),
                                          child: const Text(
                                            'CHECKOUT',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : const Text('No Data')
                : const CircularProgressIndicator());
      }),
    );
  }
}
