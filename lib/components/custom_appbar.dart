import 'package:flutter/material.dart';


class GetAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final Icon? icon2;
  final Icon? icon3;
  const GetAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.icon2,
    this.icon3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: icon,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}