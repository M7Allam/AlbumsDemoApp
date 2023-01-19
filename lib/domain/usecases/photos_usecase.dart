import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/photo.dart';
import 'package:albums_demo_app/domain/repositories/base_albums_repository.dart';
import 'package:dartz/dartz.dart';

class GetPhotosByAlbumIdUseCase{
  final BaseAlbumsRepository baseAlbumsRepository;

  const GetPhotosByAlbumIdUseCase({
    required this.baseAlbumsRepository,
  });

  Future<Either<Failure, List<Photo>>> execute(int albumId) async{
    return await baseAlbumsRepository.getPhotosByAlbumId(albumId);
  }

}