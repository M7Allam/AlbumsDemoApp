import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:albums_demo_app/domain/usecases/albums_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_event.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_state.dart';


class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState>{

  final GetAlbumsUseCase getAlbumsUseCase;
  int page = 1;
  final List<Album> albums = <Album>[];

  AlbumsBloc(this.getAlbumsUseCase): super(LoadingAlbumsState()){
    _getAlbumsEvent();
    _getMoreAlbumsEvent();
  }

  void _getAlbumsEvent(){
    on<GetAlbumsEvent>((GetAlbumsEvent event, Emitter<AlbumsState> emit) async{
      emit(LoadingAlbumsState());
      final Either<Failure, List<Album>> result = await getAlbumsUseCase.execute(page);
      result.fold((Failure failure) {
        emit(ErrorAlbumsState(failure.message));
      }, (List<Album> list) {
        albums.addAll(list);
        emit(LoadedAlbumsState(albums));
      });
    });
  }

  void _getMoreAlbumsEvent(){
    on<GetMoreAlbumsEvent>((GetMoreAlbumsEvent event, Emitter<AlbumsState> emit) async{
      page += 1;
      emit(LoadingMoreAlbumsState());
      final Either<Failure, List<Album>> result = await getAlbumsUseCase.execute(page);
      result.fold((Failure failure) {
        emit(ErrorMoreAlbumsState(failure.message));
      }, (List<Album> list) {
        albums.addAll(list);
        emit(LoadedMoreAlbumsState(albums));
      });
    });

  }



}