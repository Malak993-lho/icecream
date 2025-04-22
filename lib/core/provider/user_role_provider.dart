import 'package:flutter/material.dart';

class UserRoleProvider extends ChangeNotifier {
  String _role = 'Client'; // Default role

  String get role => _role;

  bool get isClient => _role == 'Client';
  bool get isFreelancer => _role == 'Freelancer';

  void setRole(String newRole) {
    _role = newRole;
    notifyListeners();
  }
}
