import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_appbar.dart';
import 'package:luxapp/pages/home_page.dart';
import 'package:luxapp/pages/store_page.dart';

import '../json/constant.dart';
import 'account_page.dart';
import 'cart_page.dart';
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
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        LoginPage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          itemsTab.length,
          (index) => IconButton(
            onPressed: () {
              setState(() {
                activeTab = index;
              });
            },
            icon: Icon(
              itemsTab[index]["icon"],
              size: itemsTab[index]["size"],
              color: activeTab == index ? Colors.amber : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
