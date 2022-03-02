import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_example/moels/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  // Before
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Future signUn(email, password) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('aaaaaaaa');
      } else if (e.code == 'email -aarrr') {
        print("ggae");
      }
    } catch (e) {
      print(e);
    }
  }

  Future sigIn(email, password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
