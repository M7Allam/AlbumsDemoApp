import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:albums_demo_app/domain/usecases/albums_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_event.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_state.dart';


class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState>{

  final GetAlbumsUseCase getAlbumsUseCase;
  int page = 1;
  final List<Album> albums = [];

  AlbumsBloc(this.getAlbumsUseCase): super(LoadingAlbumsState()){
    on<GetAlbumsEvent>((event, emit) => _getAlbumsEvent());
    on<GetMoreAlbumsEvent>((event, emit) => _getMoreAlbumsEvent());
  }

  void _getAlbumsEvent() async{
    emit(LoadingAlbumsState());
    final result = await getAlbumsUseCase.execute(page);
    result.fold((Failure failure) {
      emit(ErrorAlbumsState(failure.message));
    }, (List<Album> list) {
      albums.addAll(list);
      emit(LoadedAlbumsState(albums));
    });
  }

  void _getMoreAlbumsEvent() async{
    page += 1;
    emit(LoadingMoreAlbumsState());
    final result = await getAlbumsUseCase.execute(page);
    result.fold((Failure failure) {
      emit(ErrorMoreAlbumsState(failure.message));
    }, (List<Album> list) {
      albums.addAll(list);
      emit(LoadedMoreAlbumsState(albums));
    });
  }



}