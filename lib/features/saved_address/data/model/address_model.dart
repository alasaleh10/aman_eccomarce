class AddressModel {
  num? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  num? latitude;
  num? longitude;

  AddressModel({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        city: json['city']?.toString(),
        region: json['region']?.toString(),
        details: json['details']?.toString(),
        notes: json['notes']?.toString(),
        latitude: num.tryParse(json['latitude'].toString()),
        longitude: num.tryParse(json['longitude'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (city != null) 'city': city,
        if (region != null) 'region': region,
        if (details != null) 'details': details,
        if (notes != null) 'notes': notes,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      };
}
