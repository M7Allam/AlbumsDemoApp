import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository{

  Future<Either<Failure, User>> signInWithEmailAndPassword(String email, String password);
}