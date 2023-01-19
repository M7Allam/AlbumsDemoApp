import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/data/datasource/auth_remote_datasource.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:albums_demo_app/domain/repositories/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository{
  final BaseAuthRemoteDatasource baseAuthRemoteDatasource;

  AuthRepository({
    required this.baseAuthRemoteDatasource,
  });

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(String email, String password) async{
    final User user = await baseAuthRemoteDatasource.signInWithEmailAndPassword();
    try{
      return Right(user);
    } on ServerFailure catch(failure){
      return Left(ServerFailure(message: failure.message));
    }
  }



}