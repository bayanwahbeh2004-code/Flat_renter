import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/components/costum_button.dart';

class Deletwidget extends StatelessWidget {
  final Register request;
  const Deletwidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.25,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color.fromARGB(255, 239, 205, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(149, 82, 82, 82),
            spreadRadius: 6,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(request.profilePicturePath!),
          Text(request.firstName! + " "),
          Text(request.secondName!),
          Spacer(flex: 12),
          CostumButton(
            text: 'Approve',
            textColor: Colors.white,
            buttonColor: Colors.green,
            onTap: () {},
            height: 30,
            width: 80,
          ),
          Spacer(flex: 1),
          CostumButton(
            text: 'Cancel',
            textColor: Colors.white,
            buttonColor: Colors.red,
            onTap: () {},
            height: 30,
            width: 80,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
