import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'package:food_delivery_app/modules/product/bloc/product_bloc.dart';
import 'package:food_delivery_app/modules/product/bloc/product_event.dart';
import 'package:food_delivery_app/modules/product/bloc/product_state.dart';
import 'package:food_delivery_app/shared/product_detail/product_bottom_sheet.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: const ProductsScreenView(),
    );
  }
}

class ProductsScreenView extends StatefulWidget {
  const ProductsScreenView({super.key});

  @override
  State<ProductsScreenView> createState() => _ProductsScreenViewState();
}

class _ProductsScreenViewState extends State<ProductsScreenView> {
  static const _pageSize = 20;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: _listener,
      child: PagedListView<int, Product>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, item, index) => ListTile(
            leading: Image.asset(
              item.asset ?? 'assets/images/food_sm.jpg',
              fit: BoxFit.fill,
            ),
            title: Text(item.name ?? ''),
            subtitle: Text('${item.price ?? 0}${item.currency ?? ''}'),
            onTap: () {
              showProductDetail(context, item);
            },
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, ProductState state) {
    if (state is ProductLoadSuccess) {
      final isLastPage = state.isLastPage;
      if (isLastPage) {
        _pagingController.appendLastPage(state.products);
      } else {
        final nextPageKey = state.products.length;
        _pagingController.appendPage(state.products, nextPageKey);
      }
    } else if (state is ProductLoadFailure) {
      _pagingController.error = state.error;
    }
  }

  void _fetchPage(int pageKey) {
    context.read<ProductBloc>().add(FetchProducts(pageKey, _pageSize));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
