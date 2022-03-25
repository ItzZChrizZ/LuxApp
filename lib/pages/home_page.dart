import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_appbar.dart';
import 'package:luxapp/components/homepage/homepage_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const GetAppBar(
        title: 'LuX',
        icon: Icon(Icons.menu, color: Colors.black),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return const HomePageBody();
  }
}
