import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAlbumsRepository{

  Future<Either<Failure, List<Album>>> getAlbums(int page);

  Future<Either<Failure, List<Photo>>> getPhotosByAlbumId(int albumId);
}