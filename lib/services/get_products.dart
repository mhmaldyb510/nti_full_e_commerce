import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';

Future<List<ProductModel>> getProductsByCategory({required String category}) async {
  Dio dio = Dio();
  try {
    var response = await dio.get(
      'https://elwekala.onrender.com/product/$category',
    );
    List jsonData = response.data['product'];
    List<ProductModel> products = jsonData.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  } on DioException catch (e) {
    log(e.message ?? 'error');
    if (e.response != null) {
      return [e.response!.data];
    }
    return [];
  }
}
