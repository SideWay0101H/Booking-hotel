import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String fullname;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState(
      {this.fullname = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});
  RegisterState copyWith({
    String? fullname,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.password);
  }

  @override
  List<Object> get props => [fullname, email, password];
}
