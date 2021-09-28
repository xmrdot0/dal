import 'package:dal/models/auth/i_auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthFacade implements IAuthFacade {
  FireBaseAuthFacade(this.firebaseAuth);
  FirebaseAuth firebaseAuth;
  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String? email, String? password) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
