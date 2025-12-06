import 'package:baytech/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String id = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().build(context),
      body: Column(
        children: [
          Container(
            height: 400,
            // future builder here;
          ),
          // bottom panel
        ],
      ),
    );
  }
}
