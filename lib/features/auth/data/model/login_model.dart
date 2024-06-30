class LoginModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  LoginModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: int.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        image: json['image']?.toString(),
        points: json['points'].toString(),
        credit: json['credit'].toString(),
        token: json['token']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (image != null) 'image': image,
        if (points != null) 'points': points,
        if (credit != null) 'credit': credit,
        if (token != null) 'token': token,
      };
}
