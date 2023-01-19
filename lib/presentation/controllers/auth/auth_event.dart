import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object> get props => <Object>[];

}

class SecurePasswordTextAuthEvent extends AuthEvent{
  const SecurePasswordTextAuthEvent();

  @override
  List<Object> get props => <Object>[];
}

class SignInAuthEvent extends AuthEvent{
  final String email;
  final String password;

  const SignInAuthEvent(this.email, this.password);

  @override
  List<Object> get props => <Object>[
    email,
    password,
  ];
}