import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  final AuthService _authService = AuthService();

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _authService.login(email, password);
      _user = User.fromJson(data);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw e;
    }
  }

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _authService.signUp(email, password);
      _user = User.fromJson(data);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw e;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  // Future<void> tryAutoLogin() async {
  //   final token = await _authService.getToken();
  //   if (token != null) {
  //     // You can extend this to fetch the user details using the token
  //     _user = User(id: 'id', email: 'email', token: token);
  //   }
  //   notifyListeners();
  // }
}
