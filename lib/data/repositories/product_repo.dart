import 'package:ebtech_task/data/datasource/dio_client.dart';
import 'package:ebtech_task/helper/api_error_handler.dart';
import 'package:ebtech_task/helper/api_responce.dart';
import 'package:ebtech_task/utill/app_constants.dart';

class ProductRepo{
  final DioClient dioClient;

  ProductRepo({required this.dioClient});



  Future<ApiResponse> getProductList() async {
    try {
      final response = await dioClient.get(
        AppConstants.productUri,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}