import 'package:equatable/equatable.dart';

abstract class PhotosEvent extends Equatable{

  const PhotosEvent();

  @override
  List<Object> get props => <Object>[];

}

class GetPhotosByAlbumIdEvent extends PhotosEvent{
  final int albumId;
  const GetPhotosByAlbumIdEvent(this.albumId);

  @override
  List<Object> get props => <Object>[
    albumId,
  ];
}