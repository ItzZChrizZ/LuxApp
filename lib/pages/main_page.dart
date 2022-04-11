// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_appbar.dart';
import 'package:luxapp/pages/account_page.dart';
import 'package:luxapp/pages/categories_page.dart';
import 'package:luxapp/pages/home_page.dart';
import 'cart_page.dart';
import 'loading_page.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: "Lux",
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return PageView(
      children: [
        const HomePage(),
        const CategoriesPage(),
        const CartPage(),
        StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, streamSnapshot) {
            if (streamSnapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Error: ${streamSnapshot.error}"),
                ),
              );
            }
            if (streamSnapshot.connectionState == ConnectionState.active) {
              User? _user = streamSnapshot.data as User?;

              if (_user == null) {
                return const LoginPage();
              } else {
                return const AccountPage();
              }
            }
            return const LoadingPage();
          },
        ),
      ],
    );
  }
}
