class Product {
  int? id;
  String? name;
  int? price;
  String? currency;
  String? asset;

  Product({
    this.id,
    this.name,
    this.price,
    this.currency,
    this.asset,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    asset = json['asset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['currency'] = currency;
    data['asset'] = asset;
    return data;
  }
}
