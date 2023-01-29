import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:albums_demo_app/domain/usecases/sign_in_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_event.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final SignInUseCase signInUseCase;
  bool isPasswordTextSecure = true;

  AuthBloc(this.signInUseCase): super(InitAuthState()){
    _securePasswordTextEvent();
    _signInEvent();
  }

  void _securePasswordTextEvent() {
    on<SecurePasswordTextAuthEvent>((SecurePasswordTextAuthEvent event, Emitter<AuthState> emit){
      isPasswordTextSecure = !isPasswordTextSecure;
      emit(SecurePasswordTextAuthState(isPasswordTextSecure));
    });
  }

  void _signInEvent(){
    on<SignInAuthEvent>((SignInAuthEvent event, Emitter<AuthState> emit) async{
      emit(LoadingAuthState());
      final Either<Failure, User> result = await signInUseCase.execute(event.email, event.password);
      result.fold((Failure failure) {
        emit(ErrorAuthState(failure.message));
      }, (User user) {
        emit(LoginSuccessAuthState(user));
      });
    });

  }


}