import 'package:flutter/material.dart';


class LoginProvider with ChangeNotifier{
   String _email = "";
   String _password = "";
   bool _isLoading = false;

   String get email => _email;
   String get password => _password;
   bool get isLoading => _isLoading;

   void setEmail(String value) {
     _email = value;
     notifyListeners();
   }
   void setPassword(String value){
     _password = value;
     notifyListeners();
   }
   Future<void> login() async {
     if(_email.isEmpty || _password.isEmpty) {
       throw Exception("Please enter the valid login details");
     }
     _isLoading = true;
     notifyListeners();
     
     await Future.delayed(Duration(seconds: 2));
     _isLoading = false;
     notifyListeners();

   }
}