import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
      ],
    );
  }
}
