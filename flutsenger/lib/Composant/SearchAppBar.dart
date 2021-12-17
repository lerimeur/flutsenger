import 'dart:developer';

import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundC;
  final TextEditingController searchcontroler = TextEditingController();
  final IconButton? iconButton;
  SearchAppBar({Key? key, required this.backgroundC, this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      leading: iconButton,

      title: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
        cursorColor: Colors.white,
        controller: searchcontroler,
      ),
      backgroundColor: Colors.black,
      // foregroundColor: Colors.white,
      // shadowColor: backgroundC,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
