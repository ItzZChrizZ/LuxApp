import 'package:flutter/material.dart';
import 'package:luxapp/pages/account_page.dart';
import 'package:luxapp/pages/cart_page.dart';
import 'package:luxapp/pages/saved_page.dart';

enum _MenuValues {
  myAccount,
  myCart,
  mySave,
}

class GetAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? iconbutton;

  const GetAppBar({
    Key? key,
    required this.title,
    this.iconbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _iconbutton = iconbutton ?? false;
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: _iconbutton
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              ),
            )
          : IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        PopupMenuButton<_MenuValues>(
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              child: Text("My Account"),
              value: _MenuValues.myAccount,
            ),
            const PopupMenuItem(
              child: Text("My Cart"),
              value: _MenuValues.myCart,
            ),
            const PopupMenuItem(
              child: Text("My Favourites"),
              value: _MenuValues.mySave,
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case _MenuValues.myAccount:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AccountPage()));
                break;
              case _MenuValues.myCart:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartPage()));
                break;
              case _MenuValues.mySave:
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SavedPage()));
                break;
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
