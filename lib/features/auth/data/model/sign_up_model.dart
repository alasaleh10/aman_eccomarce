class SignUpModel {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  SignUpModel({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        email: json['email']?.toString(),
        id: int.tryParse(json['id'].toString()),
        image: json['image']?.toString(),
        token: json['token']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (email != null) 'email': email,
        if (id != null) 'id': id,
        if (image != null) 'image': image,
        if (token != null) 'token': token,
      };
}
