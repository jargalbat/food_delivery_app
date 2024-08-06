import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'package:food_delivery_app/data/services/product_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    final currentState = state;
    if (currentState is ProductLoadInProgress) return;

    emit(ProductLoadInProgress());

    try {
      final products =
          ProductService.generateDemoProducts(event.pageKey, event.pageSize);
      final isLastPage = products.length < event.pageSize;

      if (currentState is ProductLoadSuccess) {
        final updatedProducts = List<Product>.from(currentState.products)
          ..addAll(products);
        emit(ProductLoadSuccess(
            products: updatedProducts, isLastPage: isLastPage));
      } else {
        emit(ProductLoadSuccess(products: products, isLastPage: isLastPage));
      }
    } catch (error) {
      emit(ProductLoadFailure(error.toString()));
    }
  }
}
