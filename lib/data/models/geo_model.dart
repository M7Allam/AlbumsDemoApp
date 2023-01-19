import 'package:albums_demo_app/domain/entities/geo.dart';

class GeoModel extends Geo {
  const GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json){
    return GeoModel(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }

}
