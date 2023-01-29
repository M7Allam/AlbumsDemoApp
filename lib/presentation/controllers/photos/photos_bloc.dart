import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:albums_demo_app/domain/usecases/photos_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_event.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PhotosBloc extends Bloc<PhotosEvent, PhotosState>{

  final GetPhotosByAlbumIdUseCase getPhotosByAlbumIdUseCase;

  PhotosBloc(this.getPhotosByAlbumIdUseCase): super(LoadingPhotosState()){
    _getPhotosByAlbumIdEvent();
  }


  void _getPhotosByAlbumIdEvent(){
    on<GetPhotosByAlbumIdEvent>((GetPhotosByAlbumIdEvent event, Emitter<PhotosState> emit) async{
      emit(LoadingPhotosState());
      final Either<Failure, List<Photo>> result = await getPhotosByAlbumIdUseCase.execute(event.albumId);
      result.fold((Failure failure) {
        emit(ErrorPhotosState(failure.message));
      }, (List<Photo> list) {
        emit(LoadedPhotosState(list));
      });
    });
  }



}