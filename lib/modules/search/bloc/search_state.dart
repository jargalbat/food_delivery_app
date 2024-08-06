import 'package:food_delivery_app/data/models/product.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Product> products;
  final bool hasReachedMax;

  SearchLoaded({required this.products, required this.hasReachedMax});
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
