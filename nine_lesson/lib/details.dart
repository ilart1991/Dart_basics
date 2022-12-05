import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Details {
  final String uuid;
  final String name;
  final String poster;
  final Address address;
  final double price;
  final double rating;
  final Services services;
  final List<String> photos;

  Details(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.price,
      required this.rating,
      required this.services,
      required this.photos});

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Address {
  final String country;
  final String street;
  final String city;
  final int zip_code;
  final Coords coords;

  Address(
      {required this.country,
      required this.street,
      required this.city,
      required this.zip_code,
      required this.coords});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Services {
  final List<String> free;
  final List<String> paid;

  Services({required this.free, required this.paid});

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double lan;

  Coords({required this.lat, required this.lan});

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}
