import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia_auth_flutter/controller/fb_signin_controller.dart';
import 'package:socialmedia_auth_flutter/controller/google_signin_controller.dart';
import 'package:socialmedia_auth_flutter/pages/signed_in_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Login type'),
      ),
      body: loginButtonUI(),
    );
  }

  Widget loginButtonUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            label: const Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 20),
            ),
            icon: Image.asset(
              'assets/google.png',
              scale: 35,
              height: 25,
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.black,
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            onPressed: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .login();
            },
          ),

          //
          ElevatedButton.icon(
            label: const Text(
              'Sign in with Facebook',
              style: TextStyle(fontSize: 20),
            ),
            icon: Image.asset(
              'assets/fb.png',
              scale: 35,
              height: 25,
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.black,
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            onPressed: () async {
              await Provider.of<FbSignInController>(context, listen: false)
                  .signInWithFacebook();
            },
          ),
        ],
      ),
    );
  }
}
