import 'package:equatable/equatable.dart';

class Geo extends Equatable{
  final double lat;
  final double lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props => <Object>[
    lat,
    lng,
  ];
}