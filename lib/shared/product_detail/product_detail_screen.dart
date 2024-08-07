import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/models/product.dart';
import 'package:food_delivery_app/shared/constants.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeightTiny,
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 8, 8),
              child: Text(
                product.name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            kHeightTiny,
            Image.asset('assets/images/food_md.jpg'),
            kHeightTiny,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.price ?? 0}${product.currency ?? ''}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  kHeightMedium,
                  Text(
                    'Бүтээгдэхүүний тухай',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  kHeightTiny,
                  Text(
                    'Бүтээгдэхүүний талаар дэлгэрэнгүй мэдээлэл...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),

        // Close
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
