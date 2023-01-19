import 'package:equatable/equatable.dart';

abstract class AlbumsEvent extends Equatable{

  const AlbumsEvent();

  @override
  List<Object> get props => <Object>[];

}

class GetAlbumsEvent extends AlbumsEvent{
  const GetAlbumsEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMoreAlbumsEvent extends AlbumsEvent{
  const GetMoreAlbumsEvent();

  @override
  List<Object> get props => <Object>[];
}
