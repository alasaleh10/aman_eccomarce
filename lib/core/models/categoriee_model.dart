class CategorieeModel {
  int? id;
  String? name;
  String? image;

  CategorieeModel({this.id, this.name, this.image});

  factory CategorieeModel.fromJson(Map<String, dynamic> json) {
    return CategorieeModel(
      id: int.tryParse(json['id'].toString()),
      name: json['name']?.toString(),
      image: json['image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (image != null) 'image': image,
      };
}
