import 'package:albums_demo_app/domain/entities/album.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumsState extends Equatable{
  const AlbumsState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingAlbumsState extends AlbumsState{}

class LoadedAlbumsState extends AlbumsState{
    final List<Album> albums;
    const LoadedAlbumsState(this.albums);

    @override
    List<Object> get props => <Object>[
      albums,
    ];
}

class ErrorAlbumsState extends AlbumsState{
  final String failureMessage;
  const ErrorAlbumsState(this.failureMessage);

  @override
  List<Object> get props => <Object>[
    failureMessage,
  ];
}

class LoadingMoreAlbumsState extends AlbumsState{}

class LoadedMoreAlbumsState extends AlbumsState{
  final List<Album> albums;
  const LoadedMoreAlbumsState(this.albums);

  @override
  List<Object> get props => <Object>[
    albums,
  ];
}

class ErrorMoreAlbumsState extends AlbumsState{
  final String failureMessage;
  const ErrorMoreAlbumsState(this.failureMessage);

  @override
  List<Object> get props => <Object>[
    failureMessage,
  ];
}


