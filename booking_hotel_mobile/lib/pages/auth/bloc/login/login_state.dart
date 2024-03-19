// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState({
    this.email = "",
    this.password = "",
  });
  @override
  List<Object?> get props => [
        email,
        password,
      ];

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
