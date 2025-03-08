part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductModel> products;
  CartLoaded({required this.products});
}

final class CartError extends CartState {
  final String errorMessage;
  CartError({required this.errorMessage});
}