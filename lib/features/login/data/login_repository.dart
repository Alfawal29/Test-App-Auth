import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  final authInstance = FirebaseAuth.instance;
  Stream<User?> get onAuthstateChanged => authInstance.authStateChanges();

  Future<void> loginUser(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
  }

Future<void> resetPassword(String email) async {
    await authInstance.sendPasswordResetEmail(email: email);
  }
  Future<void> logoutUser() async {
    await authInstance.signOut();
  }

  // Google Sign-In

  User? getUser() {
    return authInstance.currentUser;
  }

    Future<dynamic> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await authInstance.signInWithCredential(credential);
  }
   Future<bool> signOutFromGoogle() async {
    await GoogleSignIn().signOut();
    await authInstance.signOut();
    return true;
  }
}
