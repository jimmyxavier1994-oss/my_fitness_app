import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfitness/authservices/authserices.dart';

class Authprovider extends ChangeNotifier {
  var authser = Authservices();
  Future<bool> login(String email, String password) async {
    try {
      await authser.login(email, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> singin(String email, String password) async {
    try {
      await authser.signIn(email, password);
      return true;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print("ERROR CODE: ${e.code}");
        print("MESSAGE: ${e.message}");
      } else {
        print(e);
      }
      return false;
    }
  }
}

//   Future<bool> singin(String email, String password) async {
//     try {
//       await authser.signIn(email, password);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
