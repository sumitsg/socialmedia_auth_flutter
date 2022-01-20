import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia_auth_flutter/controller/fb_signin_controller.dart';
import 'package:socialmedia_auth_flutter/controller/google_signin_controller.dart';
import 'package:socialmedia_auth_flutter/pages/login_page.dart';

class SignedInPage extends StatelessWidget {
  const SignedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return LoggedInWidget(context);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Error'),
            );
          } else {
            // ! return to Login UI Page
            return const LoginPage();
          }
        },
      ),
    );
  }
}

LoggedInWidget(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .logout();

              Provider.of<FbSignInController>(context, listen: false).logout();
            },
            icon: const Icon(Icons.logout)),
      ],
      title: const Text(
        'Logged In',
        style: TextStyle(fontSize: 25),
      ),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user!.photoURL ?? ''),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Name :-' + user.displayName!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          user.email == null
              ? const Text(
                  'Email :- NA',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              : Text(
                  'Email :-' + user.email!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
        ],
      ),
    ),
  );
}

// FbLoggedInWidget(BuildContext context) {
//   final user = FirebaseAuth.instance.currentUser;
//   return Scaffold(
//     appBar: AppBar(
//       centerTitle: true,
//       actions: [
//         IconButton(
//             onPressed: () {
//               final provider =
//                   Provider.of<FbSignInController>(context, listen: false)
//                       .logout();
//             },
//             icon: const Icon(Icons.logout)),
//       ],
//       title: const Text(
//         'Logged In',
//         style: TextStyle(fontSize: 25),
//       ),
//     ),
//     body: Container(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Profile',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           CircleAvatar(
//             radius: 70,
//             backgroundImage: NetworkImage(user!.photoURL ?? ''),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Text(
//             'Name :-' + user.displayName!,
//             style: const TextStyle(
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           user.email == null
//               ? const Text(
//                   'Email :- NA',
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 )
//               : Text(
//                   'Email :-' + user.email!,
//                   style: const TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//         ],
//       ),
//     ),
//   );
// }
