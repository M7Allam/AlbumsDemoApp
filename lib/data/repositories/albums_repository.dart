import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/data/datasource/albums_remote_datasource.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:albums_demo_app/domain/repositories/base_albums_repository.dart';
import 'package:dartz/dartz.dart';

class AlbumsRepository extends BaseAlbumsRepository{

  final BaseAlbumsRemoteDataSource baseAlbumsRemoteDataSource;

  AlbumsRepository({
    required this.baseAlbumsRemoteDataSource,
  });


  @override
  Future<Either<Failure, List<Album>>> getAlbums(int page) async{
    final List<Album> result = await baseAlbumsRemoteDataSource.getAlbums(page);
    try{
      return Right(result);
    }
    on ServerFailure catch(failure){
      return Left(ServerFailure(message: failure.message));
    }

  }

  @override
  Future<Either<Failure, List<Photo>>> getPhotosByAlbumId(int albumId) async{
    final List<Photo> result = await baseAlbumsRemoteDataSource.getPhotosByAlbumId(albumId);
    try{
      return Right(result);
    } on ServerFailure catch(failure){
      return Left(ServerFailure(message: failure.message));
    }
  }

}