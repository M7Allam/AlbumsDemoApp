import 'package:albums_demo_app/core/error/failure.dart';
import 'package:albums_demo_app/domain/entities/user.dart';
import 'package:albums_demo_app/domain/usecases/sign_in_usecase.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_event.dart';
import 'package:albums_demo_app/presentation/controllers/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final SignInUseCase signInUseCase;
  bool isPasswordTextSecure = true;

  AuthBloc(this.signInUseCase): super(InitAuthState()){
    on<SecurePasswordTextAuthEvent>((event, emit) => _securePasswordTextEvent());
    on<SignInAuthEvent>((event, emit) => _signInEvent(event.email, event.password));

  }

  void _securePasswordTextEvent() {
    isPasswordTextSecure = !isPasswordTextSecure;
    emit(SecurePasswordTextAuthState(isPasswordTextSecure));
  }

  void _signInEvent(String email, String password) async{
    emit(LoadingAuthState());
    final result = await signInUseCase.execute(email, password);
    result.fold((Failure failure) {
      emit(ErrorAuthState(failure.message));
    }, (User user) {
      emit(LoginSuccessAuthState(user));
    });
  }


}