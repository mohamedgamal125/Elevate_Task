part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
class ProductLoaded extends ProductState{
  final List<ProductModel> products;

  ProductLoaded({required this.products});
}

class ProductLoading extends ProductState{}
class ProductError extends ProductState{
  final String error;

  ProductError({required this.error});
}