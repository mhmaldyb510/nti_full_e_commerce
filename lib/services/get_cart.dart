import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';

Future<List<ProductModel>> getCart({required String id}) async {
  Dio dio = Dio();
  try {
    var response = await dio.get(
      'https://elwekala.onrender.com/cart/allProducts',
      data: {"nationalId": id},
    );
    if (response.statusCode == 200) {
      List jsonData = response.data['products']
          .map((e) => e as Map<String, dynamic>)
          .toList();
      List<ProductModel> products = [];
      for (var product in jsonData.cast<Map<String, dynamic>>()) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    } else {
      log(response.data.toString());
      throw Exception(
        response.data,
      );
    }
  } catch (e) {
    log(e.toString());
    throw Exception(e.toString());
  }
}
