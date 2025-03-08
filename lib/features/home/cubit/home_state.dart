part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductsLoadedState extends HomeState {
  final List<ProductModel> products;
  ProductsLoadedState({required this.products});
}

final class ProductsErrorState extends HomeState {
  final String error;
  ProductsErrorState({required this.error});
}
