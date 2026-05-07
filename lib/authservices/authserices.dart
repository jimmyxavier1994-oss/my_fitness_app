import 'package:firebase_auth/firebase_auth.dart';

class Authservices {
  signIn(String email, String password) async {
    var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  login(String email, String password) async {
    var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
