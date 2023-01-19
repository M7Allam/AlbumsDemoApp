import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:equatable/equatable.dart';

abstract class PhotosState extends Equatable{
  const PhotosState();

  @override
  List<Object> get props => <Object>[];
}


class LoadingPhotosState extends PhotosState{}

class LoadedPhotosState extends PhotosState{
  final List<Photo> photos;
  const LoadedPhotosState(this.photos);

  @override
  List<Object> get props => <Object>[
    photos,
  ];
}

class ErrorPhotosState extends PhotosState{
  final String failureMessage;
  const ErrorPhotosState(this.failureMessage);

  @override
  List<Object> get props => <Object>[
    failureMessage,
  ];
}
