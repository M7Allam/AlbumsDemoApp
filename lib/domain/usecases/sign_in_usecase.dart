import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:albums_demo_app/domain/repositories/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase{
  final BaseAuthRepository baseAuthRepository;

  const SignInUseCase({
    required this.baseAuthRepository,
  });

  Future<Either<Failure, User>> execute(String email, String password) async{
    return await baseAuthRepository.signInWithEmailAndPassword(email, password);
  }

}