import 'package:albums_demo_app/core/error/exceptions.dart';
import 'package:albums_demo_app/core/network/api_constants.dart';
import 'package:albums_demo_app/data/models/album_model.dart';
import 'package:albums_demo_app/data/models/photo_model.dart';
import 'package:dio/dio.dart';

abstract class BaseAlbumsRemoteDataSource{
  Future<List<AlbumModel>> getAlbums(int page);

  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId);
}

class AlbumsRemoteDataSource extends BaseAlbumsRemoteDataSource{
  @override
  Future<List<AlbumModel>> getAlbums(int page) async{
    final Response<dynamic> response = await Dio().get('${ApiConstants.baseUrl}/${ApiConstants.albumsEndpoint}?_page=$page');
    if(response.statusCode == 200){
      return List<AlbumModel>.from((response.data as List<dynamic>).map((dynamic e) => AlbumModel.fromJson(e)));
    }
    throw const ServerException(message: 'Server Error');
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async{
    final Response<dynamic> response = await Dio().get('${ApiConstants.baseUrl}/${ApiConstants.albumsEndpoint}/$albumId/${ApiConstants.photosEndpoint}');
    if(response.statusCode == 200){
      return List<PhotoModel>.from((response.data as List<dynamic>).map((dynamic e) => PhotoModel.fromJson(e)));
    }
    throw const ServerException(message: 'Server Error');
  }

}