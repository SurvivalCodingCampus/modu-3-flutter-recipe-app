import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_state.dart';

class SignInViewModel with ChangeNotifier {
  SignInState _state = const SignInState();
  SignInState get state => _state;

  Future<void> updateEmail(String email) async {
    _state = _state.copyWith(email: email);
    notifyListeners();
  }

  Future<void> updatePassword(String password) async {
    _state = _state.copyWith(password: password);
    notifyListeners();
  }
}
