import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_full_e_commerce/common/models/product_model.dart';
import 'package:nti_full_e_commerce/services/get_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCartItems({required String id}) async {
    emit(CartLoading());
    try {
   var protects = await getCart(id: id);
      emit(CartLoaded(products: protects));
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }
}
