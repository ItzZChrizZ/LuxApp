// ignore_for_file: prefer_typing_uninitialized_variables, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luxapp/components/Homepage/custom_botnavbar.dart';
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
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

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
      bottomNavigationBar: GetBottomNavBar(
        selectedTab: _selectedTab,
        tabPressed: (num) {
          _tabsPageController.animateToPage(
            num,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeOutCubic,
          );
        },
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return PageView(
      controller: _tabsPageController,
      onPageChanged: (num) {
        setState(() {
          _selectedTab = num;
        });
      },
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
