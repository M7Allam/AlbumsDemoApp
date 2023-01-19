import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:albums_demo_app/domain/repositories/base_albums_repository.dart';
import 'package:dartz/dartz.dart';

class GetAlbumsUseCase{
  final BaseAlbumsRepository baseAlbumsRepository;

  const GetAlbumsUseCase({
    required this.baseAlbumsRepository,
  });

  Future<Either<Failure, List<Album>>> execute(int page) async{
    return await baseAlbumsRepository.getAlbums(page);
  }

}