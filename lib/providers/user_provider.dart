

import 'package:flutter/material.dart';

import '../core/models/app_user.dart';

class UserProvider extends ChangeNotifier{
AppUser? currentUser;
void updateUser(AppUser? user) {
  currentUser = user;
  notifyListeners();
}
void logout() {
  currentUser = null;
  notifyListeners();
}




}