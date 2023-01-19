import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:albums_demo_app/presentation/components/album_item.dart';
import 'package:albums_demo_app/presentation/components/photo_item.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_event.dart';
import 'package:albums_demo_app/presentation/controllers/albums/albums_state.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_bloc.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_event.dart';
import 'package:albums_demo_app/presentation/controllers/photos/photos_state.dart';
import 'package:albums_demo_app/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatelessWidget {

  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.read<AlbumsBloc>().add(const GetAlbumsEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.albums.tr(),
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AlbumsBloc, AlbumsState>(
          builder: (BuildContext context, AlbumsState state) {
            if (state is LoadingAlbumsState) {
              return _buildLoading();
            }
            if (state is ErrorAlbumsState) {
              return _buildError(state.failureMessage);
            }


            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _paginationScrollController(context),
              child: Column(
                children: <Widget>[
                  _buildAlbumsList(context.read<AlbumsBloc>().albums),
                  const SizedBox(height: 8.0,),
                  state is ErrorMoreAlbumsState? _buildError(state.failureMessage): _buildLoading(),
                  const SizedBox(height: 8.0,)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildAlbumsList(List<Album> albums) {
    return ListView.builder(
      //controller: scrollController,
      primary: false,
      shrinkWrap: true,
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return AlbumItem(
          album: albums[index],
          onTap: () {
            //TODO: showModal
            context
                .read<PhotosBloc>()
                .add(GetPhotosByAlbumIdEvent(albums[index].id));
            _showModalSheet(context, albums[index].id);
          },
        );
      },
    );
  }

  ScrollController _paginationScrollController(BuildContext context){
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if(context.read<AlbumsBloc>().page <= 10 && scrollController.position.atEdge){
        context.read<AlbumsBloc>().add(const GetMoreAlbumsEvent());
      }
    });
    return scrollController;
  }

  void _showModalSheet(BuildContext context, int albumId) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext contextBuilder) {
        return BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state is LoadingPhotosState) {
              return _buildLoading();
            }
            if (state is ErrorPhotosState) {
              return _buildError(state.failureMessage);
            }
            if (state is LoadedPhotosState) {
              return GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 6,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return PhotoItem(photo: state.photos[index]);
                },
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
