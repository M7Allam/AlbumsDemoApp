import 'package:albums_demo_app/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({
    required super.userId,
    required super.id,
    required super.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json){
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
