import 'dart:math';
import 'package:food_delivery_app/data/models/product.dart';

class ProductService {
  static List<Product> generateDemoProducts(int pageKey, int pageSize) {
    List<Product> products = List.generate(pageSize, (index) {
      int id = pageKey + index + 1;
      return Product(
        id: id,
        name: 'Бүтээгдэхүүн $id',
        price: Random().nextInt(100) + 1,
        currency: '₮',
        asset: 'assets/images/food_sm.jpg',
      );
    });

    return products;
  }
}
