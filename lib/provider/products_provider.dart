import 'package:ebtech_task/View/Base/custom_snackbar.dart';
import 'package:ebtech_task/data/models/product.dart';
import 'package:ebtech_task/data/repositories/product_repo.dart';
import 'package:ebtech_task/helper/api_responce.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductsProvider({required this.productRepo});

  List<ProductModel>? _productList ;
  bool _isLoading = false;

  List<ProductModel>? get productList => _productList;
  bool get isLoading => _isLoading;

  Future<void> getProductList(BuildContext context) async {
    ApiResponse apiResponse = await productRepo.getProductList();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _productList = [];

      // _productList.addAll(
      //     List<ProductModel>.from(json.decode(apiResponse.response!.data).map((x) => ProductModel.fromJson(x))));
      _productList!.addAll(List<ProductModel>.from(apiResponse.response!.data.map((x) => ProductModel.fromJson(x))));

      _isLoading = false;
      notifyListeners();
    } else {
      showCustomSnackBar(apiResponse.error.toString(), context);
    }
  }
}
