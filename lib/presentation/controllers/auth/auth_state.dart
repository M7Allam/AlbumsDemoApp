import 'package:equatable/equatable.dart';
import 'package:albums_demo_app/domain/entities/user.dart';

abstract class AuthState extends Equatable{

  const AuthState();

  @override
  List<Object> get props => <Object>[];
}

class InitAuthState extends AuthState{}

class LoadingAuthState extends AuthState{}

class LoginSuccessAuthState extends AuthState{
  final User user;
  const LoginSuccessAuthState(this.user);

  @override
  List<Object> get props => <Object>[
    user,
  ];

}

class ErrorAuthState extends AuthState{
  final String failureMessage;
  const ErrorAuthState(this.failureMessage);

  @override
  List<Object> get props => <Object>[
    failureMessage,
  ];
}

class SecurePasswordTextAuthState extends AuthState{
  final bool isSecure;
  const SecurePasswordTextAuthState(this.isSecure);

  @override
  List<Object> get props => <Object>[
    isSecure,
  ];
}

