import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_full_e_commerce/services/add_to_cart.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  changeProductImage(String image) {
    emit(ImageChangedState(image: image));
  }

  expandDescription() {
    emit(DescriptionExpandedState());
  }

  collapseDescription() {
    emit(DescriptionCollapsedState());
  }

  addToCart(String productId) async {
    emit(AddingToCartState());
    var response = await addProductToCart(productId);
    emit(AddedToCartState());
    return response;
  }
}
