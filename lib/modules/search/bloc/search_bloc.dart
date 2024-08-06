import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final int productsPerPage = 20;
  int currentPage = 0;
  bool isFetching = false;

  SearchBloc() : super(SearchInitial()) {
    on<FetchSearchResults>(_onFetchSearchResults);
  }

  void _onFetchSearchResults(
      FetchSearchResults event, Emitter<SearchState> emit) async {
    if (isFetching) return;
    isFetching = true;

    final currentState = state;
    List<Product> products = [];
    if (currentState is SearchLoaded) {
      products = currentState.products;
    }

    emit(SearchLoading());
    try {
      final newProducts = await _fetchProductsFromApi(event.page);
      if (newProducts.isEmpty) {
        emit(SearchLoaded(
          products: products,
          hasReachedMax: true,
        ));
      } else {
        emit(SearchLoaded(
          products: products + newProducts,
          hasReachedMax: false,
        ));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    } finally {
      isFetching = false;
    }
  }

  Future<List<Product>> _fetchProductsFromApi(int page) async {
    // await Future.delayed(const Duration(seconds: 1));

    return List.generate(
      productsPerPage,
      (index) => Product(
        id: page * productsPerPage + index + 1,
        name: 'Бүтээгдэхүүн ${page * productsPerPage + index + 1}',
        price: (index + 1) * 10,
        currency: '₮',
        asset: 'assets/images/food_sm.jpg',
      ),
    );
  }
}
