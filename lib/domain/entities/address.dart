import 'package:albums_demo_app/domain/entities/geo.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable{
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  List<Object> get props => <Object>[
    street,
    suite,
    city,
    zipcode,
    geo,
  ];

}