import 'package:albums_demo_app/domain/entities/photo.dart';

class PhotoModel extends Photo {
  const PhotoModel({
    required super.albumId,
    required super.id,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

}