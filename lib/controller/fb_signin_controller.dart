import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbSignInController extends ChangeNotifier {
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    print(result.message);
    print(result.status);
    final AuthCredential? facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential!);
  }

  Future logout() async {
    // FirebaseAuth.instance.signOut();
    FacebookAuth.instance.logOut();
    notifyListeners();
  }
}
