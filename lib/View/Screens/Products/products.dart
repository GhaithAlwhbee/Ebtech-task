import 'package:ebtech_task/View/Screens/Cart/cart.dart';
import 'package:ebtech_task/View/Screens/Products/Widgets/product_widget.dart';
import 'package:ebtech_task/provider/cart_provider.dart';
import 'package:ebtech_task/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    Provider.of<ProductsProvider>(context, listen: false).getProductList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: Consumer<ProductsProvider>(builder: (context, prodProvider, child) {
          return Center(
              child: prodProvider.productList != null
                  ? prodProvider.productList!.isNotEmpty
                      ? ListView.builder(
                          itemCount: prodProvider.productList!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: ProductWidget(product: prodProvider.productList![index]),
                            );
                          })
                      : const Text('No Data')
                  : const CircularProgressIndicator());
        }),
        floatingActionButton: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return cartProvider.numberOfItems < 1
                ? const SizedBox()
                : SizedBox(
                    width: 75,
                    height: 75,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                      },
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      child: Text(
                        cartProvider.numberOfItems.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
          },
        ));
  }
}
