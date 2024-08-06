import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'product_detail_screen.dart';

void showProductDetail(BuildContext context, Product product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        width: double.infinity,
        child: ProductDetailScreen(product: product),
      );
    },
  );
}
