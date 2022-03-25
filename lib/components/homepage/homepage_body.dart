import 'package:flutter/material.dart';
import 'package:luxapp/components/main_slider.dart';
import 'package:luxapp/json/constant.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        MainSlider(
          items: slider,
        ),
      ],
    );
  }
}
