import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/modules/search/bloc/search_bloc.dart';
import 'package:food_delivery_app/modules/search/bloc/search_event.dart';
import 'package:food_delivery_app/modules/search/bloc/search_state.dart';
import 'package:food_delivery_app/modules/search/widgets/product_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc()..add(FetchSearchResults(0)),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial ||
            state is SearchLoading && state is! SearchLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchError) {
          return const Center(
              child: Text('Бүтээгдэхүүний мэдээлэл олдсонгүй.'));
        } else if (state is SearchLoaded) {
          return GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
            ),
            itemCount: state.hasReachedMax
                ? state.products.length
                : state.products.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.products.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return ProductTile(product: state.products[index]);
            },
            padding: const EdgeInsets.all(5.0),
          );
        } else {
          return const Center(child: Text('Мэдээлэл олдсонгүй.'));
        }
      },
    );
  }

  void _onScroll() {
    if (_isCloseToBottom()) {
      context
          .read<SearchBloc>()
          .add(FetchSearchResults((context.read<SearchBloc>().currentPage++)));
    }
  }

  bool _isCloseToBottom() {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= 200;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
