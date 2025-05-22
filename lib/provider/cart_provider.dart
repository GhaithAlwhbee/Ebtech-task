import 'package:ebtech_task/data/models/cart.dart';
import 'package:ebtech_task/data/models/product.dart';
import 'package:ebtech_task/data/repositories/cart_repo.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final CartRepo cartRepo;
  CartProvider({required this.cartRepo});

  List<CartModel>? _cartList;
  final double _amount = 0.0;
  int numberOfItems = 0;

  List<CartModel>? get cartList => _cartList;
  double get amount => _amount;

  void addToCart(ProductModel product) {
    CartModel cartModel = CartModel(1, product);
    _cartList ??= [];
    int indexOfProduct = isExist(product);
    if (indexOfProduct < 0) {
      _cartList!.add(cartModel);
      numberOfItems++;
      notifyListeners();
      cartRepo.saveCartListTolocal(_cartList!);
    } else {
      updateProductInCart(indexOfProduct, true);
    }
  }

  void updateProductInCart(int index, bool increaseQuantity) {
    if (!increaseQuantity) {
      _cartList![index].decreaseQuantity();
      numberOfItems--;
      if (_cartList![index].quantity < 1) {
        _cartList!.removeAt(index);
      }
    } else {
      _cartList![index].increaseQuantity();
      numberOfItems++;
    }
    cartRepo.saveCartListTolocal(_cartList!);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    if (_cartList == null || _cartList!.isEmpty) {
      return totalPrice;
    } else {
      for (var item in _cartList!) {
        totalPrice += item.product!.price * item.quantity;
      }
    }

    return totalPrice;
  }

  int isExist(ProductModel product) {
    for (var item in _cartList!) {
      if (item.product!.id == product.id) {
        return _cartList!.indexOf(item);
      }
    }
    return -1;
  }

  void getCartListFromLocal() {
    numberOfItems = 0;
    _cartList = cartRepo.getCartListFromLocal();
    for (var cartProduct in _cartList!) {
      numberOfItems = numberOfItems + cartProduct.quantity;
    }
    notifyListeners();
  }
}
