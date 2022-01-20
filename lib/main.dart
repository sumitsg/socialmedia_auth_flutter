import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia_auth_flutter/controller/fb_signin_controller.dart';
import 'package:socialmedia_auth_flutter/controller/google_signin_controller.dart';
import 'package:socialmedia_auth_flutter/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socialmedia_auth_flutter/pages/signed_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return GoogleSignInController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return FbSignInController();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignedInPage(),
      ),
    );
  }
}

//  keytool -exportcert -alias androiddebugkey -keystore "C:\Users\Neosoft\.android\debug.keystore" | "C:\Users\Neosoft\Documents\openssl-0.9.8k_X64\bin\openssl" sha1 -binary | "C:\Users\Neosoft\Documents\openssl-0.9.8k_X64\bin\openssl" base64 