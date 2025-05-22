import 'package:ebtech_task/View/Base/custom_snackbar.dart';
import 'package:ebtech_task/data/models/product.dart';
import 'package:ebtech_task/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    product.image,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.w500, height: 1.5, overflow: TextOverflow.fade),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${product.price} \$"),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addToCart(product);
                      showCustomSnackBar('Added to cart', context, isError: false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set desired radius
                      ),
                    ),
                    child: const Text('ADD TO CART')),
              )
            ],
          ),
        ));
  }
}
