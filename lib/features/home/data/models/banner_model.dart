class BannerModel {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  BannerModel({this.id, this.image, this.category, this.product});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: int.tryParse(json['id'].toString()),
        image: json['image']?.toString(),
        category: json['category'],
        product: json['product'],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (image != null) 'image': image,
        if (category != null) 'category': category,
        if (product != null) 'product': product,
      };
}
