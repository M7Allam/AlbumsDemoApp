import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:albums_demo_app/domain/usecases/photos_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_event.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PhotosBloc extends Bloc<PhotosEvent, PhotosState>{

  final GetPhotosByAlbumIdUseCase getPhotosByAlbumIdUseCase;

  PhotosBloc(this.getPhotosByAlbumIdUseCase): super(LoadingPhotosState()){
    on<GetPhotosByAlbumIdEvent>((event, emit) => _getPhotosByAlbumIdEvent(event.albumId));
  }


  void _getPhotosByAlbumIdEvent(int albumId) async{
    emit(LoadingPhotosState());
    final result = await getPhotosByAlbumIdUseCase.execute(albumId);
    result.fold((Failure failure) {
      emit(ErrorPhotosState(failure.message));
    }, (List<Photo> list) {
      emit(LoadedPhotosState(list));
    });
  }



}