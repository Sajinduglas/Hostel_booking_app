import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthFunction {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   ///doubt username okkai angannai firebase il store cheyum
//   Future<String?> registerUser(
//       { required String Email, required String password}) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//         email: Email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }
//
class FirebaseAuthFunction {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> registerUser({required String email, required String pwd}) async {
    // signup
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
    return null;
  }
  // login
  Future<String?> loginUser(
      {required String email, required String pwd}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pwd);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
  }
  //signOut
  Future<void> logout() async {
    await auth.signOut();
  }
}


