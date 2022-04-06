import 'package:flutter/material.dart';

class GetAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final IconButton? icnBtn;
  const GetAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.icnBtn,
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
