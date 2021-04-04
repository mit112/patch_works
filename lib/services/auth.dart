import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth;

  AuthService({this.auth});

  Stream<User> get authStateChanges => auth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
