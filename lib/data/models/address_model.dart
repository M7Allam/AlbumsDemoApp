import 'package:albums_demo_app/data/models/geo_model.dart';
import 'package:albums_demo_app/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo});

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }
}
