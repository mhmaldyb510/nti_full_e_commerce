part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ImageChangedState extends ProductState {
  final String image;
  ImageChangedState({required this.image});
}

final class DescriptionExpandedState extends ProductState {}

final class DescriptionCollapsedState extends ProductState {}

final class AddingToCartState extends ProductState {}

final class AddedToCartState extends ProductState {}
