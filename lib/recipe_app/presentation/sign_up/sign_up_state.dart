import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({
    this.name = '',
    this.confirmPassword = '',
    this.email = '',
    this.password = '',
  });
}
