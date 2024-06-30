import 'cart_item.dart';

class PCartModel {
  List<CartItem>? cartItems;
  num? subTotal;
  num? total;

  PCartModel({this.cartItems, this.subTotal, this.total});

  factory PCartModel.fromJson(Map<String, dynamic> json) => PCartModel(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        subTotal: num.tryParse(json['sub_total'].toString()),
        total: num.tryParse(json['total'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (cartItems != null)
          'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        if (subTotal != null) 'sub_total': subTotal,
        if (total != null) 'total': total,
      };
}
