import 'package:ebtech_task/data/models/product.dart';

class CartModel {
  int _quantity = 0;
  ProductModel? _product;
  double _price = 0;

  CartModel(int quantity, ProductModel? product) {
    _quantity = quantity;
    _product = product;
  }

  ProductModel? get product => _product;
  int get quantity => _quantity;
  double get price => _price;

  double getPrice() {
    _price = 0;

    return _price;
  }

  int getQuantity() {
    int q = 0;

    return q;
  }

  void increaseQuantity() {
    _quantity++;
  }

  void decreaseQuantity() {
    _quantity--;
  }

  CartModel.fromJson(Map<String, dynamic> json) {
    _price = json['price'].toDouble();

    _quantity = json['quantity'];
    if (json['product'] != null) {
      _product = ProductModel.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = _price;
    data['quantity'] = _quantity;
    data['product'] = _product!.toJson();
    return data;
  }
}
