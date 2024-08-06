import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/data/models/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadInProgress extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<Product> products;
  final bool isLastPage;

  const ProductLoadSuccess({
    required this.products,
    required this.isLastPage,
  });

  @override
  List<Object> get props => [products, isLastPage];
}

class ProductLoadFailure extends ProductState {
  final String error;

  const ProductLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
