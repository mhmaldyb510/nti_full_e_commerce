import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';
import 'package:nti_full_e_commerce/services/get_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getProducts({required String category}) async {
    try {
      List<ProductModel> products =
          await getProductsByCategory(category: category);
      emit(ProductsLoadedState(products: products));
    } catch (e) {
      log(e.toString());
      ProductsErrorState(error: e.toString());
    }
  }
}
