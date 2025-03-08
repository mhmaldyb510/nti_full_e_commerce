import 'dart:developer';

import 'package:dio/dio.dart';

addProductToCart(String productId) async {
  Dio dio = Dio();
  try {
    return await dio.post('https://elwekala.onrender.com/cart/add', data: {
      "nationalId": "01056710052789",
      "productId": productId,
      "quantity": "1",
    });
  } catch (e) {
    log(e.toString());
  }
}
