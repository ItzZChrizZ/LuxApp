import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text(
            "Logout",
          ),
        ),
      ),
    );
  }
}
