import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  final String email;
  final String password;

  const SignInState({this.email = '', this.password = ''});
}
