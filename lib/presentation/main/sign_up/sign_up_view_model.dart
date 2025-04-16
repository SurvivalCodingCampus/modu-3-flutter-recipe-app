import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/main/sign_up/sign_up_state.dart';

class SignUpViewModel with ChangeNotifier {
  SignUpState _state = const SignUpState();
  SignUpState get state => _state;

  Future<void> updateEmail(String email) async {
    _state = _state.copyWith(email: email);
    notifyListeners();
  }

  Future<void> updatePassword(String password) async {
    _state = _state.copyWith(password: password);
    notifyListeners();
  }

  Future<void> updateName(String name) async {
    _state = _state.copyWith(name: name);
    notifyListeners();
  }

  Future<void> confirmPassword(String password) async {
    _state = _state.copyWith(password: password);
    notifyListeners();
  }
}
