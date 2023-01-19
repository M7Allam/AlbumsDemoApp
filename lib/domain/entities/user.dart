import 'package:albums_demo_app/domain/entities/address.dart';
import 'package:albums_demo_app/domain/entities/company.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  @override
  List<Object> get props => <Object>[
    id,
    name,
    username,
    email,
    phone,
    website,
    address,
    company,
  ];
}