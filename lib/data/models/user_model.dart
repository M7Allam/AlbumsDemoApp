import 'package:albums_demo_app/data/models/address_model.dart';
import 'package:albums_demo_app/data/models/company_model.dart';
import 'package:albums_demo_app/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.username,
      required super.email,
      required super.phone,
      required super.website,
      required super.address,
      required super.company});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        address: AddressModel.fromJson(json['address']),
        company: CompanyModel.fromJson(json['company']),
    );
  }
}
