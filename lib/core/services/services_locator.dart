import 'package:albums_demo_app/data/datasource/albums_remote_datasource.dart';
import 'package:albums_demo_app/data/datasource/auth_remote_datasource.dart';
import 'package:albums_demo_app/data/repositories/albums_repository.dart';
import 'package:albums_demo_app/data/repositories/auth_repository.dart';
import 'package:albums_demo_app/domain/repositories/base_albums_repository.dart';
import 'package:albums_demo_app/domain/repositories/base_auth_repository.dart';
import 'package:albums_demo_app/domain/usecases/albums_usecase.dart';
import 'package:albums_demo_app/domain/usecases/photos_usecase.dart';
import 'package:albums_demo_app/domain/usecases/sign_in_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

class ServicesLocator{

  void init(){
    _initAuthBloc();
    _initAlbumsBloc();
    _initPhotosBloc();
    _initSignInUseCase();
    _initGetAlbumsUseCase();
    _initGetPhotosByAlbumIdUseCase();
    _initAuthRepository();
    _initAlbumsRepository();
    _initAuthRemoteDatasource();
    _initAlbumsRemoteDataSource();
  }

  void _initAuthBloc(){
    serviceLocator.registerFactory(() => AuthBloc(serviceLocator()));
  }

  void _initAlbumsBloc(){
    serviceLocator.registerFactory(() => AlbumsBloc(serviceLocator()));
  }

  void _initPhotosBloc(){
    serviceLocator.registerFactory(() => PhotosBloc(serviceLocator()));
  }

  void _initAuthRemoteDatasource(){
    serviceLocator.registerLazySingleton<BaseAuthRemoteDatasource>(() => AuthRemoteDatasource());
  }

  void _initAlbumsRemoteDataSource(){
    serviceLocator.registerLazySingleton<BaseAlbumsRemoteDataSource>(() => AlbumsRemoteDataSource());
  }

  void _initAuthRepository(){
    serviceLocator.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(baseAuthRemoteDatasource: serviceLocator()));
  }

  void _initAlbumsRepository(){
    serviceLocator.registerLazySingleton<BaseAlbumsRepository>(() => AlbumsRepository(baseAlbumsRemoteDataSource: serviceLocator()));
  }

  void _initSignInUseCase(){
    serviceLocator.registerLazySingleton(() => SignInUseCase(baseAuthRepository: serviceLocator()));
  }

  void _initGetAlbumsUseCase(){
    serviceLocator.registerLazySingleton(() => GetAlbumsUseCase(baseAlbumsRepository: serviceLocator()));
  }

  void _initGetPhotosByAlbumIdUseCase(){
    serviceLocator.registerLazySingleton(() => GetPhotosByAlbumIdUseCase(baseAlbumsRepository: serviceLocator()));
  }

}