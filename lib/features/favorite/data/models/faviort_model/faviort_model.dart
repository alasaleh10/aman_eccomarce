import 'product.dart';

class FaviortModel {
  num? id;
  Product? product;

  FaviortModel({this.id, this.product});

  factory FaviortModel.fromJson(Map<String, dynamic> json) => FaviortModel(
        id: num.tryParse(json['id'].toString()),
        product: json['product'] == null
            ? null
            : Product.fromJson(Map<String, dynamic>.from(json['product'])),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (product != null) 'product': product?.toJson(),
      };
}
