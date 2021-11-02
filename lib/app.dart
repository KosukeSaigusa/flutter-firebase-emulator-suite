import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_emulator_suite_sample/pages/home_page.dart';
import 'package:firebase_emulator_suite_sample/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Emulator sample',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            return HomePage();
          }
          return SignInPage();
        },
      ),
    );
  }
}
